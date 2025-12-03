defmodule Advent2025.Day2Test do
  use ExUnit.Case, async: true

  alias Advent2025.Day2

  describe "find elfed codes part 1" do
    test "two invalid ids with chunk size 1" do
      assert Day2.check_ranges_part1(["11-22"]) == 33
      assert Day2.check_ranges_part1(["95-115"]) == 99
    end

    test "full part 1 test" do
      ranges = [
        "11-22",
        "95-115",
        "998-1012",
        "1188511880-1188511890",
        "222220-222224",
        "1698522-1698528",
        "446443-446449",
        "38593856-38593862"
      ]

      assert Day2.check_ranges_part1(ranges) == 1_227_775_554
    end
  end
end
