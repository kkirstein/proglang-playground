# fib.nim
# caclulate Fibonacci series
#
# vim: ft=nim sw=4 ts=4 et
#

# a naive approach
proc fib_naive* (n : int) : int =
    if n < 2:
        return n
    else:
        return fib_naive(n-1) + fib_naive(n-2)


# tail-recursive variant
proc fib_aux (n : int, a, b : int64) : int64 =
    if n == 0:
        return a
    else:
        return fib_aux(n-1, b, a+b)

proc fib* (n : int) : int64 =
    return fib_aux(n, 0, 1)


# iterative variant
proc fib_iter* (n : int) : int =
    if n < 2:
        return n
    else:
        var
            a = 0
            b = 1
        for i in countup(2, n):
            a = b
            b = b + a
        return a

