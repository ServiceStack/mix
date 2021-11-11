using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using ServiceStack;
using ServiceStack.DataAnnotations;
using Raven.Client.Documents;

[assembly: HostingStartup(typeof(MyApp.ConfigureRavenDb))]

namespace MyApp
{
    public class ConfigureRavenDb : IHostingStartup
    {
        public void Configure(IWebHostBuilder builder) => builder
            .ConfigureServices((context, services) => {
                var store = new DocumentStore
                {
                    Urls = new[]                        // URL to the Server, or list of URLs to all Cluster Servers (Nodes)
                    {                                   
                        Configuration.GetConnectionString("RavenDB") ?? "http://localhost:8080"         
                    },
                    Database = "MyApp",                 // Default database that DocumentStore will interact with
                    Conventions = { }                   // DocumentStore customizations
                };

                store.Conventions.FindIdentityProperty = p => {
                    var attr = p.DeclaringType.FirstAttribute<IndexAttribute>(); // Allow overriding 'Id' Identity property
                    return attr != null
                        ? p.Name == attr.Name
                        : p.Name == "Id";
                };
            
                services.AddSingleton<IDocumentStore>(store.Initialize());
            });
    }
}
