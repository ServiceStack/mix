```code
* Update /svg mix gists     *
* Usage: x run svg.ss <id>? *

{{
	{ 
		action:        '3fee3e0e37c4e82627ebcfe938feb2ef',
		alert:         '5f4f2e91dfcdebd1cb3cafd51e7f62d5',
		av:            '6dc43abaa209fef881f36f5afbd76252',
		content:       '7b07c4967af2381d0547567faaef7b2e',
		communication: '6e87d40c2bc5b4d45f3ffe2d3f617277',
		device:        'a4dc8f84b6afc6f1b029b5e170877fee',
		editor:        '101580cd6f92eaf96938170e95cb8a2b',
		file:          'feb9668f7985221cdb9d947b223b65b2',
		hardware:      'ab1fc547ee2ff904c3a441548a449b3b',
		image:         '9f8c176aa7d23888e144464a6f9e1bf7',
		maps:          '7925089795e21d45992fc1ba70d2d01c',
		navigation:    'a08aa1199f8676111071f33db29e7c03',
		places:        'faa2aeb415a272dd8586af7a1ac983a6',
		social:        '4c7ff759a722a5b0b9a960c52091d8cb',
		toggle:        '9c4fbd162ca82115ab551b4be9cde2a6',
	}
	| to => gistMap
}}

(ARGV.Length > 0 ? ARGV : gistMap.Keys) | to => keys 

#each id in keys
	gistMap[id] | to => gistId
	#if gistId
		`Updating SVG id ${gistId}':`

		{} | to => textFiles 

		vfsFileSystem(`svg/${id}`) | to => fs 
		#each file in fs.findFiles(`*.svg`) 
			textFiles.putItem(`${id}\\${file.Name}`, file.textContents()) | end 
		/each

		`Writing to ${textFiles.count()} .svg's to id ${gistId} ...` | raw
		vfsGist(gistId, 'GITHUB_GIST_TOKEN'.envVariable()) | to => gist 
		gist.writeTextFiles(textFiles)
	else
		`Unknown id: ${id}`
	/if
/each
```