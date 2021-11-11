using NUnit.Framework;
using Funq;
using ServiceStack;

public class Hello : IReturn<StringResponse>
{
    public string Name { get; set; }
}

class MyServices : Service
{
    public object Any(Hello request) => 
        new StringResponse { Result = $"Hello, {request.Name}!" };
}

public class AppHost : AppSelfHostBase
{
    public AppHost() : base("MyApp Tests", typeof(MyServices).Assembly) {}

    public override void Configure(Container container)
    {
    }
}

[TestFixture]
public class MyAppTests
{
    const string BaseUrl = "http://localhost:2000/";
    ServiceStackHost appHost;

    [OneTimeSetUp]
    public void OneTimeSetUp() => appHost = new AppHost()
        .Init()
        .Start(BaseUrl);

    [OneTimeTearDown]
    public void OneTimeTearDown() => appHost.Dispose();

    [Test]
    public void Can_call_Hello()
    {
        var client = new JsonServiceClient(BaseUrl);
        var response = client.Get(new Hello { Name = "Test" });
        Assert.That(response.Result, Is.EqualTo($"Hello, Test!"));
    }
}
