(ns living.state-cucurrency.use-agent)

(def who-agent (agent :caterpillar))
@who-agent

(defn change [state]
  (case state
    :caterpillar :chrysalis
    :chrysalis :butterfly
    :butterfly))

;; send
(send who-agent change)
@who-agent

;; send-off
; threadpool
(send-off who-agent change)
@who-agent

;; agent meets error
(def who-agent1 (agent :caterpillar))

(defn change-error [state]
  (throw (Exception. "Boom!")))

(send who-agent1 change-error)
@who-agent1

(send-off who-agent1 change)

; check agent errors
(agent-errors who-agent1)

(send who-agent1 change)
@who-agent1

;; create set-error-mode! when creating agent
(set-error-mode! who-agent :continue)

(defn error-handler-fn [a ex]
  (println "error " ex " value is " @a))

(set-error-handler! who-agent error-handler-fn)

(def who-agent2 (agent :caterpillar))
(set-error-mode! who-agent2 :continue)
(set-error-handler! who-agent2 error-handler-fn)
(send who-agent2 change-error)
@who-agent2

(send who-agent2 change)
@who-agent2