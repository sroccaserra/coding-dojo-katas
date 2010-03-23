(ns cross_product)

(defn zip-in-plist [keys values]
  "Zips keys and values in a plist, in the Emacs sense (see tests)."
  (let [ziped-map (zipmap keys
                          values)]
    (reduce concat (sort ziped-map))))

(defmacro cross-product [& arrays]
  "Just wraps a call to Clojure's for macro."
  (let [symbols (for [_ arrays]
                  (gensym))]
    `(for [~@(zip-in-plist symbols arrays)] [~@symbols])))

