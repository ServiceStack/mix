using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Options;
using Marten;

[assembly: HostingStartup(typeof(MyApp.ConfigureDb))]

namespace MyApp
{
    public class ConfigureDb : IHostingStartup
    {
        public void Configure(IWebHostBuilder builder) => builder
            .ConfigureServices((context, services) => {
                var store = DocumentStore.For(opts => {
                    opts.Connection(context.Configuration.GetConnectionString("Marten")
                        ?? "host=localhost;username=test;password=test;database=marten");
                    Options.ForEach(fn => fn(opts));
                });
                store.Advanced.Clean.CompletelyRemoveAll();
                services.AddSingleton<IDocumentStore>(store);
            });
    }    
}
