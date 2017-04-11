(ns living.control-flow-and-func-transform.map-and-reduce)

;;; map
(def animals [:mouse :duck :dodo :lory :eaglet])
(#(str %) :mouse)
(map #(str %) animals)
(class (map #(str %) animals))

(take 3 (map #(str %) (range)))
(take 10 (map #(str %) (range)))

(def animal-print (map #(println %) animals))
animal-print

;; doall: calculate side-effect
(def animal-print-s (doall (map #(println %) animals)))
animal-print-s


(def colors
  ["brown" "black" "blue" "pink" "gold"])

(defn gen-animal-string [animal color]
  (str color "-" animal))
(map gen-animal-string animals colors)

(def colors-short
  ["brown" "black"])
(map gen-animal-string animals colors-short)

(map gen-animal-string animals (cycle ["brown" "black"]))



;;; reduce
(reduce + [1 2 3 4 5])
(reduce (fn [r x] (+ r (* x x))) [1 2 3])

(reduce (fn [r x] (if (nil? x) r (conj r x)))
        []
        [:mouse nil :duck nil nil :lory])
