using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using ServiceStack;
using ServiceStack.Aws;

namespace MyApp
{
    public class ConfigureVfsS3 : IConfigureServices, IConfigureAppHost
    {
        IConfiguration Configuration { get; }
        public ConfigureVfsS3(IConfiguration configuration) => Configuration = configuration;

        public void Configure(IServiceCollection services)
        {
            services.AddSingleton<IAmazonS3>(new AmazonS3Client(
                Configuration["AwsAccessKey"],
                Configuration["AwsSecretKey"],
                RegionEndpoint.USEast1));
        }

        public void Configure(IAppHost appHost)
        {
            appHost.AddVirtualFileSources.Add(
                new S3VirtualFiles(appHost.Resolve<IAmazonS3>(), appHost.GetString("S3Bucket")));
        }
    }    
}
