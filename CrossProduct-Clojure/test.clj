(ns test
    (:use clojure.test cross_product))

;;;
;; Feature: Given a list of keys and a list of values, I should be abble to produce a flat Emacs plist.

(deftest plist-with-one-value
  (is (= [:a 1]
         (zip-in-plist [:a] [1]))))

(deftest plist-with-two-values
  (is (= [:a 1 :b 2]
         (zip-in-plist [:a :b] [1 2]))))

;;;
;; Feature: Given a list of arrays, I should be abble to produce their cross product.

(deftest an-empty-array
  (is (= []
         (cross-product [1 2] []))))

(deftest one-array
  (is (= [[1] [2] [3]]
         (cross-product [1 2 3]))))

(deftest two-arrays
  (is (= [[1 2] [1 3]]
         (cross-product [1] [2 3]))))

(deftest three-arrays
  (is (= [[1 2 3] [1 2 4]]
         (cross-product [1] [2] [3 4]))))

(deftest more-values
  (is (= [[1 4] [1 5] [1 6] [2 4] [2 5] [2 6] [3 4] [3 5] [3 6]]
         (cross-product [1 2 3] [4 5 6]))))
