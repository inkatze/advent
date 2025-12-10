defmodule Advent2025.Day3 do
  @external_resource "priv/inputs/2025/day3.txt"
  @batteries "priv/inputs/2025/day3.txt"
             |> File.read!()
             |> String.split("\n", trim: true)

  def two_battery_selector(batteries \\ @batteries, size \\ 2),
    do: battery_selector(batteries, size)

  def twelve_battery_selector(batteries \\ @batteries, size \\ 12),
    do: battery_selector(batteries, size)

  defp battery_selector(batteries, size) do
    Enum.map(batteries, &max_sequential_joltage(&1, size)) |> Enum.sum()
  end

  @spec max_sequential_joltage(String.t(), integer()) :: integer()
  def max_sequential_joltage(battery, size) do
    battery
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
    |> find_sequence(size)
    |> Enum.join()
    |> String.to_integer()
  end

  @spec find_sequence(list(integer()), integer(), list(integer())) :: list(integer())
  defp find_sequence(joltages, size, start_index \\ 0, acc \\ [])

  defp find_sequence(_joltages, 0, _start_index, acc) do
    acc
  end

  defp find_sequence(joltages, 1, start_index, acc) do
    acc ++ [Enum.slice(joltages, start_index, length(joltages)) |> Enum.max()]
  end

  defp find_sequence(joltages, size, start_index, acc) do
    slice_end = length(joltages) - size

    {value, index} =
      Enum.slice(Enum.with_index(joltages), start_index, slice_end - start_index + 1)
      |> Enum.max_by(fn {val, idx} -> {val, -idx} end)

    find_sequence(joltages, size - 1, index + 1, acc ++ [value])
  end
end
