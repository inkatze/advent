defmodule Advent2025.Day1 do
  @external_resource "priv/inputs/2025/day1.txt"
  @turns "priv/inputs/2025/day1.txt"
         |> File.read!()
         |> String.split("\n", trim: true)

  @spec decode_password(integer(), list(String.t())) :: integer()
  def decode_password(initial_number \\ 50, turns \\ @turns) do
    turns
    |> Enum.scan(initial_number, &process_turn/2)
    |> Enum.count(&(&1 == 0))
  end

  @spec process_turn(String.t(), integer()) :: integer()
  defp process_turn(<<direction::binary-size(1), value::binary>>, position) do
    apply_turn(direction, position, String.to_integer(value)) |> rem(100)
  end

  @spec apply_turn(String.t(), integer(), integer()) :: integer()
  defp apply_turn("L", position, value), do: position - value
  defp apply_turn("R", position, value), do: position + value
end
