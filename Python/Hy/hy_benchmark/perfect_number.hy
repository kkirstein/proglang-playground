; vim: set ft=hy sw =2 ts=2:
;
; perfect_number.hy
;

(require hyrule [loop])
(import itertools [count islice])

(defn perfect? [n]
  "Check whether given number is a 'perfect' number"
  (loop [[i 1] [sum 0]]
    (cond
      (= i n) (= sum n)
      (= 0 (% n i)) (recur (+ i 1) (+ sum i))
      True (recur (+ i 1) sum))))

(defn perfect-iter? [n]
  "Check whether given number is 'perfect', non-recursive implementation"
  (do
    (setv sum 0)
    (for [i (range 1 n)]
      (when (= 0 (% n i)) (setv sum (+ sum i))))
    (= sum n)))


(defn perfect-numbers [nmax]
  "Calculate 'perfect' numbers up to 'nmax'"
  (lfor x (range 1 nmax)
    :if (perfect? x)
    x))
    

(defn pn-generator []
  "Generator for 'perfect' numbers"
  (gfor x (count 1)
    :if (perfect-iter? x)
    x))

(defn perfect-numbers-gen [n]
  "Calculate 'perfect' numbers by generator function"
  (list (islice (pn-generator) n)))

