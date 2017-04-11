(ns living.control-flow-and-func-transform.destructing)

(let [[color size] ["blue" "small"]]
  (str "The " color " door is " size))

(let [[color [size]] ["blue" ["very small"]]]
  (str "The " color " door is " size))


;; :as
(let [[color [size] :as original] ["blue" ["small"]]]
  {:color color :size size :original original})


;; destructing in map
(let [{flower1 :flower1 flower2 :flower2}
      {:flower1 "red" :flower2 "blue"}]
  (str "The flowers are " flower1 " and " flower2))

(let [{flower1 :flower1 :as all-flowers}
      {:flower1 "red"}]
  [flower1 all-flowers])


;; use :keys
(let [{:keys [flower1 flower2]}
      {:flower1 "red" :flower2 "blue"}]
  (str "The flowers are " flower1 " and " flower2))


;; destrucing in defn
(defn flower-colors [colors]
  (str "The flowers are "
       (:flower1 colors)
       " and "
       (:flower2 colors)))
(flower-colors {:flower1 "red" :flower2 "blue"})