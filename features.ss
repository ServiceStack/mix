```code
* Update /features gists         *
* Usage: x run features.ss <id>? *

{{
    {
        'mq':       '355338cd60a32ee9c9fc4761269f7782',
        'userauth': '9fe61f1967c53d85984402118ee03017',
    }
    | to => gistMap
}}
['Configure.Mq.cs'] | to => optional
(ARGV.Length > 0 ? ARGV : gistMap.Keys) | to => keys

#each id in keys
    gistMap[id] | to => gistId

    {} | to => textFiles

    vfsFileSystem(`features/${id}`) | to => fs
    #each file in fs.allFiles()
        file.VirtualPath.replace('/','\\') | to => key
        (optional.contains(key) ? `${key}?` : key) | to => key
        textFiles.putItem(key, file.textContents()) | end
    /each

    `Writing to ${textFiles.count()} files to ${id} ${gistId} ...`
    vfsGist(gistId, 'GITHUB_GIST_TOKEN'.envVariable()) | to => gist
    gist.writeTextFiles(textFiles)
/each
```