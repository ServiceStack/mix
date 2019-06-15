{{
    {
        'react-lite-lib': 'ad42adc11337c243ee203f9e9f84622c',
        'vue-lite-lib':   '717258cd4c26ba612e5eed0615d8d61c',
    }
    | assignTo: libGroups
}}

{{ libGroups | dump }}

{{#each group in libGroups.Keys}}
    {{libGroups[group] | assignTo: gistId}}

    {{ {} | assignTo: textFiles }}

    {{ vfsFileSystem(`libraries/${group}`) | assignTo: fs }}
    {{#each file in fs.allFiles()}}
        {{ textFiles.putItem(file.VirtualPath.replace('/','\\'), file.textContents()) | end }}
    {{/each}}

    Writing to {{textFiles | count}} files to {{group}} '{{gistId}}' ...
    {{ vfsGist(gistId, 'GITHUB_GIST_TOKEN'.envVariable()) | assignTo: gist }}
    {{ gist.writeTextFiles(textFiles) }}
{{/each}}
