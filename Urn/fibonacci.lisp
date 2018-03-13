;;; fibonacci.lisp
;;; Compute Fibonacci Series in Lisp
;;;

;(in-package fibonacci)

;;
;; naive double recursive version
;;

(defun fib-naive (n)
  ;"Compute N'th Fiboancci number (naive recursive version)"
  (if (< n 2)
    n
    (+ (fib-naive (- n 2)) (fib-naive (- n 1)))))

;; 
;; optimized linear recursive version
;;

(defun fib (n)
  "Compute N'th Fiboancci number (linear recursive version)"
  (letrec [(fib* (a b n)
		 (if (= n 0)
		   a
		   (fib* b (+ a b) (- n 1))))]
    (fib* 0 1 n)))

