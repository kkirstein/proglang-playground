# vim: set ft=julia sw=4 ts=4:
#
#
# A set of (micro-) benchmarks for the Julia programming language
#

include("fibonacci.jl")

#using Fibonacci

println("Fibonacci numbers")
println("-----------------")
@time println("fib_naive(35) = $(Fibonacci.fib_naive(35))")
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
