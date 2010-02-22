(ns prime-factors)

(defn factorization [n]
  (loop [number n
         divisor 2
         factors []]
     (cond (> divisor number) factors
           (= 0 (mod number divisor)) (recur (/ number divisor) divisor (conj factors divisor))
           true (recur number (inc divisor) factors))))
