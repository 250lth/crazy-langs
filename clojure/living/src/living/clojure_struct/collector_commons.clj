(ns living.clojure-struct.collector-commons)

;; count
(count [1 2 3 4])


;; conj
; it add an element to the collection in a normal way
; tail in vector
(conj [:toast :butter] :jam)
(conj [:toast :butter] :jam :honey)
; head in list
(conj '(:toast :butter) :jam)
(conj '(:toast :butter) :jam :honey)