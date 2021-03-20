; vim: set ft=hy sw =2 ts=2:
;
; fibonacci.hy
;

(require [hy.contrib.loop [loop]])

(defn fib-naive [n]
  "A naive implementation of Fibonacci numbers"
  (if (< n 2)
      n
      (+ (fib-naive (- n 2)) (fib-naive (- n 1)))))

(defn fib [n]
  "A tail-call optimized implementation of Fibonacci numbers"
  (loop [[a 0] [b 1] [i n]]
    (if (= i 0)
        a
        (recur b (+ a b) (- i 1)))))

