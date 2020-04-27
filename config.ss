```code
* Update /config gists         *
* Usage: x run config.ss <id>? *

{{
    {
        docker:     '54fbb66fa39740ad1c865a59b5ed2e31',
        nginx:      '38a125eede8228ddf40651e2529a5c70',
        supervisor: '2db295508517a4eed59906320e95d98a',
    }
    | to => gistMap
}}

[] | to => optional
[] | to => ignore

(ARGV.Length > 0 ? ARGV : gistMap.Keys) | to => keys

#each id in keys
    gistMap[id] | to => gistId

    {} | to => files

    vfsFileSystem(`config/${id}`) | to => fs
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
