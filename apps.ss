```code
* Update /apps gists         *
* Usage: x run apps.ss <id>? *

{{
    {
        autodto:   'c6567f32ba7de2eb760dc776f3067e78',
        redis:     '6de7993333b457445793f51f6f520ea8',
        spirals:   '4e06df1f1b9099526a7c97721aa7f69c',
        blog:      'ddc064f62cafc91ead200552d9d8ad89',
        plugins:   '189cd72bfaf480526e4b34814c80f2c0',
        rockwind:  '0148c87e154fb4731c7fa6219375d989',
        sharpdata: '1850123e01e601a5718bc836362063a8',
    }
    | to => gistMap
}}

var optional = []
var ignore = ['blog.sqlite','.gitignore']

var keys = (ARGV.Length > 0 ? ARGV : gistMap.Keys)

#each id in keys
    var gistId = gistMap[id]

    var files = {}

    var fs = vfsFileSystem(`apps/${id}`)

    fs.deleteDirectory('GPUCache') |> end
    fs.deleteFile('cef.log') |> end

    #each file in fs.allFiles()
        var key = file.VirtualPath.replace('/','\\')
        (optional.contains(key) ? `${key}?` : key) |> to => key
        #if !ignore.contains(key)
            files.putItem(key, file.fileContents()) |> end
        /if
    /each

    `Writing to ${files.count()} files to ${id} ${gistId} ...`
    vfsGist(gistId, 'GISTLYN_TOKEN'.envVariable()) |> to => gist
    gist.writeFiles(files)
/each
```
