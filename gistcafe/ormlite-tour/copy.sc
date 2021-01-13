* Usage: x run copy.sc *

var fs = vfsFileSystem('.')

var dataConent = fs.file('/home/data.cs').textContents()
var csProjConent = fs.file('/home/MyApp.csproj').textContents()

var exampleDirs = ['select-examples','insert-examples','update-examples','delete-examples','create-table-examples','modify-schema-examples']
#each exampleDir in exampleDirs
    #each dir in fs.dirDirectories(exampleDir)
        fs.writeFile(`/${dir.VirtualPath}/data.cs`, dataConent)
        fs.writeFile(`/${dir.VirtualPath}/MyApp.csproj`, csProjConent)
        #if !fs.fileExists(`/${dir.VirtualPath}/main.cs`)
            fs.writeFile(`/${dir.VirtualPath}/main.cs`, "")
        /if
    /each
/each
