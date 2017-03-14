-- benchmark.lua
-- benchmark lua interpreter
--
-- vim: ft=lua sw=4 ts=4

-- load packages from local path
package.path = package.path .. "?;?.lua"


-- helper function to measure time
function timeit(fn)
	local tic = os.clock()
	print(fn(), "\n")
	local toc = os.clock()
	print("Elapsed time ", toc-tic, "sec.\n")
end

-- benchmark fibonacci-series
-- --------------------------
require("fib")
print("Calculate fib(35):\n")
timeit(function() return fib(35); end)
print("Calculate fib_tr(35):\n")
timeit(function() return fib_tr(35); end)
print("Calculate fib_tr(1000):\n")
timeit(function() return fib_tr(1000); end)
print("-----------------------------------")

-- benchmark perfect numbers
-- -------------------------
require("perfect_numbers")
print("Calculate perfect numbers until 10000:\n")
timeit(function() return perfect_numbers(10000); end)
print("-----------------------------------")

-- benchmark mandelbrot set
-- ------------------------
require("mandelbrot")
print("Calculate mandelbrot set for 1920x1200 pixel:\n")
timeit(function() return mandelbrot(1920, 1200, -0.5, 0.0, 4.0/1920); end)
print("-----------------------------------")

