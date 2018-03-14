;;;; benchmark.lisp

;(in-package #:benchmark)
(import lua/os os)
(import fibonacci fib)
(import perfect-numbers pn)

; helper function to measure elapsed time
(defun print-time-it (fn arg)
  (progn
    (let [(tic (os/clock))]
      (printf "Result: %s" (pretty (fn arg)))
      (let [(toc (os/clock))]
	(printf "Elapsed time %.3fs.\n" (- toc tic))))))

;;; "benchmark" goes here. Hacks and glory await!
;;;
(defun main ()
  (progn

    ;;
    ;; time different versions of Fibanocci calculations
    ;;
    (print! "Fibonacci series (naive recursive approach):")
    (print-time-it fib/fib-naive 35)
    (print! "Fibonacci series (linear recursive approach):")
    (print-time-it fib/fib 35)
    (print! "")

    ;;
    ;; time computation of perfect numbers
    ;;
    (print! "Perfect numbers:")
    (print! (pn/make-perfect-numbers 10000))
    (print-time-it pn/make-perfect-numbers 10000)
    (print! "")

    ;;
    ;; time computation of Mandelbrot sets
    ;;
    ;(defconstant bw-file "mandelbrot_bw.pgm")
    ;(defconstant rgb-file "mandelbrot_rgb.pgm")
    ;(format t "Mandelbrot sets:~%")
    ;(time (mandelbrot:write-pgm-bw bw-file 180 120 -0.5 0.0 (/ 4.0 180)))
    ;(time (mandelbrot:write-pgm-bw bw-file 640 480 -0.5 0.0 (/ 4.0 640)))
    ;(time (mandelbrot:write-pgm-rgb rgb-file 640 480 -0.5 0.0 (/ 4.0 640)))
    ;(format t "~%")

    ;;
    ;; clean-up and finish
    ;;
    ;(format t "DONE~%")
    
    :DONE))

;;
;; call main entry point
;;
(main)

