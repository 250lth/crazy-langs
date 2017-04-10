(ns living.clojure-struct.simple-value)

;; numbers
12.43
1/3
4/2
; 4.0/2 => error
(/ 1 3)
(/ 1 3.0)

;; string
"jam"

;; keyword
:jam

;; char
\j

;; boolean
true
false

;; nil
nil

;; expressions
(+ 1 1)
(+ 1 (+ 8 3))