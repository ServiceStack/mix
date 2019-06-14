{{
    { 
        alert:      '5f4f2e91dfcdebd1cb3cafd51e7f62d5',
        content:    '7b07c4967af2381d0547567faaef7b2e',
        editor:     '101580cd6f92eaf96938170e95cb8a2b',
        file:       'feb9668f7985221cdb9d947b223b65b2',
        navigation: 'a08aa1199f8676111071f33db29e7c03',
        social:     '4c7ff759a722a5b0b9a960c52091d8cb',
        toggle:     '9c4fbd162ca82115ab551b4be9cde2a6',
    }
    | assignTo: svgGroups
}}

{{#each group in svgGroups.Keys}}
    {{svgGroups[group] | assignTo: gistId}}

    Updating SVG {{group}} '{{gistId}}':

    {{ {} | assignTo: textFiles }}

    {{ vfsFileSystem(`svg/${group}`) | assignTo: fs }}
    {{#each file in fs.findFiles(`*.svg`) }}
        {{ textFiles.putItem(`${group}\\${file.VirtualPath.replace('/','\\')}`, fs.fileTextContents(file.VirtualPath)) | end }}
    {{/each}}

    Writing to {{textFiles | count}} .svg's to {{group}} '{{gistId}}' ...
    {{#noop}}
    {{ vfsGist(gistId, 'GITHUB_GIST_TOKEN'.envVariable()) | assignTo: svgGist }}
    {{ svgGist.writeTextFiles(textFiles) }}
    {{/noop}}
{{/each}}
