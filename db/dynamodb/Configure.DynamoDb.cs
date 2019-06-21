using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using ServiceStack;
using ServiceStack.Aws;
using ServiceStack.Aws.DynamoDb;
using Amazon;
using Amazon.DynamoDBv2;

namespace MyApp
{
    public class ConfigureDynamoDb : IConfigureServices
    {
        IConfiguration Configuration { get; }
        public ConfigureDynamoDb(IConfiguration configuration) => Configuration = configuration;

        public void Configure(IServiceCollection services)
        {
            var awsDb = new AmazonDynamoDBClient("keyId","key", new AmazonDynamoDBConfig { 
                ServiceURL = Configuration.GetConnectionString("DynamoDb") ?? "http://localhost:8000"
            });
            var db = new PocoDynamo(awsDb);

            services.AddSingleton<IAmazonDynamoDB>(awsDb);
            services.AddSingleton<IPocoDynamo>(db);
        }
    }    
}
