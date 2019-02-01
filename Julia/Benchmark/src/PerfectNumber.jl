# vim: set ft=julia sw=4 ts=4:
#
# PerfectNumber.jl
#
# Calculate 'perfect' numbers in Julia

module PerfectNumber

export isPerfect


"Predicate to check whether 'n' is perfect"
function isPerfect(n)
	sum = 0
	for i = 1:(n-1)
		if mod(n, i) == 0
			sum += i
		end
	end
	sum == n
end



end # module


