using System.Linq;
using ServiceStack;
using ServiceStack.Text;

var orgName = "dotnet";

var orgRepos = $"https://api.github.com/orgs/{orgName}/repos"
    .GetJsonFromUrl(httpReq => httpReq.UserAgent = "gist.cafe")
    .FromJson<GithubRepo[]>()
    .OrderByDescending(x => x.Watchers);

$"Top 3 '{orgName}' Github Repos:".Print();
orgRepos.Take(3).ToList().PrintDump();

$"\nTop 10 {orgName} Github Repos:\n".Print();
orgRepos.Take(10).Map(x => new { x.Name, x.Language, x.Watchers, x.Forks }).PrintDumpTable();

Inspect.vars(new { orgRepos });

public class GithubRepo
{
    public string Name { get; set; }
    public string Description { get; set; }
    public string Url { get; set; }
    public string Homepage { get; set; }
    public string Language { get; set; }
    public int Watchers { get; set; }
    public int Forks { get; set; }
}
