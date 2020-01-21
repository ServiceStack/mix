using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using ServiceStack;
using ServiceStack.DataAnnotations;
using MongoDB.Driver;

namespace MyApp
{
    public class ConfigureMongoDb : IConfigureServices
    {
        IConfiguration Configuration { get; }
        public ConfigureMongoDb(IConfiguration configuration) => Configuration = configuration;

        public void Configure(IServiceCollection services)
        {
            var mongoClient = new MongoClient();
            IMongoDatabase mongoDatabase = mongoClient.GetDatabase("MyApp");
            services.AddSingleton(mongoDatabase);
        }
    }    
}
