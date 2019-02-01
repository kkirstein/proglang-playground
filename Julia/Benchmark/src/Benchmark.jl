# vim: set ft=julia sw=4 ts=4:
#
#
# A set of (micro-) benchmarks for the Julia programming language
#


module Benchmark

include("Fibonacci.jl")
#import Fibonacci

println("Fibonacci numbers")
println("-----------------")
@time println(lpad("fib_naive(35)", 16) * " = $(Fibonacci.fib_naive(35))")
@time println(lpad("fib(35)", 16) * " = $(Fibonacci.fib(35))")
@time println(lpad("fib(1000)", 16) * " = $(Fibonacci.fib(1000))")
println()


println("Perfect numbers")
println("---------------")
println(" todo...")
println()


println("Mandelbrot set")
println("--------------")
println(" todo...")
println()


println(" done.")

end # module
