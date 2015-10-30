# vim: ft=elixir sw=2 ts=2
#
defmodule FibonacciTest do
  use ExUnit.Case

  test "naive implementation" do
    assert Benchmark.Fibonacci.naive(0) == 0
    assert Benchmark.Fibonacci.naive(1) == 1
    assert Benchmark.Fibonacci.naive(2) == 1
    assert Benchmark.Fibonacci.naive(3) == 2
    assert Benchmark.Fibonacci.naive(35) == 9227465
  end

  test "TCO implementation" do
    assert Benchmark.Fibonacci.fib(0) == 0
    assert Benchmark.Fibonacci.fib(1) == 1
    assert Benchmark.Fibonacci.fib(2) == 1
    assert Benchmark.Fibonacci.fib(3) == 2
    assert Benchmark.Fibonacci.fib(35) == 9227465
  end
end

