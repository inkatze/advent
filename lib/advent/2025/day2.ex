defmodule Advent2025.Day2 do
  @external_resource "priv/inputs/2025/day2.txt"
  @id_ranges "priv/inputs/2025/day2.txt"
             |> File.read!()
             |> String.split(",", trim: true)

  @spec check_ranges_part1(list(String.t())) :: integer()
  def check_ranges_part1(ranges \\ @id_ranges) do
    Enum.map(ranges, &find_pattern/1) |> List.flatten() |> Enum.sum()
  end

  @spec find_pattern(String.t()) :: list(integer())
  def find_pattern(range) do
    [start, finish] =
      String.split(range, "-")
      |> Enum.map(fn range_limit -> String.replace(range_limit, "\n", "") end)
      |> Enum.map(&String.to_integer/1)

    Enum.filter(start..finish, &elf_id_found?/1)
  end

  @spec elf_id_found?(integer()) :: boolean()
  def elf_id_found?(number) do
    number_array_string = Integer.to_string(number) |> String.graphemes()
    even_chunk_sizes = divisors(length(number_array_string))

    any_response =
      Enum.any?(even_chunk_sizes, fn chunk_size ->
        is_code_elfed?(number_array_string, chunk_size)
      end)

    any_response
  end

  @spec divisors(integer()) :: list(integer())
  def divisors(n) do
    for i <- 1..n, rem(n, i) == 0 and i < n and div(n, i) == 2, do: i
  end

  @spec is_code_elfed?(list(String.t()), integer()) :: boolean()
  def is_code_elfed?(number, chunk_size),
    do: number |> Enum.chunk_every(chunk_size) |> Enum.uniq() |> length() == 1
end
