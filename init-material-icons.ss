```code
* Rename material design icon's 'ic_id_48.svg' to 'id.svg' *
* Usage: web run init.material-icons.css <id>              *

ARGV.Length == 0 ? throw("USAGE: web run init-material-icons.ss <svgdir>") : null

ARGV[0] | assignTo: id
vfsFileSystem(`svg/${id}`) | assignTo: fs

{{ fs.allFiles()
   | where => it.VirtualPath.startsWith('ic_')
   | map => `mv svg/${id}/${it.VirtualPath} svg/${id}/${it.VirtualPath.substring(3).replace('_48px','')}`
   | map => (envIsWindows ? `move ${it.substring(3).replace('/','\\')}` : it)
   | assignTo: cmds
}}

`Moving ${cmds.Count} ${id} file(s)...`
#each mv in cmds
    mv
    mv | sh
/each
```