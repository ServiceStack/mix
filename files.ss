```code
* Update /files gists         *
* Usage: x run files.ss <id>? *

{{
    {
        'bcl.proto':     '33232feeeb4f7d2043d27afb1d60259b',
        'gen-https.sh':  '4b321ee5258d5c7d8c634610aabb5af1',
    }
    |> to => gistMap
}}
var optional = []
var keys = ARGV.Length > 0 ? ARGV : gistMap.Keys

#each id in keys
    var gistId = gistMap[id]

    var textFiles = {}

    var fs = vfsFileSystem(`files/${id}`)
    #each file in fs.allFiles()
        var key = file.VirtualPath.replace('/','\\')
        key = optional.contains(key) ? `${key}?` : key
        textFiles.putItem(key, file.textContents()) |> end
    /each

    `Writing to ${textFiles.count()} files to ${id} ${gistId} ...`
    var gist = vfsGist(gistId, 'GISTLYN_TOKEN'.envVariable())
    gist.writeTextFiles(textFiles)
/each
```