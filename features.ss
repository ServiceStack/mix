```code
* Update /features gists           *
* Usage: web run features.ss <id>? *

{{
    {
        'mq': '355338cd60a32ee9c9fc4761269f7782',
    }
    | assignTo: gistMap
}}

(ARGV.Length > 0 ? ARGV : gistMap.Keys) | assignTo: keys

#each id in keys
    gistMap[id] | assignTo: gistId

    {} | assignTo: textFiles

    vfsFileSystem(`features/${id}`) | assignTo: fs
    #each file in fs.allFiles()
        textFiles.putItem(file.VirtualPath.replace('/','\\'), file.textContents()) | end
    /each

    `Writing to ${textFiles.count()} files to ${id} ${gistId} ...`
    vfsGist(gistId, 'GITHUB_GIST_TOKEN'.envVariable()) | assignTo: gist
    gist.writeTextFiles(textFiles)
/each
```