# vim: set ft=python sw=4 ts=4:

# benchmark.py
# A set of micro-benchmarks for the Python (V3)
# programming language

from time import clock, perf_counter
import fibonacci
import perfect_number as pn

print("Fibonacci numbers")
print("=================")
tic = perf_counter()
res = fibonacci.fib_naive(35)
toc = perf_counter()
print("fib_naive(35) = {} (Elapsed: {:.3f}s.)".format(res, toc-tic))
tic = perf_counter()
res = fibonacci.fib_rec(35)
toc = perf_counter()
print("fib_rec(35) = {} (Elapsed: {:.3f}s.)".format(res, toc-tic))
tic = perf_counter()
res = fibonacci.fib_iter(1000)
toc = perf_counter()
print("fib_iter(1000) = {} (Elapsed: {:.3f}s.)".format(res, toc-tic))
print()


print("Perfect numbers")
print("===============")
tic = perf_counter()
res = pn.perfect_numbers(10000)
toc = perf_counter()
print("perfect_numbers(10000) = {} (Elapsed: {:.3f}s.)".format(res, toc-tic))
tic = perf_counter()
res = pn.perfect_numbers_async(4)
toc = perf_counter()
print("perfect_numbers_async(4) = {} (Elapsed: {:.3f}s.)".format(res, toc-tic))
print()


print("Mandelbrot set")
print("==============")
print()

print(" done.")
print()
