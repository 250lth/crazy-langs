(ns serpent-talk.talk
  (:require [camel-snake-kebab.core :as csk]))

(defn foo
  "I don't do a whole lot."
  [x]
  (println x "Hello, World!"))


(csk/->snake_case "hello pigeon")

(defn serpent-talk [input]
  (str "Serpent! You said: "
    (csk/->snake_case input)))

(defn -main [& args]
  (println (serpent-talk (first args))))