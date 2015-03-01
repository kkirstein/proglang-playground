-- perfect_numbers.lua
-- Calculate perfect numbers in lua
--
-- vim: ft=lua sw=4 ts=4

function perfect(n)
	local function loop(i, sum)
		if i==n then
			return sum==n
		elseif (n % i) == 0 then
			return loop(i+1, sum+i)
		else
			return loop(i+1, sum)
		end
	end
	return loop(1, 0)
end

function perfect_numbers(n)
	local result = {}
	for i = 1,n do
		if perfect(i) then
			table.insert(result, i)
		end
	end

	return result
end
