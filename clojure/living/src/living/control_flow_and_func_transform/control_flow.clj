(ns living.control-flow-and-func-transform.control-flow)

;; if
(if true "it is true" "it is false")
(if false "it is true" "it is false")
(if nil "it is true" "it is false")

(if (= :drinkme :drinkme)
  "Try it"
  "Don't try it")


;; if-let
(let [need-to-grow-small (> 5 3)]
  (if need-to-grow-small
    "drink bottle"
    "don't drink bottle"))

(if-let [need-to-grow-small (> 5 1)]
  "drink bottle"
  "don't drink bottle")


;; when
(defn drink [need-to-grow-small]
  (when need-to-grow-small "drink bottle"))
(drink true)
(drink false)


;; when-let
(when-let [need-to-grow-small true]
  "drink bottle")
(when-let [need-to-grow-small false]
  "drink bottle")


;; cond
(let [bottle "drinkme"]
  (cond
    (= bottle "poison") "don't touch"
    (= bottle "drinkme") "grow smaller"
    (= bottle "empty") "all gone"))

(let [x 5]
  (cond
    (> x 10) "bigger than 10"
    (> x 4) "bigger than 4"
    (> x 3) "bigger than 3"))

(let [x 5]
  (cond
    (> x 3) "bigger than 3"
    (> x 10) "bigger than 10"
    (> x 4) "bigger than 4"))

(let [x 1]
  (cond
    (> x 10) "bigger than 10"
    (> x 4) "bigger than 4"))

; add default :else
(let [bottle "mystery"]
  (cond
    (= bottle "poison") "don't touch"
    (= bottle "drinkme") "grow smaller"
    (= bottle "empty") "all gone"
    :else "unknown"))

(let [bottle "mystery"]
  (cond
    (= bottle "poison") "don't touch"
    (= bottle "drinkme") "grow smaller"
    (= bottle "empty") "all gone"
    "default" "unknown"))


;; case
(let [bottle "drinkme"]
  (case bottle
    "poison" "don't touch"
    "drinkme" "grow smaller"
    "empty" "all gone"))

#_(let [bottle "mystery"]
  (case bottle
    "poison" "don't touch"
    "drinkme" "grow smaller"
    "empty" "all gone"))                                    ; => Exception

