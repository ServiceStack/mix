```code
* Update /db gists           *
* Usage: web run db.ss <id>? *

{{
    {
        'redis':     '512309b3cb7d734bb0f7323907499b08',
        'sqlserver': '7075e53e1fe69d3da12996677b5f3a5a',
        'sqlite':    '768d7b330b8c977f43310b954ceea668',
        'postgres':  'faf62da8b8ef30849506631025a5d06c',
        'mysql':     '2c3e17c98d20d7073be5f24cb16ab02e',
        'oracle':    'c7841707ecd0c6eec2b440f82b85d857',
        'firebird':  '43287f1403612e81ddb89142669101e5',
        'dynamodb':  'd607e070cca190e0d59368dd6b9b147c',
        'mongodb':   'f777396583262127a66e2369ae475d3f',
        'ravendb':   '8ef41d53c8f54d85a50f26e2aad6da73',
        'marten':    'efcf39f4ce37a4822571a3a3433f5b4a',
    }
    | to => gistMap
}}

(ARGV.Length > 0 ? ARGV : gistMap.Keys) | to => keys 

#each id in keys
    gistMap[id] | to => gistId
    #if gistId
        `Updating DB id ${gistId}:`

        {} | to => textFiles 

        vfsFileSystem(`db/${id}`) | to => fs 
        #each file in fs.allFiles() 
            textFiles.putItem(file.VirtualPath.replace('/','\\'), file.textContents()) | end 
        /each

        `Writing to ${textFiles.count()} files to id ${gistId} ...`

        vfsGist(gistId, 'GITHUB_GIST_TOKEN'.envVariable()) | to => gist 
        gist.writeTextFiles(textFiles)
    else
        `ERROR Unknown id: ${id}`
    /if
/each
```