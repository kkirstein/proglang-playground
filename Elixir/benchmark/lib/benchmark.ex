# vim: ft=elixir sw=2 ts=2
#
# benchmark.ex
# run (micro) benchmarks
#

defmodule Benchmark do

  def run do
    IO.puts "Elixir benchmarks"
    IO.puts "================="
    IO.puts ""

    IO.puts "Fibonacci numbers"
    IO.puts "-----------------"
    {elap, res} = :timer.tc(&Benchmark.Fibonacci.naive/1, [35])
    IO.puts "naive(35) = #{res}, Elapsed: #{elap/1000}ms"
    {elap, res} = :timer.tc(&Benchmark.Fibonacci.fib/1, [35])
    IO.puts "fib(35) = #{res}, Elapsed: #{elap/1000}ms"
    {elap, res} = :timer.tc(&Benchmark.Fibonacci.fib/1, [1000])
    IO.puts "fib(1000) = #{res}, Elapsed: #{elap/1000}ms"
    IO.puts ""

    IO.puts "Perfect numbers"
    IO.puts "---------------"
    {elap, res} = :timer.tc(&Benchmark.PerfectNumber.perfect_numbers/1, [10000])
    IO.puts "perfect_numbers(10000) = #{inspect res}, Elapsed: #{elap/1000}ms"
    {elap, res} = :timer.tc(&Benchmark.PerfectNumber.perfect_numbers_async/1, [10000])
    IO.puts "perfect_numbers_async(10000) = #{inspect res}, Elapsed: #{elap/1000}ms"

    IO.puts ""
    IO.puts "Done."
  end
end
