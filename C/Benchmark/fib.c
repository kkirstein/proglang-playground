/* vim: set et sw=4 ts=4: */

/*
   fib.h

   Implementation file for calculating Fibonacci numbers

   */

int fib_naive(int n)
{
    if (n < 2)
    {
        return n;
    }
    else
    {
        return (fib_naive(n - 1) + fib_naive(n - 2));
    }
}
