# vim: ft=elixir sw=2 ts=2
#
# perfect_number.ex
# calculate perfect numbers
#

defmodule Benchmark.PerfectNumber do

  @doc """
  Predicate checks whether a given number is perfect
  """
  def is_perfect?(n), do: is_perfect?(n, 1, 0)
  defp is_perfect?(n, i, sum) do
    if i < n do
      if rem(n, i) == 0 do
        is_perfect?(n, i+1, sum+i)
      else
        is_perfect?(n, i+1, sum)
      end
    else
      sum == n
    end
  end

  @doc """
  Returns a list of perfect numbers for given upper limit
  """
  def perfect_numbers(limit) do
    for x <- 1..limit, is_perfect?(x), do: x
  end

end

