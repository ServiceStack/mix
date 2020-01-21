```code
* Rename material design icon's 'ic_id_48.svg' to 'id.svg' *
* Usage: x run init.material-icons.css <id>              *

ARGV.Length == 0 ? throw("USAGE: x run init-material-icons.ss <svgdir>") : null

ARGV[0] | to => id
vfsFileSystem(`svg/${id}`) | to => fs

{{ fs.allFiles()
   | where => it.VirtualPath.startsWith('ic_')
   | map => `mv svg/${id}/${it.VirtualPath} svg/${id}/${it.VirtualPath.substring(3).replace('_48px','')}`
   | map => (envIsWindows ? `move ${it.substring(3).replace('/','\\')}` : it)
   | to => cmds
}}

`Moving ${cmds.Count} ${id} file(s)...`
#each mv in cmds
    mv
    mv | sh
/each
```