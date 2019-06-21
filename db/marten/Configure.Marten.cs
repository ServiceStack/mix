using System.Collections.Generic;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using ServiceStack;
using Marten;

namespace MyApp
{
    public class ConfigureMarten : IConfigureServices
    {
        public static List<StoreOptions> Options { get; } = new List<StoreOptions>();

        IConfiguration Configuration { get; }
        public ConfigureDb(IConfiguration configuration) => Configuration = configuration;

        public void Configure(IServiceCollection services)
        {
            var store = DocumentStore.For(opts =>
            {
                opts.Connection(Configuration.GetConnectionString("Marten") 
                    ?? "host=localhost;username=test;password=test;database=marten");

                Options.ForEach(fn => fn(opts));
            });
            store.Advanced.Clean.CompletelyRemoveAll();
            services.AddSingleton<IDocumentStore>(store);
        }
    }    
}
