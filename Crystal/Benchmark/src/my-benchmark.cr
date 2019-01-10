# vim: ft=crystal ts=2 sw=2
#
# my-benchmark.cr
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
    puts "Mandelbrot::Image.new(1920, 1080, ..)"
    mandel_set = Mandelbrot::Image.new(1920, 1080, -0.5f32, 0.0f32, 4.0f32 / 1920)
    mandel_set.to_ppm("./test_data/mandelbrot.ppm")
    puts ""

    # Actually do benchmarking now
    puts "Benchmarks"
    puts "=========="
    Benchmark.ips do |x|
      x.report("fib_naive") { Fibonacci.fib_naive(35) }
      x.report("fib") { Fibonacci.fib(35) }
      x.report("fib_big_int") { Fibonacci.fib_big_int(35) }
    end

    puts

    Benchmark.ips do |x|
      x.report("perfect_numbers(10000)") { PerfectNumber.perfect_numbers(10_000) }
      x.report("perfect_numbers_2(10000)") { PerfectNumber.perfect_numbers_2(10_000) }
    end

    puts

    Benchmark.ips do |x|
      x.report("Mandelbrot::Image (640x480)") {
			 	Mandelbrot::Image.new(640, 480, -0.5f32, 0.0f32, 4.0f32 / 640)
		 	}
      x.report("Mandelbrot::Image (1920x1080)") {
			 	Mandelbrot::Image.new(1920, 1080, -0.5f32, 0.0f32, 4.0f32 / 1920)
		 	}
      #x.report("Mandelbrot::ImageAsync (1920x1080)") {
			# 	Mandelbrot::ImageAsync.new(1920, 1080, -0.5f32, 0.0f32, 4.0f32 / 1920)
		 	#}
    end

    puts

    Benchmark.ips do |x|
			x.report("Write Mandelbrot as PPM") { mandel_set.to_ppm("test_data/mandelbrot.ppm") }
			x.report("Write Mandelbrot as PNG") { mandel_set.to_png("test_data/mandelbrot.png") }
    end
  end
end

MyBenchmark.run
