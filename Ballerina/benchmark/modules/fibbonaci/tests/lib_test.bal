//import ballerina/io;
import ballerina/test;

// Before Suite Function

@test:BeforeSuite
function beforeSuiteFunc() {
    //io:println("I'm the before suite function!");
}

// Test function

@test:Config {}
function testNaiveFib() {
    test:assertEquals(fib_naive(0), 0);
    test:assertEquals(fib_naive(1), 1);
    test:assertEquals(fib_naive(2), 1);
    test:assertEquals(fib_naive(3), 2);
    test:assertEquals(fib_naive(4), 3);
    test:assertEquals(fib_naive(10), 55);
}

@test:Config {}
function testFib() {
    test:assertEquals(fib(0), 0);
    test:assertEquals(fib(1), 1);
    test:assertEquals(fib(2), 1);
    test:assertEquals(fib(3), 2);
    test:assertEquals(fib(4), 3);
    test:assertEquals(fib(10), 55);
}

// After Suite Function

@test:AfterSuite
function afterSuiteFunc() {
    //io:println("I'm the after suite function!");
}
