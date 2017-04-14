(ns serpent-talk.talk-test
  (:require [clojure.test :refer :all]
            [serpent-talk.talk :refer :all]))

(deftest a-test
  (testing "FIXME, I fail."
    (is (= 1 1))))

(deftest test-serpernt-talk
  (testing "Cries serpent! with a sname_case version of the inptu"
    (is (= "Serpent! You said: hello_there"
           (serpent-talk "hello there")))))