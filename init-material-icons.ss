{{ ARGV.Length == 0 ? throw("USAGE: web run init-material-icons.ss <svgdir>") : null }}

{{ ARGV[0] | assignTo: group }}
{{ vfsFileSystem(`svg/${group}`) | assignTo: fs }}

{{ fs.allFiles()
   | where => it.VirtualPath.startsWith('ic_')
   | map => `mv svg/${group}/${it.VirtualPath} svg/${group}/${it.VirtualPath.substring(3).replace('_48px','')}`
   | map => (envIsWindows ? `move ${it.substring(3).replace('/','\\')}` : it)
   | assignTo: cmds
}}

Moving {{cmds.Count}} {{group}} file(s)...
{{#each mv in cmds}}
{{ mv }}
{{ mv | sh }}
{{/each}}
