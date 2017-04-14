(ns async-tea-party.tea-party-from-cmmandline
  (:gen-class)
  (:require [clojure.core.async :as async]))

(def result-chan (async/chan 10))

(def google-tea-service-chan (async/chan 10))
(def yahoo-tea-service-chan (async/chan 10))

(defn random-add []
  (reduce + (conj [] (repeat 1 (rand-int 1000000)))))

(defn request-google-tea-service []
  (async/go
    (random-add)
    (async/>! google-tea-service-chan
              "tea comliments of google")))

(defn request-yahoo-tea-service []
  (async/go
    (random-add)
    (async/>! yahoo-tea-service-chan
              "tea comliments of yahoo")))


(defn request-tea []
  (request-google-tea-service)
  (request-yahoo-tea-service)
  (async/go (let [[v] (async/alts!
                        [google-tea-service-chan
                         yahoo-tea-service-chan])]
              (async/>! result-chan v)))
  )

;;; -main
(defn -main [& args]
  (println "Requesting tea!")
  (request-tea)
  (println (async/<!! result-chan)))
