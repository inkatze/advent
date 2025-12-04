defmodule Advent2025.Day2 do
  @external_resource "priv/inputs/2025/day2.txt"
  @id_ranges "priv/inputs/2025/day2.txt"
             |> File.read!()
             |> String.split(",", trim: true)

  @spec check_ranges(list(String.t()), :part1 | :part2) :: integer()
  def check_ranges(ranges \\ @id_ranges, type \\ :part2) do
    Enum.map(ranges, fn range -> find_pattern(range, type) end) |> List.flatten() |> Enum.sum()
  end

  @spec find_pattern(String.t(), :part1 | :part2) :: list(integer())
  def find_pattern(range, type) do
    [start, finish] =
      String.split(range, "-")
      |> Enum.map(fn range_limit -> String.replace(range_limit, "\n", "") end)
      |> Enum.map(&String.to_integer/1)

    Enum.filter(start..finish, fn range -> elf_id_found?(range, type) end)
  end

  @spec elf_id_found?(integer(), :part1 | :part2) :: boolean()
  def elf_id_found?(number, type) do
    number_array_string = Integer.to_string(number) |> String.graphemes()
    id_size = length(number_array_string)

    even_chunk_sizes =
      case type do
        :part1 -> if rem(id_size, 2) == 0, do: [div(id_size, 2)], else: []
        :part2 -> divisors(id_size)
      end

    any_response =
      Enum.any?(even_chunk_sizes, fn chunk_size ->
        is_code_elfed?(number_array_string, chunk_size)
      end)

    any_response
  end

  @spec divisors(integer()) :: list(integer())
  def divisors(n) do
    for i <- 1..n, rem(n, i) == 0 and i < n, do: i
  end

  @spec is_code_elfed?(list(String.t()), integer()) :: boolean()
  def is_code_elfed?(number, chunk_size),
    do: number |> Enum.chunk_every(chunk_size) |> Enum.uniq() |> length() == 1
end
