(def orgName "ServiceStack")
(def json (urlContents 
    (str "https://api.github.com/orgs/" orgName "/repos") 
    { :userAgent "gist.cafe" }))
(def orgRepos (map #(it { 
        :name        (:name %) 
        :description (:description %) 
        :lang        (:language %) 
        :url         (:url %) 
        :watchers    (:watchers %) 
        :forks       (:forks %) 
    })
    (reverse (sort-by :watchers (parseJson json)))))

(str "Top 3 "  orgName " GitHub Repos:")
(dump (take 3 orgRepos))

(str "\nTop 10 "  orgName " GitHub Repos:\n")
(textDump (map #(it { 
        :name (:name %) 
        :lang (:lang %) 
        :watchers (:watchers %) 
        :forks (:forks %) 
    }) 
    (take 10 orgRepos)))

(inspectVars { :orgRepos orgRepos })