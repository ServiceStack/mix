```code
* Update /features gists           *
* Usage: web run features.ss <id>? *

{{
    {
        'mq': '355338cd60a32ee9c9fc4761269f7782',
    }
    | to => gistMap
}}

(ARGV.Length > 0 ? ARGV : gistMap.Keys) | to => keys

#each id in keys
    gistMap[id] | to => gistId

    {} | to => textFiles

    vfsFileSystem(`features/${id}`) | to => fs
    #each file in fs.allFiles()
        textFiles.putItem(file.VirtualPath.replace('/','\\'), file.textContents()) | end
    /each

    `Writing to ${textFiles.count()} files to ${id} ${gistId} ...`
    vfsGist(gistId, 'GITHUB_GIST_TOKEN'.envVariable()) | to => gist
    gist.writeTextFiles(textFiles)
/each
```