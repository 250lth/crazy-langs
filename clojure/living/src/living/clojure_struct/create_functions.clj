(ns living.clojure-struct.create-functions)

;; defn

(defn follow-the-rabbit [] "Off we go!")
(follow-the-rabbit)

;; funcs with args
(defn shop-for-jams [jam1 jam2]
  {:name "jam-basket"
   :jam1 jam1
   :jam2 jam2})
(shop-for-jams "strawberry" "maralade")

;; anonymous func : fn
(fn [] (str "Off we go!"))
; use () to call it
((fn [] (str "Off we go!")))

;; short for anonymous func: #()
(#(str "Off we go!"))
; % for one arg
(#(str "Off we go" "!" " - " %) "again")
; %1 %2 for more args
(#(str "Off we go" "!" " - " %1 %2) "again" "?")