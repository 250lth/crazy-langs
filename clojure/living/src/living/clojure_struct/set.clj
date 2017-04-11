(ns living.clojure-struct.set)

;;; set: #{}

#{:red :blue :white :pink}
; #{:red :blue  :red :white :blue :pink}

;; union
(clojure.set/union #{:r :b :w} #{:w :p :y})

;; difference
(clojure.set/difference #{:r :b :w} #{:w :p :y})

;; intersection
(clojure.set/intersection #{:r :b :w} #{:w :p :y})

;; use set to convert another collection to set
(set [:rabbit :rabbit :watch :door])
(set {:a 1 :b 2 :c 3})

;; get
(get #{:rabbit :door :watch} :rabbit)
(get #{:rabbit :door :watch} :dog)
; use keyword
(:rabbit #{:rabbit :door :watch})

;; set as a function
(#{:rabbit :door :watch} :rabbit)

;; contains?
(contains? #{:rabbit :door :watch} :rabbit)
(contains? #{:rabbit :door :watch} :jam)

;; conj
(conj #{:rabbit :door} :jam)
;; disj
(disj #{:rabbit :door} :door)
