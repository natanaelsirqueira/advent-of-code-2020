defmodule Aoc.Day3 do
  @input "day3"

  def run_part1 do
    count_trees(3, 1)
  end

  def run_part2 do
    [{1, 1}, {3, 1}, {5, 1}, {7, 1}, {1, 2}]
    |> Enum.map(fn {right, down} -> count_trees(right, down) end)
    |> Enum.reduce(&(&1 * &2))
  end

  defp count_trees(right, down) do
    @input
    |> Aoc.Input.stream_lines_characters()
    |> Stream.take_every(down)
    |> Stream.zip(Stream.iterate(0, &(&1 + right)))
    |> Enum.count(fn {row, col} ->
      Enum.at(row, rem(col, length(row))) == "#"
    end)
  end
end
