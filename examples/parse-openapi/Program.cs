// C# .NET 6 console project created with: $ x mix console-cs
using ServiceStack;
using ServiceStack.Text;

var json = await File.ReadAllTextAsync("swagger.json");
var obj = (Dictionary<string,object>) JSON.parse(json);
var paths = (Dictionary<string,object>) obj["paths"];

List<Op> ToOps(string path, Dictionary<string,object> methods) => methods.Map(entry =>
    new Op(path, entry.Key, (Dictionary<string,object>)entry.Value));

var allOps = paths.SelectMany(entry => ToOps(entry.Key,(Dictionary<string,object>)entry.Value)).ToList();

var queryExample = allOps.Where(x => x.Path.StartsWith("/pet")).ToList();
queryExample.Map(x => new{x.Path, x.Method, x.Summary, Params=x.Parameters.Count }).PrintDumpTable();
queryExample.PrintDump();

// Quick results view in https://gist.cafe
Inspect.vars(new { allOps, storeOps = allOps.Where(x => x.Path.StartsWith("/store")) });

public class Op
{
    public string Path { get; set; }
    public string Method { get; set; }

    public Op(string path, string method, Dictionary<string, object> body)
    {
        Path = path;
        Method = method;
        body.PopulateInstance(this);
    }

    public List<string> Tags { get; set; } = new();
    public string? Summary { get; set; }
    public string? OperationId { get; set; }
    public List<string> Consumes { get; set; } = new();
    public List<string> Produces { get; set; } = new();
    public List<Parameter> Parameters { get; set; } = new();
}

public class Parameter
{
    public string? Name { get; set; }
    public string? In { get; set; }
    public string? Description { get; set; }
    public bool Required { get; set; }
    public string? Type { get; set; }
    public Dictionary<string,string>? Schema { get; set; }
}
