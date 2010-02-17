(ns test
  (:use prime-factors clojure.test))

(def test-set
  '[(1 [1])
    (2 [2])
    (3 [3])
    (4 [2 2])
    (5 [5])
    (6 [2 3])
    (7 [7])
    (8 [2 2 2])
    (9 [3 3])
    ])

(deftest check-set
  (doseq [[n factors] test-set]
    (is (= factors (factors-of n)))))

(run-tests)
