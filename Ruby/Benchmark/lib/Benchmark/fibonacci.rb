# fibonacci.rb ruby version to calculate Fibonacci series
#
# vim: ts=2 sw=2

module Benchmark
	module Fibonacci

		# naive implementation
		def Fibonacci.fib_naive(n)
			if n < 2 then
				n
			else
				Fibonacci.fib_naive(n-1) + Fibonacci.fib_naive(n-2)
			end
		end

		# tail-call optimized version
		def Fibonacci.fib(n)
			Fibonacci.fib_aux(n, 0, 1)
		end
		def Fibonacci.fib_aux(n, a, b)
			if n < 1 then
				a
			else
				Fibonacci.fib_aux(n-1, b, a+b)
			end
		end

	end
end


