using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using MongoDB.Driver;

[assembly: HostingStartup(typeof(MyApp.ConfigureMongoDb))]

namespace MyApp
{
    public class ConfigureMongoDb : IHostingStartup
    {
        public void Configure(IWebHostBuilder builder) => builder
            .ConfigureServices((context, services) => {
                var mongoClient = new MongoClient();
                IMongoDatabase mongoDatabase = mongoClient.GetDatabase("MyApp");
                services.AddSingleton(mongoDatabase);
            });
    }    
}