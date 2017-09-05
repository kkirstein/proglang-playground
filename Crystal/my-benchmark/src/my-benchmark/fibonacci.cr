# vim: ft=crystal ts=2 sw=2
#
# fibonacci.cr
# Implementation of Fibonacci numbers in the Crystal programming language
# https://www.crystal-lang.org
#

require "big_int"

module MyBenchmark
	module Fibonacci

		extend self

		# naive implementation
		def fib_naive(n)
			if n < 2
				n
			else
				fib_naive(n-1) + fib_naive(n-2)
			end
		end

		# helper def for TCO optimized implementations
		def fib_aux(n, a, b)
			if n < 1
				a
			else
				fib_aux(n - 1, b, a + b)
			end
		end

		# TCO optimized implementation
		def fib(n)
			fib_aux(n, 0, 1)
		end

		# BigInt version
		def fib_big_int(n : Int32)
			fib_aux(n, BigInt.new(0), BigInt.new(1))
		end
	end
end

