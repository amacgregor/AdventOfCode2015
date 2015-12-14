defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "the floor should be zero to start" do 
    assert Day1.get_floor() == 0
  end

  test "the elevator should go up" do
    instructions = "("
    assert Day1.get_floor(instructions) == 1
  end

  test "the elevator should go down" do
    instructions = ")"
    assert Day1.get_floor(instructions) == -1
  end

  test "the elevator can go up and down multiple floors" do
    instructions = "((()"
    assert Day1.get_floor(instructions) == 2
  end

  test "the elevator can stop at the basement" do
    instructions = "((())))"
    assert Day1.stop_at_floor(instructions, -1) == "Arrived at floor -1 in 7 steps"
  end
end
