# quicksort.exs
# Elixir script to demonstrate list comprehensions
#
# vim: ft=elixir sw=2 ts=2
#
# taken from the book
# Seven More Languages in Seven Days
# http://pragprog.com/book/7lang/seven-more-languages-in-seven-weeks
# "Day 1"
#

defmodule QuickSort do

  def sort([]), do: []
  def sort([head | tail]) do
    sort( for(x <- tail, x <= head, do: x) ) ++
    [head] ++
    sort( for(x <-tail, x > head, do: x) )
  end
end

IO.inspect QuickSort.sort([5, 6, 3, 2, 7, 8])

