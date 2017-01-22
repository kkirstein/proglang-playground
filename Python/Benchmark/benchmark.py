# vim: set ft=python sw=4 ts=4:

# benchmark.py
# A set of micro-benchmarks for the Python (V3)
# programming language

from time import clock
import fibonacci

print("Fibonacci numbers")
print("=================")
tic = clock()
res = fibonacci.fib_naive(35)
toc = clock()
print('fib_naive(35) = {} (Elapsed: {:.3f}s.)'.format(res, toc-tic))
tic = clock()
res = fibonacci.fib_rec(35)
toc = clock()
print('fib_rec(35) = {} (Elapsed: {:.3f}s.)'.format(res, toc-tic))
#tic = clock()
#res = fibonacci.fib_rec(100)
#toc = clock()
#print('fib_rec(100) = {} (Elapsed: {:.3f}s.)'.format(res, toc-tic))
tic = clock()
res = fibonacci.fib_iter(1000)
toc = clock()
print('fib_rec(1000) = {} (Elapsed: {:.3f}s.)'.format(res, toc-tic))
print()


print("Perfect numbers")
print("===============")
print()


print("Mandelbrot set")
print("==============")
print()

print(" done.")
print()
