(ns test
    (:use clojure.test cross_product))

(deftest plist-with-one-value
  (is (= [:a 1]
         (plist [:a] [1]))))

(deftest plist-with-two-values
  (is (= [:a 1 :b 2]
         (plist [:a :b] [1 2]))))

(deftest an-empty-array
  (is (= []
         (cp [1 2] []))))

(deftest one-array
  (is (= [[1] [2] [3]]
         (cp [1 2 3]))))

(deftest two-arrays
  (is (= [[1 2] [1 3]]
         (cp [1] [2 3]))))

(deftest three-arrays
  (is (= [[1 2 3] [1 2 4]]
         (cp [1] [2] [3 4]))))

(deftest more-values
  (is (= [[1 4] [1 5] [1 6] [2 4] [2 5] [2 6] [3 4] [3 5] [3 6]]
         (cp [1 2 3] [4 5 6]))))
