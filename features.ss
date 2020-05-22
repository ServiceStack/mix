```code
* Update /features gists         *
* Usage: x run features.ss <id>? *

{{
    {
        mq:            '355338cd60a32ee9c9fc4761269f7782',
        userauth:      '9fe61f1967c53d85984402118ee03017',
        grpc:          '656c29a7257dc374d22d4aa709ba7244',
        autocrudgen:   '464a80c15cb3af4f41db7810082dc00c',
    }
    |> to => gistMap
}}
var optional = ['Configure.Mq.cs']
var keys = ARGV.Length > 0 ? ARGV : gistMap.Keys

#each id in keys
    var gistId = gistMap[id]

    var textFiles = {}

    var fs = vfsFileSystem(`features/${id}`)
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