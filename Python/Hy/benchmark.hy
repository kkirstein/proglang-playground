; vim: set ft=hy sw=2 ts=2:
;
; benchmark.hy
;
; A set of (micro-) benchmarks for the Hy
; programming language
;

(defmacro time-it [fun]
  `(do
      (import time)
      (setv tic (time.perf_counter))
      (setv res ~fun)
      (- (time.perf_counter) tic)))


; Fibonacci numbers
; =================
(import [fibonacci [fib-naive fib]])
(print (time-it (fib-naive 35)))

