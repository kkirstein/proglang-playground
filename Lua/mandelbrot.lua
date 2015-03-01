-- mandelbrot.lua
-- Calculate Mandelbrot set with Lua
--
-- vim: ft=lua ts=4 sw=4

local complex = require("complex")

local color_max = "255"
local out_file = "mandelbrot.pgm"

-- internal functions
local r_max = 2.0
local n_max = 100

function isinside(z)
	local int_inside
	int_inside = function (z0, z, n)
		return (complex.abs(z) < r_max) and
			((n == 0) or (int_inside(z0, complex.add(complex.mul(z, z), z0), n-1)))
	end
	return int_inside(z, complex.new(0,0), n_max)
end

function bool2color(b)
	return (b and color_max or "0")
end

function pixel(x, y, x_offset, y_offset, pixel_size)
	return bool2color(isinside(complex.new(x_offset + x*pixel_size, y_offset - y*pixel_size) ))
end

-- the main entry function (writes image to file)
function plot(x_max, y_max, x_center, y_center, pixel_size)
	local fh = io.open(out_file, "w")
	fh:write("P2", "\n")
	fh:write(x_max, "\n")
	fh:write(y_max, "\n")
	fh:write(color_max, "\n")

	local x_offset = x_center - 0.5*pixel_size*(x_max+1)
	local y_offset = y_center + 0.5*pixel_size*(y_max+1)

	for j = 1,y_max do
		for i = 1,x_max do
			fh:write(pixel(i, j, x_offset, y_offset, pixel_size), "\n")
		end
	end

	fh:close()
	return out_file
end

