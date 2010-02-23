(ns prime_factors)

(defn factorize [n]
  (loop [number n
         divisor 2
         factors []]
    (cond (= 1 number) factors
          (= 0 (mod number divisor)) (recur (/ number divisor) divisor (conj factors divisor))
          (< divisor (Math/sqrt number)) (recur number (inc divisor) factors)
          true                       (conj factors number))))
