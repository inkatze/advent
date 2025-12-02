defmodule Advent2025.Day1Test do
  use ExUnit.Case, async: true

  alias Advent2025.Day1

  describe "decode_password_part_1/2" do
    test "returns 980 with default params" do
      assert Day1.decode_password_part_1() == 980
    end

    test "counts how many times position 0 is reached" do
      # Starting at 50, R50 goes to 0 (count: 1), L10 goes to 90, R10 goes to 0 (count: 2)
      turns = ["R50", "L10", "R10"]
      assert Day1.decode_password_part_1(50, turns) == 2
    end

    test "returns 0 when position 0 is never reached" do
      turns = ["R10", "R10", "R10"]
      assert Day1.decode_password_part_1(50, turns) == 0
    end

    test "handles wrapping around the circle" do
      # Start at 0, move left 50 (wraps to 50)
      turns = ["L50"]
      assert Day1.decode_password_part_1(0, turns) == 0
    end
  end

  describe "decode_password_part_2/2" do
    test "returns 5961 with default params" do
      assert Day1.decode_password_part_2() == 5961
    end

    test "counts zero crossings when moving right" do
      # Start at 90, move R20 crosses 0 once (90->99->0->10)
      turns = ["R20"]
      assert Day1.decode_password_part_2(90, turns) == 1
    end

    test "counts zero crossings when moving left" do
      # Start at 10, move L20 crosses 0 once (10->0->90)
      turns = ["L20"]
      assert Day1.decode_password_part_2(10, turns) == 1
    end

    test "counts multiple crossings in a single move" do
      # Start at 90, move R220 crosses 0 three times (at 100, 200, and 300)
      turns = ["R220"]
      assert Day1.decode_password_part_2(90, turns) == 3
    end

    test "counts zero crossings across multiple turns" do
      # Start at 90, R20 (1 crossing at 100), R100 (1 crossing at 100), L50 (1 crossing at 0)
      turns = ["R20", "R100", "L50"]
      assert Day1.decode_password_part_2(90, turns) == 3
    end

    test "returns 0 when zero is never crossed" do
      turns = ["R10", "R10", "R10"]
      assert Day1.decode_password_part_2(50, turns) == 0
    end
  end
end
