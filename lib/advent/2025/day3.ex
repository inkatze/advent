defmodule Advent2025.Day3 do
  @external_resource "priv/inputs/2025/day3.txt"
  @batteries "priv/inputs/2025/day3.txt"
             |> File.read!()
             |> String.split("\n", trim: true)

  @spec battery_selector(list(String.t())) :: integer()
  def battery_selector(batteries \\ @batteries) do
    Enum.map(batteries, &max_sequential_joltage/1) |> Enum.sum()
  end

  @spec max_sequential_joltage(String.t()) :: integer()
  def max_sequential_joltage(battery) do
    battery
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
    |> find_max_sequential_two_digits()
  end

  @spec find_max_sequential_two_digits(list(integer())) :: integer()
  def find_max_sequential_two_digits(joltages) do
    joltages_with_index = Enum.with_index(joltages)

    [{largest_value, largest_value_pos}, {second_largest_value, second_largest_value_pos} | _] =
      Enum.sort(joltages_with_index, :desc)

    case largest_value - second_largest_value do
      0 ->
        "#{largest_value}#{largest_value}"

      _ ->
        if largest_value == List.last(joltages),
          do: "#{second_largest_value}#{largest_value}",
          else:
            if(second_largest_value_pos > largest_value_pos,
              do: "#{largest_value}#{second_largest_value}",
              else:
                "#{largest_value}#{Enum.max(Enum.slice(joltages, largest_value_pos + 1, Enum.count(joltages)))}"
            )
    end
    |> String.to_integer()
  end
end
