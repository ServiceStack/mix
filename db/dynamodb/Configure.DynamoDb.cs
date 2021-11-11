using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using ServiceStack;
using ServiceStack.Aws;
using ServiceStack.Aws.DynamoDb;
using Amazon;
using Amazon.DynamoDBv2;

[assembly: HostingStartup(typeof(MyApp.ConfigureDynamoDb))]

namespace MyApp
{
    public class ConfigureDynamoDb : IHostingStartup
    {
        public void Configure(IWebHostBuilder builder) => builder
            .ConfigureServices((context, services) => {
                var awsDb = new AmazonDynamoDBClient("keyId","key", new AmazonDynamoDBConfig { 
                    ServiceURL = context.Configuration.GetConnectionString("DynamoDb") ?? "http://localhost:8000"
                });
                var db = new PocoDynamo(awsDb);

                services.AddSingleton<IAmazonDynamoDB>(awsDb);
                services.AddSingleton<IPocoDynamo>(db);
            });
    }    
}