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

end

