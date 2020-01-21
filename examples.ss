```code
* Update /examples gists         *
* Usage: x run examples.ss <id>? *

{{
    {
        'validation': '33873ed2857b2c5a9623629c6210d665',
    }
    | to => gistMap
}}

(ARGV.Length > 0 ? ARGV : gistMap.Keys) | to => keys

#each id in keys
    gistMap[id] | to => gistId

    {} | to => files

    vfsFileSystem(`examples/${id}`) | to => fs
    #each file in fs.allFiles()
        file.VirtualPath.replace('/','\\') | to => key
        files.putItem(key, file.fileContents()) | end
    /each

    `Writing to ${files.count()} files to ${id} ${gistId} ...`
    vfsGist(gistId, 'GITHUB_GIST_TOKEN'.envVariable()) | to => gist
    gist.writeFiles(files)
/each
```