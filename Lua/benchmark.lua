-- benchmark.lua
-- benchmark lua interpreter
--
-- vim: ft=lua sw=4 ts=4

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
print("Calculate mandelbrot set for 180x120 pixel:\n")
timeit(function() return plot(180, 120, -0.5, 0.0, 4.0/180); end)
print("-----------------------------------")

