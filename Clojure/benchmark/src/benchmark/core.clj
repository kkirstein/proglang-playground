(ns benchmark.core
  (:use [benchmark.fib :refer :all]
        [benchmark.perfectnumber :refer :all])
  (:gen-class))

(defn -main
  "Main entry-point to start various micro-benchmarks."
  [& args]
  (println "Fibonacci numbers:")
  (println "==================")
  (println "fib-naive(35) = " (time (benchmark.fib/fib-naive 35)))
  (newline)
  (println "fib(35) = " (time (benchmark.fib/fib 35)))
  (newline)
  (println "fib(1000) = " (time (benchmark.fib/fib (bigint 1000))))
  (newline)
  (println "fib-lazy(35) = " (time (benchmark.fib/fib-lazy 35)))
  (newline)
  (println "fib-lazy(1000) = " (time (benchmark.fib/fib-lazy (bigint 1000))))
  (newline)

  (newline)
  (println "perfect-numbers(10000) = " (time (benchmark.perfectnumber/perfect-numbers 10000)))
  (newline))

