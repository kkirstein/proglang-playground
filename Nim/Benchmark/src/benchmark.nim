# benchmark.nim
# Some (micro-)benchmarks for the Nim programming language
#
# vim: ft=nim sw=4 ts=4 et
#

from times import cpuTime

import fib

var
    tic : float


# Fibonacci numbers
# =================
echo("Naive implementation:")
echo("---------------------")

tic = cpuTime()
echo("fib_naive(35) = ", fib_naive(35), "\tElapsed: ", cpuTime()-tic, "s")

tic = cpuTime()
echo("fib(35) = ", fib(35), "\tElapsed: ", cpuTime()-tic, "s")

tic = cpuTime()
echo("fib(100) = ", fib(100), " Elapsed: ", cpuTime()-tic, "s")

tic = cpuTime()
echo("fib_iter(35) = ", fib_iter(35), "\tElapsed: ", cpuTime()-tic, "s")



echo("---------------------")
echo()
echo("Done!")



