* Update /init gists         *
* Usage: x run init.sc <id>? *

{{
    {
        init:             '58030e271595520d87873c5df5e4c2eb',
        'init-lts':       '95af30f3bce3f5044d91fa8706e5b958',
        'init-sharp-app': '5c9ee9031e53cd8f85bd0e14881ddaa8',
    }
    |> to => gistMap
}}

var optional = []
var ignore = []

var keys = ARGV.Length > 0 ? ARGV : gistMap.Keys

#each id in keys
    var gistId = gistMap[id]
    var files = {}
    var fs = vfsFileSystem(`init/${id}`)

    fs.deleteDirectory('GPUCache') |> end
    fs.deleteDirectory('bin') |> end
    fs.deleteDirectory('obj') |> end

    fs.deleteFile('cef.log') |> end

    #each file in fs.allFiles()
        var key = file.VirtualPath.replace('/','\\')
        var key = optional.contains(key) ? `${key}?` : key
        #if !ignore.contains(key)
            files.putItem(key, file.fileContents()) |> end
        /if
    /each

    `Writing to ${files.count()} files to ${id} ${gistId} ...`
    var gist = vfsGist(gistId, 'GISTLYN_TOKEN'.envVariable())
    gist.writeFiles(files)
/each
