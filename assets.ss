```code
* Update /assets gists         *
* Usage: x run assets.ss <id>? *

{{
    {
        nuglify:    '4bdb79d21f199c22b8a86f032c186e2d',
    }
    | to => gistMap
}}

[] | to => optional
[] | to => ignore

(ARGV.Length > 0 ? ARGV : gistMap.Keys) | to => keys

#each id in keys
    gistMap[id] | to => gistId

    {} | to => files

    vfsFileSystem(`assets/${id}`) | to => fs
    #each file in fs.allFiles()
        file.VirtualPath.replace('/','\\') | to => key
        (optional.contains(key) ? `${key}?` : key) | to => key
        #if !ignore.contains(key)
            files.putItem(key, file.fileContents()) | end
        /if
    /each

    `Writing to ${files.count()} files to ${id} ${gistId} ...`
    vfsGist(gistId, 'GISTLYN_TOKEN'.envVariable()) | to => gist
    gist.writeFiles(files)
/each
```
