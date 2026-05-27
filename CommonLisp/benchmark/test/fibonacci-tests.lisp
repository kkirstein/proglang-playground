;;;; fibonacci-tests

;;; Main test suite for testing benchmark tasks

(in-package #:benchmark/test)

(def-suite fibonacci-tests
           :description "Test Fibonacci number calculation"
           :in benchmark-tests)

(in-suite fibonacci-tests)

(test naive-fib
  (is (benchmark/fibonacci:fibonacci-2 0) 0)
  (is (benchmark/fibonacci:fibonacci-2 1) 1)
  (is (benchmark/fibonacci:fibonacci-2 2) 1)
  (is (benchmark/fibonacci:fibonacci-2 3) 2)
  (is (benchmark/fibonacci:fibonacci-2 4) 3)
  (is (benchmark/fibonacci:fibonacci-2 10) 55)
  (is (benchmark/fibonacci:fibonacci-2 20) 6765))

(test tc-optimized-fib
  (is (benchmark/fibonacci:fibonacci 0) 0)
  (is (benchmark/fibonacci:fibonacci 1) 1)
  (is (benchmark/fibonacci:fibonacci 2) 1)
  (is (benchmark/fibonacci:fibonacci 3) 2)
  (is (benchmark/fibonacci:fibonacci 4) 3)
  (is (benchmark/fibonacci:fibonacci 10) 55)
  (is (benchmark/fibonacci:fibonacci 20) 6765))