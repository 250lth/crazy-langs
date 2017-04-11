(ns living.control-flow-and-func-transform.power-of-lazy)

;; take
(take 5 (range))
(take 10 (range))
(range 5)
(class (range 5))
; don't run (range)
(take 10 (range))
(count (take 1000 (range)))
(count (take 100000 (range)))


;; repeat
(repeat 3 "rabbit")
(class (repeat 3 "rabbit"))
(take 5 (repeat "rabbit"))
(count (take 5000 (repeat "rabbit")))

(rand-int 10)
(rand-int 10)

(repeat 5 (rand-int 10))

;; repeatly
(repeatedly 5 #(rand-int 10))
(take 10 (repeatedly #(rand-int 10)))


;; cycle
(take 3 (cycle ["big" "small"]))
(take 6 (cycle ["big" "small"]))
(take 3 (rest (cycle ["big" "small"])))
