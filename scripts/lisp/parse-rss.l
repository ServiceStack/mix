(defn parse-rss [xml]
    (let ( (to) (doc) (channel) (items) (el) )
        (def doc (System.Xml.Linq.XDocument/Parse xml))
        (def to  (ObjectDictionary.))
        (def items (List<ObjectDictionary>.))
        (def channel (first (.Descendants doc "channel")))
        (def el  (XLinqExtensions/FirstElement channel))

        ; retrieve all elements up to the first <item> as top-level entries
        (while (not= (.LocalName (.Name el)) "item")
            (.Add to (.LocalName (.Name el)) (.Value el))
            (def el (XLinqExtensions/NextElement el)))

        ; add all rss item's to items collection
        (doseq (elItem (.Descendants channel "item"))
            (def item (ObjectDictionary.))
            
            (def el (XLinqExtensions/FirstElement elItem))            
            (while el
                (.Add item (.LocalName (.Name el)) (.Value el))
                (def el (XLinqExtensions/NextElement el)))
            
            (.Add items item))

        (.Add to "items" items)
        to
    )
)