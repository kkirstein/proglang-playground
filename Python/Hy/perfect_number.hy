; vim: set ft=hy sw =2 ts=2:
;
; perfect_number.hy
;

(require [hy.contrib.loop [loop]])

(defn perfect? [n]
  "Check whether given number is a 'perfect' number"
  (loop [[i 1] [sum 0]]
    (cond
      [(= i n) (= sum n)]
      [(zero? (% n i)) (recur (+ i 1) (+ sum i))]
      [True (recur (+ i 1) sum)])))

(defn perfect-numbers [nmax]
  "Calculate 'perfect' numbers up to 'nmax'"
  (lfor x (range 1 nmax)
    :if (perfect? x)
    x))
    

(defn pn-generator []
  "Generator for 'perfect' numbers"
  (gfor x (count 1)
    :if (perfect? x)
    x))

(defn perfect-numbers-gen [n]
  "Calculate 'perfect' numbers by generator function"
  (list (take n (pn-generator))))

