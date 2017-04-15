(ns cheshire-cat.core
      (:require [clojure.browser.repl :as repl]))

(defn ^:export init []
      (repl/connect "http://localhost:9000/repl"))