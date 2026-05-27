(in-package #:benchmark/test)

(def-suite perfect-numbers-tests
           :description "Test perfect number calculation"
           :in benchmark-tests)

(in-suite perfect-numbers-tests)

(test perfectp
  (is-false (benchmark/perfect-numbers:perfectp 1))
  (is-false (benchmark/perfect-numbers:perfectp 2))
  (is-true (benchmark/perfect-numbers:perfectp 6))
  (is-false (benchmark/perfect-numbers:perfectp 7))
  (is-false (benchmark/perfect-numbers:perfectp 27))
  (is-true (benchmark/perfect-numbers:perfectp 28)))

(test make-perfect-numbers
  (is (benchmark/perfect-numbers:make-perfect-numbers 30) '(6 28)))