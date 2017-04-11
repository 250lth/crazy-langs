(ns living.control-flow-and-func-transform.logic-test-on-collection)

;; empty?
(empty? [:table :door :key])
(empty? [])
(empty? {})
(empty? '())
#_(defn empty?
  [coll] (not (seq coll)))


;; seq
(seq [1 2 3])
(class [1 2 3])
(class (seq [1 2 3]))
(seq [])


;; every?
(every? odd? [1 3 5])
(every? odd? [1 2 3 4 5])

(defn drinkable? [x]
  (= x :drinkme))
(every? drinkable? [:drinkme :drinkme])
(every? drinkable? [:drinkme :drinkme1])

(every? (fn [x] (= x :drinkme)) [:drinkme :drinkme])
(every? #(= % :drinkme) [:drinkme :drinkme])


;; not-any?
(not-any? #(= % :drinkme) [:drinkma :drinkme])
(not-any? #(= % :drinkme) [:poison :drinkma])


;; some
(some #(> % 3) [1 2 3 4 5])
; use set as predicate
(#{1 2 3 4 5} 3)
(some #{3} [1 2 3 4 5])
(some #{4 5} [1 2 3 4 5])
; be careful!
(some #{nil} [nil nil nil])
(some #{false} [false false false])
