* Usage: x run copy.sc *

var fs = vfsFileSystem('.')

var dataConent = fs.file('/home/data.cs').textContents()
var csProjConent = fs.file('/home/MyApp.csproj').textContents()

#each dir in fs.dirDirectories('select-examples')
    fs.writeFile(`/${dir.VirtualPath}/data.cs`, dataConent)
    fs.writeFile(`/${dir.VirtualPath}/MyApp.csproj`, csProjConent)
    #if !fs.fileExists(`/${dir.VirtualPath}/main.cs`)
        fs.writeFile(`/${dir.VirtualPath}/main.cs`, "")
    /if
/each
