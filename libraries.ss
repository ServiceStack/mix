```code
* Update /libraries gists           *
* Usage: web run libraries.ss <id>? *

{{
    {
        'react-lite-lib': 'ad42adc11337c243ee203f9e9f84622c',
        'vue-lite-lib':   '717258cd4c26ba612e5eed0615d8d61c',
    }
    | assignTo: gistMap
}}

(ARGV.Length > 0 ? ARGV : gistMap.Keys) | assignTo: keys

#each id in keys
    gistMap[id] | assignTo: gistId

    {} | assignTo: textFiles

    vfsFileSystem(`libraries/${id}`) | assignTo: fs
    #each file in fs.allFiles()
        textFiles.putItem(file.VirtualPath.replace('/','\\'), file.textContents()) | end
    /each

    `Writing to ${textFiles.count()} files to ${id} '${gistId}' ...` | raw
    vfsGist(gistId, 'GITHUB_GIST_TOKEN'.envVariable()) | assignTo: gist
    gist.writeTextFiles(textFiles)
/each
```