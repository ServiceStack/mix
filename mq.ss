```code
* Update /mq gists           *
* Usage: web run mq.ss <id>? *

{{
    {
        'backgroundmq': '18254cb98edbfc16ea24d0f7453edc24',
        'rabbitmq':     '56d64752095cff090eb8b7c70e13220a',
        'sqs':          '095328adc208db9650e81e9511dcafe9',
        'servicebus':   '0bbcb8db96236f4f90aafe4cd3812244',
        'redismq':      '27e9d7ba79a318abb1e018396be2c123',
    }
    | assignTo: gistMap
}}

(ARGV.Length > 0 ? ARGV : gistMap.Keys) | assignTo: keys

#each id in keys
    gistMap[id] | assignTo: gistId
    #if gistId
        {} | assignTo: textFiles

        vfsFileSystem(`mq/${id}`) | assignTo: fs
        #each file in fs.allFiles()
            textFiles.putItem(file.VirtualPath.replace('/','\\'), file.textContents()) | end
        /each

        `Writing to ${textFiles.count()} files to ${id} ${gistId} ...`

        vfsGist(gistId, 'GITHUB_GIST_TOKEN'.envVariable()) | assignTo: gist
        gist.writeTextFiles(textFiles)
    else
        `ERROR Unknown id: ${id}`
    /if
/each
```