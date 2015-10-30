# vim: ft=elixir sw=2 ts=2
#
defmodule PerfectNumberTest do
  use ExUnit.Case

  test "is_perfect? predicate" do
    refute Benchmark.PerfectNumber.is_perfect?(1)
    refute Benchmark.PerfectNumber.is_perfect?(2)
    refute Benchmark.PerfectNumber.is_perfect?(3)
    refute Benchmark.PerfectNumber.is_perfect?(4)
    refute Benchmark.PerfectNumber.is_perfect?(5)
    assert Benchmark.PerfectNumber.is_perfect?(6)
    refute Benchmark.PerfectNumber.is_perfect?(7)
    assert Benchmark.PerfectNumber.is_perfect?(28)
  end

  test "perfect number list generator" do
    assert Benchmark.PerfectNumber.perfect_numbers(1) == []
    assert Benchmark.PerfectNumber.perfect_numbers(1000) == [6, 28, 496]
  end

  test "perfect number asynchronous list generator" do
    assert Benchmark.PerfectNumber.perfect_numbers_async(1) == []
    assert Benchmark.PerfectNumber.perfect_numbers_async(1000) == [6, 28, 496]
  end
end

