(ns main
    (:require [clojure.data.json :as json])
    (:import (net.servicestack.gistcafe Inspect)))

(defn -main [& args]
    (let [orgName  "clojure"
          url      (str "https://api.github.com/orgs/" orgName "/repos")
          json     (Inspect/readUrlAsText (java.net.URL. url))
          orgRepos (map #(select-keys % 
            ["name" "description" "language" "url" "watchers" "forks"])
            (json/read-str json))]
                    
            (println "Top 3" orgName "GitHub Repos:")
            (Inspect/printDump (take 3 orgRepos))

            (println "\nTop 10" orgName "GitHub Repos:")
            (Inspect/printDumpTable (take 10 orgRepos) 
                ["name" "language" "watchers" "forks"])

            (Inspect/vars { "orgRepos" orgRepos })
    ))