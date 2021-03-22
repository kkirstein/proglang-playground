;;; perfect-numbers.lisp
;;; Compute Perfect Numbers in Lisp
;;;

(in-package perfect-numbers)

;;
;; check if given number is perfect
;;

(defun perfectp (N)
  "Check if given number is perfect"
  (labels ((do-sum (S I)
		   (cond ((= I N) (= S N))
			 ((= 0 (mod N I)) (do-sum (+ S I) (1+ I)))
			 (t (do-sum S (1+ I))))))
    (do-sum 0 1)))

;;
;; generate list of perfect numbers
;;

(defun make-perfect-numbers (N)
  "Generate a list of perfect numbers up to N"
  (labels ((do-list (L I)
		    (if (<= I N)
		      (if (perfectp I)
			(do-list (append L (list I)) (1+ I))
			(do-list L (1+ I)))
		      L)))
    (do-list '() 1)))

