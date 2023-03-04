# Returns the n-th Fibonacci number using a naive recursive approach
#
# + n - input value
# + return - n-th Fibonacci number, overflow might occur
public function fib_naive(int n) returns int {

    if (n < 2) {
        return n;
    } else {
        return fib_naive(n - 1) + fib_naive(n - 2);
    }
}

# Helper function for tail-call optimized Fibonacci calculation
# 
# + n - input value
# + a - accumulator value for Fibonacci sum
# + b - accumulator value for Fibonacci sum
# + return - n-th Fibonacci number, overflow might occur
function fib_aux(int n, int a, int b) returns int {
    if (n == 0) {
        return a;
    } else {
        return fib_aux(n - 1, b, a + b);
    }
}

# Returns the n-th Fibonacci number using a naive recursive approach
# Tail-call optimized version.
#
# + n - input value
# + return - n-th Fibonacci number, overflow might occur
public function fib(int n) returns int {

    return fib_aux(n, 0, 1);
}

