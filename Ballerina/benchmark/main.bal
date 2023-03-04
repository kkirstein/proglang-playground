import benchmark.fibbonaci;
import ballerina/io;

public function main() {

    io:println("Ballerina Benchmarks");
    io:println("====================");

    io:println();

    io:println("Fibonacci Numbers");
    io:println("-----------------");

    int res = fibbonaci:fib_naive(35);
    io:println("fib_naive(35) = ", res);
    res = fibbonaci:fib(35);
    io:println("fib(35) = ", res);

    io:println();

    io:println("Prime Numbers");
    io:println("-------------");

    io:println();

    io:println("Perfect Numbers");
    io:println("---------------");

    io:println();

    io:println("Mandelbrot Set");
    io:println("--------------");

    io:println();
}
