(ns benchmark.perfectnumber
  (:gen-class))

(defn perfect? [n]
  "Check whether given number is perfect, meaning the sum of its figures is the number itself"
  (loop [i 1 sum 0]
    (if (= i n)
      (= sum n)
      (if (= (rem n i) 0)
        (recur (+ i 1) (+ sum i))
        (recur (+ i 1) sum)))))


(defn perfect-numbers [n]
  "Returns all perfect numbers upto n"
  (doall (filter perfect? (range 1 n))))

