(ns cheshire-cat.core
      (:require-macros [cljs.core.async.macros :refer [go]])
      (:require [clojure.browser.repl :as repl]
                [cljs-http.client :as http]
                [cljs.core.async :refer [<!]]))

(defn ^:export init []
      (repl/connect "http://localhost:9000/repl")
      (go
        (let [response (<! (http/get "/cheshire-cat"))]
             (js/alert (:body response)))))