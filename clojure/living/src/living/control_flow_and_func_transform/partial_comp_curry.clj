(ns living.control-flow-and-func-transform.partial-comp-curry)

;;; curry: convert a multiple args func to a one-arg func

;; partial

(defn grow [name direction]
  (if (= direction :small)
    (str name " is growing smaller")
    (str name " is growing bigger")))

(grow "Alice" :small)
(grow "Alice" :big)

; use partial
(partial grow "Alice")
((partial grow "Alice") :small)


;; comp
(defn toggle-grow [direction]
  (if (= direction :small) :big :small))

(toggle-grow :big)
(toggle-grow :small)

(defn oh-my [direction]
  (str "Oh My! You are growing " direction))

(oh-my (toggle-grow :small))

; use comp
(defn surprise [direction]
  ((comp oh-my toggle-grow) direction))

(surprise :small)