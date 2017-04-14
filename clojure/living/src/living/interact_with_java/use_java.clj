(ns living.interact-with-java.use-java
  (:import (java.net InetAddress)))

(class "caterpillar")

(. "caterpillar" toUpperCase)

(.toUpperCase "caterpillar")

(.indexOf "caterpillar" "pi")

(new String "Hehe...")

(String. "Hi!!!")

(InetAddress/getByName "localhost")

(.getHostName (InetAddress/getByName "localhost"))

;;; doto macro
(def sb (doto (StringBuffer. "Who ")
          (.append "are ")
          (.append "you?")))
(.toString sb)

