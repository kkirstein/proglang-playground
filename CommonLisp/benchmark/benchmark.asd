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
                         (:file "mandelbrot-colormap")
                         (:file "mandelbrot")
                         (:file "benchmark")))))
