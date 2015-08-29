# vim: ft=elixir sw=2 ts=2
#
# fibonacci.ex
# calculate Fibonacci numbers
#

defmodule Benchmark.Fibonacci do

  @doc """
  Naive implementation of Fibonacci number caclulation
  """
  def naive(n) when n < 2, do: n
  def naive(n), do: naive(n-1) + naive(n-2)

  @doc """
  Efficient & TCO implementation of Fibonacci number calculation
  """
  def fib(n), do: fib(n, 0, 1)
  defp fib(0, a, b), do: a
  defp fib(n, a, b), do: fib(n-1, b, a+b)

end
    
