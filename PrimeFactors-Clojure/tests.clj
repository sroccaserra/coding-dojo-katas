(ns tests
    (:use clojure.test prime-factors))

(def test-set
     '[(1 []) ;; []
       (2 [2]) ;; if (= n 2) [2]
       (3 [3]) ;; if (= n 3) [3] => (cond (= n 1) ...
       (4 [2 2]) ;; (conj (factorization n) 2)
       (5 [5]) ;; pass
       (6 [2 3]) ;; conj -> cons => recursion -> loop
       (7 [7]) ;; pass
       (8 [2 2 2]) ;; pass
       (9 [3 3]) ;; 2 -> divisor ; (= 1 number) -> (< divisor number); (conj factors n) -> (recur number (inc divisor) factors)
       (1789 [1789])])

(deftest run-test-set
  (doseq [[number factors] test-set]
      (is (= factors (factorization number)))))
