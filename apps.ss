```code
* Update /apps gists           *
* Usage: web run apps.ss <id>? *

{{
    {
        redis:    '6de7993333b457445793f51f6f520ea8',
        spirals:  '4e06df1f1b9099526a7c97721aa7f69c',
        blog:     'ddc064f62cafc91ead200552d9d8ad89',
    }
    | to => gistMap
}}

[] | to => optional

(ARGV.Length > 0 ? ARGV : gistMap.Keys) | to => keys

#each id in keys
    gistMap[id] | to => gistId

    {} | to => files

    vfsFileSystem(`apps/${id}`) | to => fs
    #each file in fs.allFiles()
        file.VirtualPath.replace('/','\\') | to => key
        (optional.contains(key) ? `${key}?` : key) | to => key
        files.putItem(key, file.fileContents()) | end
    /each

    `Writing to ${files.count()} files to ${id} ${gistId} ...`
    vfsGist(gistId, 'GITHUB_GIST_TOKEN'.envVariable()) | to => gist
    gist.writeFiles(files)
/each
```
