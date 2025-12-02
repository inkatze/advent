defmodule Advent2025.Day1 do
  @moduledoc """
  Advent of Code 2025 Day 1: Circular navigation puzzle.
  """

  @external_resource "priv/inputs/2025/day1.txt"
  @turns "priv/inputs/2025/day1.txt"
         |> File.read!()
         |> String.split("\n", trim: true)

  @spec decode_password_part_1(integer(), list(String.t())) :: integer()
  def decode_password_part_1(initial_number \\ 50, turns \\ @turns) do
    {_final_position, zero_count} =
      Enum.reduce(turns, {initial_number, 0}, fn turn, {position, count} ->
        new_position = apply_turn_with_wrap(turn, position)
        new_count = if new_position == 0, do: count + 1, else: count
        {new_position, new_count}
      end)

    zero_count
  end

  @spec decode_password_part_2(integer(), list(String.t())) :: integer()
  def decode_password_part_2(initial_number \\ 50, turns \\ @turns) do
    {_final_position, total_crossings} =
      Enum.reduce(turns, {initial_number, 0}, fn turn, {position, crossings} ->
        {direction, steps} = parse_turn(turn)

        zero_crossings = count_zero_crossings(direction, position, steps)
        new_position = position |> apply_turn(direction, steps) |> Integer.mod(100)

        {new_position, crossings + zero_crossings}
      end)

    total_crossings
  end

  @spec apply_turn_with_wrap(String.t(), integer()) :: integer()
  defp apply_turn_with_wrap(turn, position) do
    {direction, steps} = parse_turn(turn)
    position |> apply_turn(direction, steps) |> Integer.mod(100)
  end

  @spec parse_turn(String.t()) :: {String.t(), integer()}
  defp parse_turn(<<direction::binary-size(1), value::binary>>) do
    {direction, String.to_integer(value)}
  end

  @spec count_zero_crossings(String.t(), integer(), integer()) :: integer()
  defp count_zero_crossings("R", position, value), do: div(position + value, 100)
  defp count_zero_crossings("L", 0, value), do: div(value, 100)

  defp count_zero_crossings("L", position, value) when value >= position,
    do: div(value - position, 100) + 1

  defp count_zero_crossings("L", _position, _value), do: 0

  @spec apply_turn(integer(), String.t(), integer()) :: integer()
  defp apply_turn(position, "L", steps), do: position - steps
  defp apply_turn(position, "R", steps), do: position + steps
end
