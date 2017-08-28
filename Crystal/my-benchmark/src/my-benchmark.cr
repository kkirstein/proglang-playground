# vim: ft=crystal ts=2 sw=2
#
# benchmark.cr
# A set of (micro-)benchmarks for the Crystal programming language
# https://www.crystal-lang.org
#

require "benchmark"
require "./my-benchmark/*"

module MyBenchmark

	extend self

  def run
    puts "Fibonacci numbers"
    puts "================="
    puts "fib_naive(35) = #{Fibonacci.fib_naive(35)}"
    puts "fib(35)       = #{Fibonacci.fib(35)}"
    # puts "fib(1000)     = #{Fibonacci.fib(1000)}"
    puts ""

    puts "Perfect numbers"
    puts "==============="
    # puts "perfect_numbers(10000) = #{PerfectNumber.perfect_numbers(10_000)}"
    puts ""

    puts "Mandelbrot set"
    puts "=============="
    # puts "Mandelbrot.new(640, 480, ..)"
    puts ""

    # Actually do benchmarking now
    Benchmark.ips do |x|
      x.report("fib_naive") { Fibonacci.fib_naive(35) }
      x.report("fib") { Fibonacci.fib(35) }
    end
  end
end

MyBenchmark.run

