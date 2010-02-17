(ns prime-factors)

(defn factors-of [number]
  (loop [n number
         factors []
         divisor 2]
    (if (> divisor (Math/sqrt n)) (conj factors n)
      (if (not= 0 (mod n divisor))
        (recur n factors (inc divisor))
        (recur (/ n divisor) (conj factors divisor) divisor)))))
