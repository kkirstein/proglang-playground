import benchmark.fibbonaci;
import ballerina/io;
import ballerina/time;

public function main() {

    io:println("Ballerina Benchmarks");
    io:println("====================");

    io:println();

    io:println("Fibonacci Numbers");
    io:println("-----------------");

    time:Utc tic = time:utcNow();
    int res = fibbonaci:fib_naive(35);
    time:Utc toc = time:utcNow();
    time:Seconds elapsed = time:utcDiffSeconds(toc, tic);
    io:println(`fib_naive(35) = ${res} (elapsed: ${elapsed}s)`);

    tic = time:utcNow();
    res = fibbonaci:fib(35);
    toc = time:utcNow();
    elapsed = time:utcDiffSeconds(toc, tic);
    io:println(`fib(35) = ${res} (elapsed: ${elapsed}s)`);

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
