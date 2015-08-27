# list_example.exs
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

  # recursive implementation for min/max detection
  defp recur(_, {[], acc}), do: acc
  defp recur(fun, {[h|tail], acc}) do
    if fun.(h, acc) do recur fun, {tail, h} else recur fun, {tail, acc} end
  end

  def my_max([h|_] = l), do: recur( &(&1>&2), {l, h})
  def my_min([h|_] = l), do: recur( &(&1<&2), {l, h})

  # count words (atoms) of a given list
  def word_count(l), do: word_count_recur(l, [])

  defp word_count_recur([], c), do: c
  defp word_count_recur([h|t], c) do
    if is_number c[h] do
      word_count_recur t, [{h, c[h]+1} | c]
    else
      word_count_recur t, [{h, 1} | c]
    end
  end

end

