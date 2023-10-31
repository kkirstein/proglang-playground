;;; fibonacci.lisp
;;; Compute Fibonacci Series in Lisp
;;;

(in-package :benchmark/fibonacci)

;;
;; naive double recursive version
;;

(defun fibonacci-2 (N)
  "Compute N'th Fiboancci number (double recursive version)"
  (if (< N 2)
    n
    (+ (fibonacci-2 (- N 2)) (fibonacci-2 (- N 1)))))

;; 
;; optimized linear recursive version
;;

(defun fibonacci (N)
  "Compute N'th Fiboancci number (linear recursive version)"
  (labels ((fib* (A B N)
		 (if (zerop N)
		   A
		   (fib* B (+ A B) (- N 1)))))
    (fib* 0 1 N)))

