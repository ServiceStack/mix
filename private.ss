```code
* Update /private gists         *
* Usage: x run private.ss <id>? *

{{
    {
        'northwind':    'dc49cbcf6178033500c19b80f2ec8c3a',
    }
    |> to => gistMap
}}

var optional = []
var ignore = []

var keys = ARGV.Length > 0 ? ARGV : gistMap.Keys

#each id in keys
    var gistId = gistMap[id]
    var files = {}

    var fs = vfsFileSystem(`private/${id}`)
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
