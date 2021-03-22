;;;; benchmark.asd
;;; ASDF definition file for benchmark app
;;;
;;; vim: ft=lisp

(asdf:defsystem #:benchmark
  :serial t
  :description "Basic benchmarks to compare different programming languages"
  :author "Kay-uwe Kirstein <kayuwe.kirstein@uster.com>"
  :license "MIT"
  :components ((:file "package")
	       (:file "fibonacci")
	       (:file "perfect-numbers")
	       (:file "mandelbrot-colormap")
	       (:file "mandelbrot" :depends-on ("mandelbrot-colormap"))
               (:file "benchmark")))
