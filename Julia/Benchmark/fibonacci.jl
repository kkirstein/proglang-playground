# vim: set ft=julia sw=4 ts=4:
#
# fibonacci.jl
#
# Calculate Fibonacci numbers in Julia

module Fibonacci

export fib_naive, fib

"Naive implementation of Fibonacci number calculation"
function fib_naive(n)
	if n < 2
		n
	else
		fib_naive(n-2) + fib_naive(n-1)
	end
end

"Tail-call optimized implementation"
function fib(n)
	function aux(n, a, b)
		if n < 1
			a
		else
			aux(n-1, b, a+b)
		end
	end
	aux(n, BigInt(0), BigInt(1))
end

end # module

