# print.exs
# Elixir script to demonstrate linked lists
#
# vim: ft=elixir sw=2 ts=2
#
# taken from the book
# Seven More Languages in Seven Days
# http://pragprog.com/book/7lang/seven-more-languages-in-seven-weeks
# "Day 1"
#

defmodule ListExample do

  def print([]), do: :ok
  def print([head | tail]) do
    IO.puts head
    print tail
  end

  # alternative implementation
  def print2(x), do: Enum.each( x, &(IO.puts &1))

  # get the length of a list by recursion
  def my_length([]), do: 0
  def my_length([_|t]), do: 1 + length(t)

  defp my_max_aux({[], acc}), do: acc
  defp my_max_aux({[a|tail], acc}) do
    if a > acc do my_max_aux {tail, a} else my_max_aux {tail, acc} end
  end
  def my_max([h|_] = l), do: my_max_aux({l, h})

  defp my_min_aux({[], acc}), do: acc
  defp my_min_aux({[a|tail], acc}) do
    if a < acc do my_min_aux {tail, a} else my_min_aux {tail, acc} end
  end
  def my_min([h|_] = l), do: my_min_aux({l, h})
end

