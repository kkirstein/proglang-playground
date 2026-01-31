# vim: set ft=python sw=4 ts=4:

# benchmark.py
# A set of micro-benchmarks for the Python (V3)
# programming language

from time import perf_counter
import benchmark.fibonacci as fib
import benchmark.perfect_number as pn
import benchmark.mandelbrot as mb


def run():
    print("Fibonacci numbers")
    print("=================")
    tic = perf_counter()
    res = fib.fib_naive(35)
    toc = perf_counter()
    print("fib_naive(35) = {} (Elapsed: {:.3f}s.)".format(res, toc - tic))
    tic = perf_counter()
    res = fib.fib_rec(35)
    toc = perf_counter()
    print("fib_rec(35) = {} (Elapsed: {:.3f}s.)".format(res, toc - tic))
    tic = perf_counter()
    res = fib.fib_iter(1000)
    toc = perf_counter()
    print("fib_iter(1000) = {} (Elapsed: {:.3f}s.)".format(res, toc - tic))
    print()

    print("Perfect numbers")
    print("===============")
    tic = perf_counter()
    res = pn.perfect_numbers(10000)
    toc = perf_counter()
    print("perfect_numbers(10000) = {} (Elapsed: {:.3f}s.)".format(res, toc - tic))
    tic = perf_counter()
    res = pn.perfect_numbers_async(4)
    toc = perf_counter()
    print("perfect_numbers_async(4) = {} (Elapsed: {:.3f}s.)".format(res, toc - tic))
    tic = perf_counter()
    res = pn.perfect_numbers_mp(10000)
    toc = perf_counter()
    print("perfect_numbers_mp(10000) = {} (Elapsed: {:.3f}s.)".format(res, toc - tic))
    print()

    print("Mandelbrot set")
    print("==============")
    tic = perf_counter()
    res = mb.Mandelbrot(
        width=1920, height=1600, center=(-0.5, 0.0), pixel_size=1920 / 4.0, max_iter=255
    )
    res.generate()
    toc = perf_counter()
    print("Mandelbrot set (1920, 1600) generation took {:.3f}s.".format(toc - tic))

    tic = perf_counter()
    res.save("mandelbrot.png")
    toc = perf_counter()
    print("Mandelbrot set saved to mandelbrot.png in {:.3f}s.".format(toc - tic))

    print(" done.")
    print()


if __name__ == "__main__":
    run()
