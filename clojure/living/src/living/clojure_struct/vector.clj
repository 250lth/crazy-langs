(ns living.clojure-struct.vector)

;; vector
[:jar1 1 2 3 :jar2]


;; first and rest
(first [:jar1 1 2 3 :jar2])
(rest [:jar1 1 2 3 :jar2])


;; nth
(nth [:jar1 1 2 3 :jar2] 0)
(nth [:jar1 1 2 3 :jar2] 2)


;; last
(last [:rabbit :pocket-watch :marmalade])
(last '(:rabbit :pocket-watch :marmalade))