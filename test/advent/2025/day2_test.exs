defmodule Advent2025.Day2Test do
  use ExUnit.Case, async: true

  alias Advent2025.Day2

  describe "find elfed codes part 1" do
    test "two invalid ids with chunk size 1" do
      assert Day2.check_ranges(["11-22"], :part1) == 33
      assert Day2.check_ranges(["95-115"], :part1) == 99
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

      assert Day2.check_ranges(ranges, :part1) == 1_227_775_554
    end
  end

  describe "find elfed codes part 2" do
    test "two invalid ids with chunk size 1" do
      assert Day2.check_ranges(["11-22"], :part2) == 33
      assert Day2.check_ranges(["95-115"], :part2) == 210
      assert Day2.check_ranges(["998-1012"], :part2) == 2009
      assert Day2.check_ranges(["1188511880-1188511890"], :part2) == 1_188_511_885
      assert Day2.check_ranges(["222220-222224"], :part2) == 222_222
      assert Day2.check_ranges(["1698522-1698528"], :part2) == 0
      assert Day2.check_ranges(["446443-446449"], :part2) == 446_446
      assert Day2.check_ranges(["38593856-38593862"], :part2) == 38_593_859
      assert Day2.check_ranges(["565653-565659"], :part2) == 565_656
    end

    test "full part 2 test" do
      ranges = [
        "11-22",
        "95-115",
        "998-1012",
        "1188511880-1188511890",
        "222220-222224",
        "1698522-1698528",
        "446443-446449",
        "38593856-38593862",
        "565653-565659",
        "824824821-824824827",
        "2121212118-2121212124"
      ]

      assert Day2.check_ranges(ranges, :part2) == 4_174_379_265
    end
  end
end
