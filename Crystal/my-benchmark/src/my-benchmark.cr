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
    puts "fib_naive(35)      = #{Fibonacci.fib_naive(35)}"
    puts "fib(35)            = #{Fibonacci.fib(35)}"
    puts "fib_big_int(35)    = #{Fibonacci.fib_big_int(35)}"
    puts "fib_big_int(1000)  = #{Fibonacci.fib_big_int(1000)}"
    puts ""

    puts "Perfect numbers"
    puts "==============="
    puts "perfect_numbers(10000) = #{PerfectNumber.perfect_numbers(10_000)}"
    puts "perfect_numbers_2(10000) = #{PerfectNumber.perfect_numbers_2(10_000)}"
    puts ""

    puts "Mandelbrot set"
    puts "=============="
    puts "Mandelbrot.new(1920, 1080, ..)"
		mandel_set = Mandelbrot::Image.new(1920, 1080, -0.5f32, 0.0f32, 4.0f32 / 1920)
		mandel_set.to_ppm("./test_data/mandelbrot.ppm")
    puts ""

    # Actually do benchmarking now
    Benchmark.ips do |x|
      x.report("fib_naive") { Fibonacci.fib_naive(35) }
      x.report("fib") { Fibonacci.fib(35) }
      x.report("fib_big_int") { Fibonacci.fib_big_int(35) }
    end

    Benchmark.ips do |x|
      x.report("perfect_numbers(10000)") { PerfectNumber.perfect_numbers(10_000) }
      x.report("perfect_numbers_2(10000)") { PerfectNumber.perfect_numbers_2(10_000) }
    end

    Benchmark.ips do |x|
			x.report("Mandelbrot (640x480)") { Mandelbrot::Image.new(640, 480, -0.5f32, 0.0f32, 4.0f32 / 640) }
			x.report("Mandelbrot (1920x1080)") { Mandelbrot::Image.new(1920, 1080, -0.5f32, 0.0f32, 4.0f32 / 1920) }
    end
  end
end

MyBenchmark.run
