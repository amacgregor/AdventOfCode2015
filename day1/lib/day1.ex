defmodule Day1 do
  def get_floor do
    calculate_floor([])
  end

  def get_floor(instructions) do
    instructions
    |> String.codepoints
    |> calculate_floor
  end

  defp calculate_floor(_, count \\ 0)
  defp calculate_floor([], count) do
    count
  end

  defp calculate_floor([head|tail], count) do
    case head do 
      "(" -> calculate_floor(tail,count + 1)
      ")" -> calculate_floor(tail,count - 1)
      _   -> calculate_floor(tail,count)
    end
  end

  def stop_at_floor(instructions, stopAt) do 
    instructions
    |> String.codepoints
    |> find_floor stopAt
  end

  def find_floor(_, _, floor \\ 0, count \\ 0)
  def find_floor([], stopAt, floor, count) do
    "Arrived at floor #{floor} in #{count} steps"
  end
  def find_floor(_, stopAt, floor, count) when stopAt == floor do 
    "Arrived at floor #{floor} in #{count} steps"
  end

  def find_floor([head|tail], stopAt, floor, count) do 
   case head do 
     "(" -> find_floor(tail, stopAt, floor + 1, count + 1)
     ")" -> find_floor(tail, stopAt, floor - 1, count + 1)
     _   -> find_floor(tail, stopAt, floor, count)
   end
  end

end
