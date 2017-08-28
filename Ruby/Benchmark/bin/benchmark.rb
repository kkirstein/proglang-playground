# benchmark.rb benchmark Ruby version of different problem sets
#
# vim: ft=ruby ts=2 sw=2
#

require 'benchmark'

require_relative '../lib/Benchmark/fibonacci'
require_relative '../lib/Benchmark/perfect_number'
require_relative '../lib/Benchmark/mandelbrot'
include Benchmark

# stop here if exe is built
exit if defined? Ocra

# show results
puts 'Fibonacci numbers'
puts '================='
puts "fib_naive(35) = #{Fibonacci.fib_naive(35)}"
puts "fib(35)       = #{Fibonacci.fib(35)}"
puts "fib(1000)     = #{Fibonacci.fib(1000)}"
puts ''

puts 'Perfect numbers'
puts '==============='
puts "perfect_numbers(10000) = #{PerfectNumber.perfect_numbers(10_000)}"
puts ''

puts 'Mandelbrot set'
puts '=============='
puts 'Mandelbrot.new(640, 480, ..)'
puts ''

# measure runtime
Benchmark.bm(25) do |x|
  x.report('fib_naive(35):')	{ Fibonacci.fib_naive(35) }
  x.report('fib(35):')	{ Fibonacci.fib(35) }
  x.report('fib(1000):')	{ Fibonacci.fib(1000) }
  x.report('perfect_numbers(10000):')	{ PerfectNumber.perfect_numbers(10_000) }
  x.report('Mandelbrot.new(640, 480, ..):')	{ Mandelbrot.new(640, 480, -0.5, 0.0, 4.0/640) }
end
