-- fib.lua
-- Calculate Fibonacci-series with Lua
--
-- vim: ft=lua ts=4 sw=4


-- naive implementation
function fib(n)
	if n < 2 then
		return n
	else
		return fib(n-2) + fib(n-1)
	end
end

-- tail-recursive version
function fib_tr(n)
	local function fib_aux(n, a, b)
		if n==0 then
			return a
		else
			return fib_aux(n-1, b, a+b)
		end
	end

	return fib_aux(n, 0, 1)
end

