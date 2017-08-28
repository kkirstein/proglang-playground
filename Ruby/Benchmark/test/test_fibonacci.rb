# vim: ft=ruby sw=2 ts=2
#
require 'minitest/autorun'

require_relative "../lib/Benchmark/fibonacci.rb"

include Benchmark

describe Fibonacci, "Calculate Fibonacci numbers" do

	it "naive implementation should give correct numbers" do
		Fibonacci.fib_naive(0).must_equal 0
		Fibonacci.fib_naive(1).must_equal 1
		Fibonacci.fib_naive(2).must_equal 1
		Fibonacci.fib_naive(3).must_equal 2
		Fibonacci.fib_naive(35).must_equal 9_227_465
	end

	it "TCO implementation should give correct numbers" do
		Fibonacci.fib(0).must_equal 0
		Fibonacci.fib(1).must_equal 1
		Fibonacci.fib(2).must_equal 1
		Fibonacci.fib(3).must_equal 2
		Fibonacci.fib(35).must_equal 9_227_465
	end
end

