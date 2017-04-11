(ns living.control-flow-and-func-transform.use-logic-control-flow)

;; true and false
(class true)

;; true? false?
(true? true)
(true? false)
(false? false)
(false? false)

;; nil?
(nil? nil)
(nil? 1)

;; not
(not true)
(not false)
(not nil)
(not "hi")

;; check equal: =
(= :drinkme :drinkme)
(= :drinkeme 4)
; collection equals
(= '(:drinkme :bottle) [:drinkme :bottle])                  ; => true
;; not=
(not= :drinkme 4)
