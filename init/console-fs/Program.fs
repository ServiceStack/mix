open System
open System.Linq
open ServiceStack
open ServiceStack.Text

module Program =

    type GithubRepo() =
        member val Name = "" with get, set
        member val Description = "" with get, set
        member val Url = "" with get, set
        member val Homepage = "" with get, set
        member val Language = "" with get, set
        member val Watchers = 0 with get, set
        member val Forks = 0 with get, set

    type Table = { Name:string; Language:string; Watchers:int; Forks:int; }

    [<EntryPoint>]
    let main args =

        let orgName = "dotnet"

        let orgRepos = 
            $"https://api.github.com/orgs/{orgName}/repos"
                .GetJsonFromUrl(fun httpReq -> httpReq.UserAgent <- "gist.cafe")
                .FromJson<GithubRepo[]>()
                .OrderByDescending(fun x -> x.Watchers)

        $"Top 3 '{orgName}' Github Repos:".Print()
        orgRepos.Take(3).ToList().PrintDump()

        $"\nTop 10 {orgName} Github Repos:\n".Print();
        orgRepos.Take(10).Select(fun x -> 
            {| Name = x.Name; Language = x.Language; Watchers = x.Watchers; Forks = x.Forks |})
            .PrintDumpTable()

        Inspect.vars({| orgRepos = orgRepos |})

        let exitCode = 0
        exitCode
