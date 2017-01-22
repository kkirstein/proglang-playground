# vim: set ft=python sw=4 ts=4:

# fibonacci.py
# Calculate Fibonacci numbers in Python (V3)

def fib_naive(n):
    if n < 2:
        return n
    else:
        return fib_naive(n-2) + fib_naive(n-1)
