```code
* Update /auth gists         *
* Usage: x run auth.ss <id>? *

{{
    {
        'auth':     '1ec54e10d44f87e0f20daaf7e2248fea',
        'memory':   'a72638d02832d9114a99c396158a84bd',
        'db':       '16fddde0763b3eee516d670ab9fab194',
        'redis':    '41efecbea51f7f926e99848a779241d5',
        'dynamodb': '88701bf13350f14eea982ae3e1495c89',
        'mongodb':  'a9a816ed0f78ccd020e57c903bd2c824',
        'ravendb':  '638bc1c25926b050ef290c284909268e',
        'marten':   'e9a38f7f04ef23e94b7251d95ca45f25',
    }
    | to => gistMap
}}

(ARGV.Length > 0 ? ARGV : gistMap.Keys) | to => keys 

#each id in keys
    gistMap[id] | to => gistId
    #if gistId
        `Updating Auth id ${gistId}:`

        {} | to => textFiles 

        vfsFileSystem(`auth/${id}`) | to => fs 
        #each file in fs.allFiles() 
            textFiles.putItem(file.VirtualPath.replace('/','\\'), file.textContents()) | end 
        /each

        `Writing to ${textFiles.count()} files to id ${gistId} ...`

        vfsGist(gistId, 'GISTLYN_TOKEN'.envVariable()) | to => gist 
        gist.writeTextFiles(textFiles)
    else
        `Unknown id: ${id}`
    /if
/each
```