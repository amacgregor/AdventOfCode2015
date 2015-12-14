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

  def stopAtFloor(instructions, stopAt) do 
    list = String.codepoints(instructions)
    findFloor(list, stopAt)
  end

  def findFloor(_, _, floor \\ 0, count \\ 0)
  def findFloor([], stopAt, floor, count) do
    "Arrived at floor #{floor} in #{count} steps"
  end
  def findFloor(_, stopAt, floor, count) when stopAt == floor do 
    "Arrived at floor #{floor} in #{count} steps"
  end

  def findFloor([head|tail], stopAt, floor, count) do 
   case head do 
     "(" -> findFloor(tail, stopAt, floor + 1, count + 1)
     ")" -> findFloor(tail, stopAt, floor - 1, count + 1)
     _   -> findFloor(tail, stopAt, floor, count)
   end
  end

end
