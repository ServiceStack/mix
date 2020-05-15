```code
* Update /sqlite gists         *
* Usage: x run sqlite.ss <id>? *

{{
    {
        'northwind':           '97d0bcd3ebd582e06c85f8400683e037',
        'northwind.sharpdata': '0ce0d5b828303f1cb4637450b563adbd',
    }
    |> to => gistMap
}}

var optional = []
var ignore = []

var keys = ARGV.Length > 0 ? ARGV : gistMap.Keys

#each id in keys
    var gistId = gistMap[id]
    var files = {}

    var fs = vfsFileSystem(`sqlite/${id}`)
    #each file in fs.allFiles()
        var key = file.VirtualPath.replace('/','\\')
        key = optional.contains(key) ? `${key}?` : key
        #if !ignore.contains(key)
            files.putItem(key, file.fileContents()) |> end
        /if
    /each

    `Writing to ${files.count()} files to ${id} ${gistId} ...`
    var gist = vfsGist(gistId, 'GISTLYN_TOKEN'.envVariable())
    gist.writeFiles(files)
/each
```
