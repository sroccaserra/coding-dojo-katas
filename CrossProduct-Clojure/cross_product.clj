(ns cross_product)

(defn zip-in-plist [names values]
  "Produces a plist in the Emacs sense."
  (let [name-value-map (sort (zipmap names
                                     values))]
    (reduce concat name-value-map)))

(defmacro cross-product [& arrays]
  "Just wraps a call to Clojure's for macro."
  (let [nb-arrays (count arrays)
        names (for [_ (range nb-arrays)]
                (gensym "name"))]
    `(for [~@(zip-in-plist names arrays)] [~@names])))

