(ns living.clojure-struct.list)


;;; use list as collector
'(1 2 "jam" :marmalade-jar)
'(1, 2, "jam", :bee)


;;; Things we can do with list

;; first and rest
(first '(:rabbit :pocket-watch :marmalade :door))
(rest '(:rabbit :pocket-watch :maralate :door))

; nested
(first (rest '(:rabbit :pocket-watch :maralade :door)))
(first (rest (rest '(:rabbit :pocket-watch :maralade :door))))
(first (rest (rest (rest '(:rabbit :pocket-watch :maralade :door)))))
; rest to the tail of the list
(first (rest (rest (rest (rest '(:rabbit :pocket-watch :maralade :door))))))


;; use 'cons' to build list
(cons 5 '())
(cons 5 nil)
(cons 4 (cons 5 nil))
(cons 3 (cons 4 (cons 5 nil)))


;; function 'list'
'(1 2 3 4 5)
(list 1 2 3 4 5)
