#!/bin/bash lein-exec-p
; vim: ft=clojure :

(use '[leiningen.exec :only (deps)])

(deps '[[org.clojure/data.csv "0.1.3"]])

(require '[clojure.string :as string]
         '[clojure.pprint :refer [pprint cl-format]]
         '[clojure.data.csv :as csv]
         '[clojure.java.io :refer [reader writer as-url]])


(defn main [& args]
  (pprint args))

(apply main (rest *command-line-args*))
