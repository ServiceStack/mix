```code
var orgName = "ServiceStack"
var url = `https://api.github.com/orgs/${orgName}/repos`
url |> urlContents({userAgent:'gist.cafe'}) |> to => json
{{ json |> parseJson |> orderByDesc => it.watchers |> map => { 
   it.name, it.description, it.language, it.url, it.watchers, it.forks }
   |> to => orgRepos }}
```

Top 3 {{orgName}} GitHub Repos:
{{ orgRepos |> take(3) |> dump }}

Top 10 {{orgName}} GitHub Repos:

{{ orgRepos |> take(10) |> map => { 
   it.name, it.language, it.watchers, it.forks } |> textDump }}

{{ { orgRepos } |> inspectVars }}