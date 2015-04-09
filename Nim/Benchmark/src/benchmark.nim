# benchmark.nim
# Some (micro-)benchmarks for the Nim programming language
#
# vim: ft=nim sw=4 ts=4 et
#

from times import cpuTime
from bigints import toString

import fib
import perfect_numbers


var
    tic : float


# Fibonacci numbers
# =================
echo("Fibonacci numbers:")
echo("---------------------")

tic = cpuTime()
echo("fib_naive(35) = ", fib_naive(35), "\tElapsed: ", cpuTime()-tic, "s")

tic = cpuTime()
echo("fib(35) = ", fib(35).toString(), "\tElapsed: ", cpuTime()-tic, "s")

tic = cpuTime()
echo("fib(1000) = ", fib(1000).toString(), " Elapsed: ", cpuTime()-tic, "s")

tic = cpuTime()
echo("fib_iter(35) = ", fib_iter(35).toString(), "\tElapsed: ", cpuTime()-tic, "s")

tic = cpuTime()
echo("fib_iter(1000) = ", fib_iter(1000).toString(), "\tElapsed: ", cpuTime()-tic, "s")

echo()

# Perfect numbers
# ===============
echo("Perfect numbers:")
echo("----------------")

tic = cpuTime()
echo("perfect_numbers(10000) = ", perfect_numbers(10000), "\tElapsed: ", cpuTime()-tic, "s")


echo("---------------------")
echo()
echo("Done!")



