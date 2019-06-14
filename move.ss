{{ vfsFileSystem('svg/toggle') | assignTo: fs }}
{{#each file in fs.allFiles()}}
{{#if file.VirtualPath.startsWith('ic_')}}
move {{file.VirtualPath}} {{file.VirtualPath | substring(3) | replace ('_48px','') }}
{{/if}}
{{/each}}
