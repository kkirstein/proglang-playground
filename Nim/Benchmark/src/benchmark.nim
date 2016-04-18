# benchmark.nim
# Some (micro-)benchmarks for the Nim programming language
#
# vim: ft=nim sw=4 ts=4 et
#

from times import cpuTime
from bigints import toString

import fib
import perfect_numbers
import mandelbrot
from mandelbrot_colormap import Color

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

#tic = cpuTime()
#echo("perfect_numbers_2(10000) = ", perfect_numbers_2(10000), "\tElapsed: ", cpuTime()-tic, "s")

echo()

# Mandelbrot sets
# ===============
echo("Mandelbrot sets:")
echo("----------------")

tic = cpuTime()
var image_small : array[180*120, Color]
discard mandelbrot(180, 120, -0.5, 0.0, 4.0/180, image_small)
echo("mandelbrot set (180 x 120)\tElapsed: ", cpuTime()-tic, "s")

tic = cpuTime()
discard write_pgm("image_small.pgm", image_small, 180, 120)
echo("image (180 x 120) written to file\tElapsed: ", cpuTime()-tic, "s")

tic = cpuTime()
var image_large : array[640*480, Color]
discard mandelbrot(640, 480, -0.5, 0.0, 4.0/640, image_large)
echo("mandelbrot set (640 x 480)\tElapsed: ", cpuTime()-tic, "s")

tic = cpuTime()
discard write_pgm("image_large.pgm", image_large, 640, 480)
echo("image (640 x 480) written to file\tElapsed: ", cpuTime()-tic, "s")

echo()

echo("---------------------")
echo()
echo("Done!")

echo("Press ENTER to continue..")
discard stdin.readLine()



