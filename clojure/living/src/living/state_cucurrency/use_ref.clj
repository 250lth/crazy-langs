(ns living.state-cucurrency.use-ref)

(def alice-height (ref 3))
(def right-hand-bites (ref 10))

@alice-height
@right-hand-bites

(defn eat-from-right-hand []
  (when (pos? @right-hand-bites)
    (alter right-hand-bites dec)
    (alter alice-height #(+ % 24))))

(eat-from-right-hand)                                       ; error

;; we should use it in a transaction
;; use dosync

(dosync (eat-from-right-hand))
@alice-height
@right-hand-bites

(def alice-height1 (ref 3))
(def right-hand-bites1 (ref 10))
(defn eat-from-right-hand1 []
  (dosync (when (pos? @right-hand-bites1)
            (alter right-hand-bites1 dec)
            (alter alice-height1 #(+ % 24)))))
(let [n 2]
  (future (dotimes [_ n] (eat-from-right-hand1)))
  (future (dotimes [_ n] (eat-from-right-hand1)))
  (future (dotimes [_ n] (eat-from-right-hand1))))
@alice-height1
@right-hand-bites1

;; the func that alter use must be none-side-effect
;; use commute instead of alter
; it will not retry
; the func it use must can exchange
(def alice-height2 (ref 3))
(def right-hand-bites2 (ref 10))
(defn eat-from-right-hand2 []
  (dosync (when (pos? @right-hand-bites)
            (commute right-hand-bites2 dec)
            (commute alice-height2 #(+ % 24)))))
(let [n 2]
  (future (dotimes [_ n] (eat-from-right-hand2)))
  (future (dotimes [_ n] (eat-from-right-hand2)))
  (future (dotimes [_ n] (eat-from-right-hand2))))
@alice-height2
@right-hand-bites2


;;; use ref-set to set y's value
(def x (ref 1))
(def y (ref 1))

(defn new-values []
  (dosync
    (alter x inc)
    (ref-set y (+ 2 @x))))

(let [n 2]
  (future (dotimes [_ n] (new-values)))
  (future (dotimes [_ n] (new-values))))

@x
@y

