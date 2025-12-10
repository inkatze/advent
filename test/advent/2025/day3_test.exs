defmodule Advent2025.Day3Test do
  use ExUnit.Case, async: true

  alias Advent2025.Day3

  describe "find two largest sequential batteries" do
    test "largest two sequential numbers in string of numbers" do
      assert Day3.two_battery_selector(["987654321111111"]) == 98
      assert Day3.two_battery_selector(["811111111111119"]) == 89
      assert Day3.two_battery_selector(["234234234234278"]) == 78
      assert Day3.two_battery_selector(["818181911112111"]) == 92
    end

    test "full part 1 test" do
      batteries = [
        "987654321111111",
        "811111111111119",
        "234234234234278",
        "818181911112111"
      ]

      assert Day3.two_battery_selector(batteries) == 357
    end
  end

  describe "find twelve largest sequential batteries" do
    test "largest twelve sequential numbers in string of numbers" do
      assert Day3.twelve_battery_selector(["987654321111111"]) == 987_654_321_111
      assert Day3.twelve_battery_selector(["811111111111119"]) == 811_111_111_119
      assert Day3.twelve_battery_selector(["234234234234278"]) == 434_234_234_278
      assert Day3.twelve_battery_selector(["818181911112111"]) == 888_911_112_111
    end

    test "full part 2 test" do
      batteries = [
        "987654321111111",
        "811111111111119",
        "234234234234278",
        "818181911112111"
      ]

      assert Day3.twelve_battery_selector(batteries) == 3_121_910_778_619
    end
  end
end
