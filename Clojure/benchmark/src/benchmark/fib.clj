;; fib.clj
;; Calculate Fibonacci numbers
;;

(ns benchmark.fib
  (:gen-class))

(defn fib-naive
  "Naive recursive implementation of Fibonacci numbers"
  [n]
  (if (< n 2)
    n
    (+ (fib-naive (- n 2)) (fib-naive (- n 1)))))

(defn fib
  "Tail-recursive implementation of Fibonacci numbers"
  [n]
  (loop [a 0N b 1N x n]
    (if (= x 0)
      a
      (recur b (+ a b) (- x 1)))))

(defn fib-seq
  "Return Fibnacci series as lazy sequence"
  []
  (map first (iterate (fn [[a b]] [b (+ a b)]) [0N 1N])))

(defn fib-lazy
  "Lazy implementation of Fibonacci number"
  [n]
  (nth (fib-seq) n))


