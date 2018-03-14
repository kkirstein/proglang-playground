;;; perfect-numbers.lisp
;;; Compute Perfect Numbers in Lisp
;;;

;;
;; check if given number is perfect
;;
(defun perfect? (n)
  "Check if given number is perfect"
  (letrec [(do-sum (s i)
		   (cond ((= i n) (= s n))
			 ((= 0 (mod n i)) (do-sum (+ s i) (+ 1 i)))
			 (true (do-sum s (+ 1 i)))))]
    (do-sum 0 1)))

;;
;; generate list of perfect numbers
;;
(defun make-perfect-numbers (n)
  "Generate a list of perfect numbers up to N"
  (letrec [(do-list (l i)
		    (if (<= i n)
		      (if (perfect? i)
			(do-list (append l (list i)) (+ 1 i))
			(do-list l (+ 1 i)))
		      l))]
    (do-list '() 1)))

