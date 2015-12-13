defmodule Day1 do
  def getFloor() do
    calculateFloor([])
  end

  def getFloor(instructions) do
    list = String.codepoints(instructions)
    calculateFloor(list)
  end

  defp calculateFloor(_, count \\ 0)

  defp calculateFloor([], count) do
    count
  end

  defp calculateFloor([head|tail], count) do
    case head do 
      "(" -> calculateFloor(tail,count + 1)
      ")" -> calculateFloor(tail,count - 1)
      _   -> calculateFloor(tail,count)
    end
  end
end
