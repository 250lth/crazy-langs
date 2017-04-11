(ns living.control-flow-and-func-transform.other-powerful-expressions)

;; complement : as predicate
((complement nil?) nil)                                     ; accept a func, return a composite return value func
((complement nil?) 1)

(filter (complement nil?) [:mouse nil :duck nil])

;; keyword?
(filter keyword? [:mouse nil :duck nil])

;; remove
(remove nil? [:mouse nil :duck nil])

;; for
(for [animal [:mouse :duck :lory]]
  (str (name animal)))

(for [animal [:mouse :duck :lory]
      color [:red :blue]]
  (str (name color) (name animal)))

; :let in for
(for [animal [:mouse :duck :lory]
      color [:red :blue]
      :let [animal-str (str "animal-" (name animal))
            color-str (str "color-" (name color))
            display-str (str animal-str "-" color-str)]]
  display-str)

; :when in for
(for [animal [:mouse :duck :lory]
      color [:red :blue]
      :let [animal-str (str "animal-" (name animal))
            color-str (str "color-" (name color))
            display-str (str animal-str "-" color-str)]
      :when (= color :blue)]
  display-str)


;; flatten
(flatten [ [:duck [:mouse] [[:lory]]]])

;; into
(into [] '(1 2 3))

;; sorted-map
(sorted-map :b 2 :a 1 :z 3)
(into (sorted-map) {:b 2 :c 3 :a 1})
(into {} [[:a 1] [:b 2] [:c 3]])
(into [] [[:a 1] [:b 2] [:c 3]])


;; partition
(partition 3 [1 2 3 4 5 6 7 8 9])
(partition 3 [1 2 3 4 5 6 7 8 9 10])
(partition-all 3 [1 2 3 4 5 6 7 8 9 10])
(partition-by #(= 6 %) [1 2 3 4 5 6 7 8 9 0])