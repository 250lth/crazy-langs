(ns living.control-flow-and-func-transform.recursion)

;; recursion sample
(def adjs ["normal"
           "too small"
           "too big"
           "is swimming"])

(defn alice-is [in out]
  (if (empty? in)
    out
    (alice-is
      (rest in)
      (conj out
            (str "Alice is " (first in))))))

(alice-is adjs [])


;; use loop
(defn alice-is-loop [input]
  (loop [in input
         out []]
    (if (empty? in)
      out
      (recur (rest in)
             (conj out
                   (str "Alice is " (first in)))))))
(alice-is-loop adjs)


;; recur has no stackoverflow
(defn countdown [n]
  (if (= n 0)
    n
    (countdown (- n 1))))
(countdown 3)
#_(countdown 1000000)                                       ;stackoverflow

(defn countdown-loop [n]
  (if (= n 0)
    n
    (recur (- n 1))))
(countdown-loop 1000000)