Imports System.Linq
Imports System.Net
Imports ServiceStack
Imports ServiceStack.Text

Module Program

    Public Class GithubRepo
        Public Property Name As String
        Public Property Description As String
        Public Property Url As String
        Public Property Homepage As String
        Public Property Language As String
        Public Property Watchers As Integer
        Public Property Forks As Integer
    End Class

    Sub Main(args As String())

        Dim orgName As String = "dotnet"

        Dim orgRepos = $"https://api.github.com/orgs/{orgName}/repos" _
            .GetJsonFromUrl(Sub(httpReq) httpReq.UserAgent = "gist.cafe") _
            .FromJson(Of GithubRepo())() _
            .OrderByDescending(Function(x) x.Watchers)

        Console.WriteLine($"Top 3 '{orgName}' Github Repos:")
        orgRepos.Take(3).ToList().PrintDump()

        Console.WriteLine($"{vbCrLf}Top 10 {orgName} Github Repos:{vbCrLf}")
        orgRepos.Take(10).Select(Function(x) _
            New With { x.Name, x.Language, x.Watchers, x.Forks }).PrintDumpTable()

        Inspect.vars(New With { orgRepos })

    End Sub

End Module
