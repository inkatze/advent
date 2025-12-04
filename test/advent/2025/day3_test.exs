defmodule Advent2025.Day3Test do
  use ExUnit.Case, async: true

  alias Advent2025.Day3

  describe "find elfed codes part 1" do
    test "two invalid ids with chunk size 1" do
      assert Day3.battery_selector(["987654321111111"]) == 98
      assert Day3.battery_selector(["811111111111119"]) == 89
      assert Day3.battery_selector(["234234234234278"]) == 78
      assert Day3.battery_selector(["818181911112111"]) == 92
    end

    test "full part 1 test" do
      batteries = [
        "987654321111111",
        "811111111111119",
        "234234234234278",
        "818181911112111"
      ]

      assert Day3.battery_selector(batteries) == 357
    end
  end
end
