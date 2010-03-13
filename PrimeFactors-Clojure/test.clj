(ns test
    (:use clojure.test prime_factors))

(def test-set
     [[1 []]                ;; []
      [2 [2]]               ;; (if (= 1 n) [] [2]) >> doseq
      [3 [3]]               ;; (if) -> (cond) >> [2] -> [n]
      [4 [2 2]]             ;; (= 4 n) [2 2] >> add (= 2 n) and (= 8 n)
      [8 [2 2 2]]           ;; (= 0 (mod n 2)) (conj (factorize (/ n 2)) 2)
      [5 [5]]               ;; Pass
      [6 [2 3]]             ;; conj -> cons
      [7 [7]]               ;; Pass
      [(* 3 3) [3 3]]       ;; (= 9 n) [3 3]
      [(* 3 3 3) [3 3 3]]   ;; (= 27 n) [3 3 3] >>
                            ;; (= 0 (mod n 3)) (cons 3 (factorize (/ n 3))) >>
                            ;; (let [divisor 2] (cond ... >>
                            ;; (let -> (loop >>
                            ;; (< divisor number) -> (< divisor (Math/sqrt number)) >>
                            ;; If it was removed, restore (= 1 number) factors
      [(* 2 1789) [2 1789]] ;; Pass
      ])

(deftest check-test-set
  (doseq [[number factors] test-set]
      (is (= factors (factorize number)))))
