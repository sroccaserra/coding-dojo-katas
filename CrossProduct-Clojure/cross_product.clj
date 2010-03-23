(ns cross_product)

(defn zip-in-plist [names values]
  "Zips names and values in a plist, in the Emacs sense (see tests)."
  (let [name-value-map (zipmap names
                               values)]
    (reduce concat (sort name-value-map))))

(defmacro cross-product [& arrays]
  "Just wraps a call to Clojure's for macro."
  (let [symbols (for [_ arrays]
                  (gensym))]
    `(for [~@(zip-in-plist symbols arrays)] [~@symbols])))

