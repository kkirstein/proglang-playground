# vim: set ft=python sw=4 ts=4:

# fibonacci.py
# Calculate Fibonacci numbers in Python (V3)

def fib_naive(n):
    """ A naive implementation of Fibonacci numbers """
    if n < 2:
        return n
    else:
        return fib_naive(n-2) + fib_naive(n-1)

def fib_rec(n):
    """ A tail-recursive implementation of Fibonacci numbers """
    def aux(a, b, n):
        if n == 0:
            return a
        else:
            return aux(b, a+b, n-1)
    return aux(0, 1, n)

def fib_iter(n):
    """ A iterative implementation of Fibonacci numbers """
    a, b = 0, 1
    while True:
        if n == 0:
            return a
        a, b, n = b, a+b, n-1
    
