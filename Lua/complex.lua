-- complex.lua
--
-- vim: ft=lua sw=4 ts=4
--
-- Basic package for complex numbers,
-- implementation taken from Programming in Lua
-- http://www.lua.org/pil/15.1.html
--
-- Author: KIRK
--

local P = {}

function P.new (r, i) return {r=r, i=i} end

-- defines a constant `i'
P.i = P.new(0, 1)

-- simple arithmetics
function P.add (c1, c2)
	return P.new(c1.r + c2.r, c1.i + c2.i)
end

function P.sub (c1, c2)
	return P.new(c1.r - c2.r, c1.i - c2.i)
end

function P.mul (c1, c2)
	return P.new(c1.r*c2.r - c1.i*c2.i,
		c1.r*c2.i + c1.i*c2.r)
end

function P.inv (c)
	local n = c.r^2 + c.i^2
	return P.new(c.r/n, -c.i/n)
end

function P.abs (c)
	return math.sqrt(c.r*c.r + c.i*c.i)
end

-- publish as global package complex and return it
complex = P
return complex

