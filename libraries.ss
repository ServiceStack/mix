```code
* Update /libraries gists           *
* Usage: web run libraries.ss <id>? *

{{
    {
        'react-lite-lib': 'ad42adc11337c243ee203f9e9f84622c',
        'vue-lite-lib':   '717258cd4c26ba612e5eed0615d8d61c',
    }
    | to => gistMap
}}

(ARGV.Length > 0 ? ARGV : gistMap.Keys) | to => keys

#each id in keys
    gistMap[id] | to => gistId

    {} | to => files

    vfsFileSystem(`libraries/${id}`) | to => fs
    #each file in fs.allFiles()
        files.putItem(file.VirtualPath.replace('/','\\'), file.fileContents()) | end
    /each

    `Writing to ${files.count()} files to ${id} '${gistId}' ...` | raw
    vfsGist(gistId, 'GITHUB_GIST_TOKEN'.envVariable()) | to => gist
    gist.writeFiles(files)
/each
```