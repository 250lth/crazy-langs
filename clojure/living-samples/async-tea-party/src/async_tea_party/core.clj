(ns async-tea-party.core
  (:require [clojure.core.async :as async]))

(defn foo
  "I don't do a whole lot."
  [x]
  (println x "Hello, World!"))

;;; core.async basic

; create a channel(without buffer)
(def tea-channel1 (async/chan))
; we can put and get things by the channel
; two ways: sync and async

;; sync way
; a blocked put: >!!
; a blocked get: <!!

; create a channel with buffer
(def tea-channel (async/chan 10))

(async/>!! tea-channel :cup-of-tea)
(async/<!! tea-channel)

; use close! to close the channel
(async/>!! tea-channel :cup-of-tea2)
(async/>!! tea-channel :cup-of-tea3)
(async/>!! tea-channel :cup-of-tea4)

(async/close! tea-channel)
(async/>!! tea-channel :cup-of-tea5)                        ;false

(async/<!! tea-channel)
(async/<!! tea-channel)
(async/<!! tea-channel)
(async/<!! tea-channel)                                     ;nil

; nil can not be put into channel
(async/>!! tea-channel nil)


;; async way
; put: >!, use with a go block
; get: <!, use with a go block
(let [tea-channel (async/chan)]
  (async/go (async/>! tea-channel :cup-of-tea))
  (async/go (println "Thanks for the " (async/<! tea-channel))))

; create a continious woking go-loop, waiting for values from a channel
(async/go-loop []
               (println "Thanks for the " (async/<! tea-channel))
               (recur))
(async/>!! tea-channel :hot-cup-of-tea)
(async/>!! tea-channel :tea-with-sugar)
(async/>!! tea-channel :tea-with-milk)
; anything in go block has its own threadpool


;;; core/async can listen multi channels and get the first value coming
; use alts!
(def tea-channel (async/chan 10))
(def milk-channel (async/chan 10))
(def sugar-channel (async/chan 10))

(async/go-loop []
               (let [[v ch] (async/alts! [tea-channel
                                          milk-channel
                                          sugar-channel])]
                 (println "Got " v " from " ch)
                 (recur)))
(async/>!! sugar-channel :sugar)
(async/>!! milk-channel :milk)
(async/>!! tea-channel :tea)
