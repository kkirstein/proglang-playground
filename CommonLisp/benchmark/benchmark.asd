;;;; benchmark.asd
;;; ASDF definition file for benchmark app
;;;
;;; vim: ft=lisp

(asdf:defsystem #:benchmark
  :serial t
  :description "Basic benchmarks to compare different programming languages"
  :author "Kay-Uwe Kirstein <kayuwe.kirstein@uster.com>"
  :license "MIT"
  :depends-on ("imago")
  :components ((:module "src"
                        :serial t
                        :components
                        ((:file "fibonacci")
                         (:file "perfect-numbers")
                         (:file "mandelbrot")
                         (:file "benchmark"))))
  :in-order-to ((test-op (test-op #:benchmark/test))))

(asdf:defsystem #:benchmark/test
  :description "Tests for benchmark app"
  :depends-on ("benchmark" "fiveam")
  :components ((:module "test"
                        :serial t
                        :components
                        ((:file "benchmark-tests")
                         (:file "fibonacci-tests")
                         (:file "perfect-numbers-tests"))))
  :perform (test-op (op c)
                    (symbol-call :fiveam :run! (find-symbol* :benchmark-tests :benchmark/test))))