(ns living.clojure-struct.dict)

;;; dict : {}

{:jam1 "strawberry" :jam2 "blackberry"}

;; get
(get {:jam1 "strawberry" :jam2 "blackberry"} :jam2)
;; default
(get {:jam1 "strawberry" :jam2 "blackberry"} :jam3 "not found")


;; keys/vals
(keys {:jam1 "strawberry" :jam2 "blackberry" :jam3 "maralade"})
(vals {:jam1 "strawberry" :jam2 "blackberry" :jam3 "maralade"})

;; assoc: associate new k-v to a map
(assoc {:jam1 "red" :jam2 "black"} :jam1 "orange")
;; dissoc: remove a k-v
(dissoc {:jam1 "red" :jam2 "black"} :jam1)


;; merge: merge a k-v to another
(merge {:jam1 "red" :jam2 "black"}
       {:jam1 "orange" :jam2 "red"}
       {:jam4 "blue"})