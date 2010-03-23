(ns cross_product)

(defn plist [keys values]
  "Produces a plist in the Emacs sense."
  (let [m (zipmap (reverse keys) (reverse values))]
    (mapcat identity m)))

(defmacro cp [& arrays]
  "Just wraps a call to Clojure for."
  (let [nb-arrays (count arrays)
        names (for [_ (range nb-arrays)]
                (gensym "name"))]
    `(for [~@(plist names arrays)] [~@names])))

