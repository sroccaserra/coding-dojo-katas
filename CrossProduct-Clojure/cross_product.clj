(ns cross_product)
  ;; (:use clojure.contrib.monads))

(defn zip-in-plist
  "Zips keys and values in a plist, in the Elisp sense (see tests)."
  [keys values]
  (let [zipped-map (zipmap keys values)]
    (apply concat (sort zipped-map))))

(defmacro cross-product
  "Just wraps a call to Clojure's for macro."
  [& arrays]
  (let [symbols (for [_ arrays]
                  (gensym))]
    `(for [~@(zip-in-plist symbols arrays)]
       [~@symbols])))

;;;
;; The cross product can easily be computed with the sequence monad, but then the kata disapears:

;; (defn cross-product
;;   "Applying the sequence monad to a list of monadic values (sequences) is what the m-seq macro is for."
;;   [& arrays]
;;   (with-monad sequence-m
;;     (m-seq arrays)))
