(ns cheshire-cat.cheshire-json-demo
  (:require [cheshire.core :as json]))

;;; encode: using generate-string
(json/generate-string {:name "Cheshire Cat" :state :grinning})

;;; use parse-string to decode
(json/parse-string "{\name\":\"Cheshire Cat\",\"state\":\"grinning\"}")
(json/parse-string "{\name\":\"Cheshire Cat\",\"state\":\"grinning\"}" true)


