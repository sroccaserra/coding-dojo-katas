(ns cross_product)

(defn plist [names values]
  "Produces a plist in the Emacs sense."
  (let [name-value-map (zipmap names
                               values)]
    (mapcat (fn [key] [key (name-value-map key)])
            (sort (keys name-value-map)))))

(defmacro cp [& arrays]
  "Just wraps a call to Clojure's for macro."
  (let [nb-arrays (count arrays)
        names (for [_ (range nb-arrays)]
                (gensym "name"))]
    `(for [~@(plist names arrays)] [~@names])))

