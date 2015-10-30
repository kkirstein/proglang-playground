# vim: ft=elixir sw=2 ts=2
#
# perfect_number.ex
# calculate perfect numbers
#

defmodule Benchmark.PerfectNumber do
  use Pipe

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

  @doc """
  Returns a list of perfect numbers for given upper limit.
  Calculations are performed asynchronous with Task.async
  """
  def perfect_numbers_async(limit) do
    kl = pipe_with fn(ll, f) -> Enum.map(ll, f) end,
      Enum.to_list(1..limit) |> spawn_task |> Task.await
    filter_true(kl)

    #tt = Enum.map(1..limit, fn(x) -> Task.async(fn -> {is_perfect?(x), x} end) end)
    #Keyword.get_values Enum.map(tt, fn(x) -> Task.await(x) end), true
  end

  defp spawn_task(x), do: Task.async(fn -> {is_perfect?(x), x} end)
  defp filter_true(kl), do: Keyword.get_values(kl, true)


end

