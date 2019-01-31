# vim: set ft=julia sw=4 ts=4:
#
# fibonacci.jl
#
# Calculate Fibonacci numbers in Julia

module Fibonacci

export fib_naive

"Naive implementation of Fibonacci number calculation"
function fib_naive(n)
	if n < 2
		n
	else
		fib_naive(n-2) + fib_naive(n-1)
	end
end

end


