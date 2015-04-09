# fib.nim
# caclulate Fibonacci series
#
# vim: ft=nim sw=4 ts=4 et
#

import bigints

# a naive approach
proc fib_naive* (n : int) : int =
    if n < 2:
        return n
    else:
        return fib_naive(n-1) + fib_naive(n-2)


# tail-recursive variant
proc fib_aux (n : int, a, b : BigInt) : BigInt =
    if n == 0:
        return a
    else:
        return fib_aux(n-1, b, a+b)

proc fib* (n : int) : BigInt =
    return fib_aux(n, initBigInt(0), initBigInt(1))


# iterative variant
proc fib_iter* (n : int) : BigInt =
    var
        a = initBigInt(0)
        b = initBigInt(1)
    for i in 0 .. <n:
        swap a, b
        b += a
    return a

