(ns living.state-cucurrency.use-atom)

;;; use atom to create atoms
(def who-atom (atom :caterpillar))
who-atom
@who-atom                                                   ; use @ to deref

;;; change an atom: sync changes

;; reset! simply change
(reset! who-atom :chrysalis)
@who-atom

;; swap! use a function on it
(defn change [state]
  (case state
    :caterpillar :chrysalis
    :chrysalis :butterfly
    :butterfly))
(swap! who-atom change)
@who-atom

; swap! sample
(def counter (atom 0))
@counter
; one thread
(dotimes [_ 5] (swap! counter inc))
@counter

; 3 threads
(def counter1 (atom 0))
@counter1
(let [n 5]
  (future (dotimes [_ n] (swap! counter1 inc)))
  (future (dotimes [_ n] (swap! counter1 inc)))
  (future (dotimes [_ n] (swap! counter1 inc))))
@counter1

; with side-effect
(def counter2 (atom 0))
(defn inc-print [val]
  (println val)
  (inc val))
(swap! counter2 inc-print)

; 3 threads with side-effect
(def counter3 (atom 0))
(let [n 2]
  (future (dotimes [_ n] (swap! counter3 inc-print)))
  (future (dotimes [_ n] (swap! counter3 inc-print)))
  (future (dotimes [_ n] (swap! counter3 inc-print))))      ; some number is printed multiple times
@counter3

