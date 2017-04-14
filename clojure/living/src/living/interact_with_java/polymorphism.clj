(ns living.interact-with-java.polymorphism
  (:import (com.sun.xml.internal.ws.api.model.wsdl.editable EditableWSDLBoundFault)))

;;; use multimethod to implement polymorphism
(defmulti who-are-you class)

(defmethod who-are-you java.lang.String [input]
  (str "String - who are you?" input))

(defmethod who-are-you clojure.lang.Keyword [input]
  (str "Keyword - who are you? " input))

(defmethod who-are-you java.lang.Long [input]
  (str "Number - who are you?  " input))

(who-are-you "Alice")
(who-are-you :alice)
(who-are-you 1121)

;; :default
(defmethod who-are-you :default [input]
  (str "I don't know - who are you? " input))
(who-are-you true)

;; sample
(defmulti eat-mushroom (fn [height]
                         (if (< height 3)
                           :grow
                           :shrink)))
(defmethod eat-mushroom :grow [_]
  "Eat the right side to grow.")
(defmethod eat-mushroom :shrink [_]
  "Eat the left side to shrink.")
(eat-mushroom 1)
(eat-mushroom 9)


;;; use protocol to implement polymorphism
(defprotocol BigMushroom
  (eat-mushroom1 [this]))
(extend-protocol BigMushroom
  java.lang.String
  (eat-mushroom1 [this]
    (str (.toUpperCase this) " mmmm tasty!"))
  clojure.lang.Keyword
  (eat-mushroom1 [this]
    (case this
      :grow "Eat the right side!"
      :shrink "Eat the left side!"))
  java.lang.Long
  (eat-mushroom1 [this]
    (if (< this 3)
      "Eat the right side to grow"
      "Eat the left side to shrink")))

(eat-mushroom1 "Big Mushroom")
(eat-mushroom1 :grow)
(eat-mushroom1 1)


;;; use record
(defrecord Mushroom [color height])
; now we can use . to create a Mushroom object
(def regular-mushroom (Mushroom. "white and blue polka dots" "2 inches"))
(class regular-mushroom)
; use .- to get value
(.-color regular-mushroom)
(.-height regular-mushroom)


;;; use record and protocol to implement interface
(defprotocol Edible
  (bite-right-side [this])
  (bite-left-side [this]))
(defrecord WonderlandMushroom [color height]
  Edible
  (bite-right-side [this]
    (str "The " color " bite makes you grow bigger"))
  (bite-left-side [this]
    (str "The " color " bite makes you grow smaller")))

(defrecord RegularMushroom [color height]
  Edible
  (bite-right-side [this]
    (str "The " color " bite tastes bad"))
  (bite-left-side [this]
    (str "The " color " bite tastes bad too")))

(def alice-mushroom (WonderlandMushroom. "blue dots" "3 inches"))
(def reg-mushroom (RegularMushroom. "brown" "1 inches"))

(bite-right-side alice-mushroom)
(bite-left-side alice-mushroom)

(bite-left-side reg-mushroom)
(bite-right-side reg-mushroom)

;; use deftype
(deftype WonderlandMushroom1 []
  Edible
  (bite-right-side [this]
    (str "The bite makes you grow bigger"))
  (bite-left-side [this]
    (str "The bite makes you grow smaller")))
(deftype RegularMushroom1 []
  Edible
  (bite-left-side [this]
    (str "The bite tastes bad too"))
  (bite-right-side [this]
    (str "The bite tastes bad")))

(def alice-mushroom1 (WonderlandMushroom1.))
(def reg-mushroom1 (RegularMushroom1.))

(bite-right-side alice-mushroom1)
(bite-left-side alice-mushroom1)

(bite-left-side reg-mushroom1)
(bite-right-side reg-mushroom1)