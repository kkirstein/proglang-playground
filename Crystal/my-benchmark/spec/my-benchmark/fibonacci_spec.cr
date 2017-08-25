# vim: ft=crystal ts=2 sw=2
#
# spec for Module Benchmark/Fibonacci

require "../spec_helper"

include MyBenchmark::Fibonacci

describe "Fibonacci" do

  it "fib_naive" do
    fib_naive(0).should eq 0
    fib_naive(1).should eq 1
    fib_naive(2).should eq 1
    fib_naive(3).should eq 2
    fib_naive(10).should eq 55
  end

  it "fib" do
    fib(0).should eq 0
    fib(1).should eq 1
    fib(2).should eq 1
    fib(3).should eq 2
    fib(10).should eq 55
  end

end
