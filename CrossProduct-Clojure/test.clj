(ns test
    (:use clojure.test cross_product))

(deftest testing-plist
  (is (= [:a 1 :b 2]
         (plist [:a :b] [1 2]))))

(deftest simple
  (is (= [[1 2] [1 3]]
         (cp [1] [2 3]))))

(deftest testing-nil
  (is (= []
         (cp [2 3] []))))

(deftest testing-identity
  (is (= [[1] [2] [3]]
         (cp [1 2 3]))))

(deftest testing-three-arrays
  (is (= [[1 2 3] [1 2 4]]
         (cp [1] [2] [3 4]))))
