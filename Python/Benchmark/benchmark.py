# vim: set ft=python sw=4 ts=4:

# benchmark.py
# A set of micro-benchmarks for the Python (V3)
# programming language

from time import clock
import fibonacci
import perfect_number as pn

print("Fibonacci numbers")
print("=================")
tic = clock()
res = fibonacci.fib_naive(35)
toc = clock()
print("fib_naive(35) = {} (Elapsed: {:.3f}s.)".format(res, toc-tic))
tic = clock()
res = fibonacci.fib_rec(35)
toc = clock()
print("fib_rec(35) = {} (Elapsed: {:.3f}s.)".format(res, toc-tic))
tic = clock()
res = fibonacci.fib_iter(1000)
toc = clock()
print("fib_rec(1000) = {} (Elapsed: {:.3f}s.)".format(res, toc-tic))
print()


print("Perfect numbers")
print("===============")
tic = clock()
res = pn.perfect_numbers(8192)
toc = clock()
print("perfect_numbers(8192) = {} (Elapsed: {:.3f}s.)".format(res, toc-tic))
tic = clock()
res = pn.perfect_numbers_async(4)
toc = clock()
print("perfect_numbers_async(4) = {} (Elapsed: {:.3f}s.)".format(res, toc-tic))
print()


print("Mandelbrot set")
print("==============")
print()

print(" done.")
print()
