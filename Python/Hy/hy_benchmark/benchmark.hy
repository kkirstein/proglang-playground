; vim: set ft=hy sw=2 ts=2:
;
; benchmark.hy
;
; A set of (micro-) benchmarks for the Hy
; programming language
;

(require hyrule [defmacro/g!])
(import fibonacci [fib-naive fib])
(import perfect-number [perfect-numbers perfect-numbers-gen])

(defmacro/g! time-it [fun]
  `(do
      (import time)
      (setv ~g!tic (time.perf_counter))
      (setv ~g!res ~fun)
      {"elap" (- (time.perf_counter) ~g!tic) "res" ~g!res}))

(defn pprint-time-it [name info]
  (print (.format "{} = {} (elapsed: {:.3f}s)" name (get info "res") (get info "elap"))))

; Fibonacci numbers
; =================
(print "Fibonacci Numbers")
(print "=================")
(pprint-time-it "fib-naive(35)" (time-it (fib-naive 35)))
(pprint-time-it "fib(35)" (time-it (fib 35)))
(pprint-time-it "fib(1000)" (time-it (fib 1000)))
(print "")

; Perfect numbers
; ===============
(print "Perfect Numbers")
(print "===============")
(pprint-time-it "perfect-numbers(1000)" (time-it (perfect-numbers 1000)))
(pprint-time-it "perfect-numbers-gen(4)" (time-it (perfect-numbers-gen 4)))
(print "")


(print "done.")

