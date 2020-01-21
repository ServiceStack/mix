(load "parse-rss.l")

(def rss (urlContentsWithCache "https://news.ycombinator.com/rss"))
(dump (take 3 (:items (parse-rss rss))))

