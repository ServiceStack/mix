using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using ServiceStack;
using ServiceStack.Messaging;
using ServiceStack.Aws;
using ServiceStack.Aws.Sqs;

[assembly: HostingStartup(typeof(MyApp.ConfigureMq))]

namespace MyApp
{
    /**
      Register Services you want available via MQ in your AppHost, e.g:
        var mqServer = appHost.Resolve<IMessageService>();
        mqServer.RegisterHandler<MyRequest>(ExecuteMessage);
    */
    public class ConfigureMq : IHostingStartup
    {
        public void Configure(IWebHostBuilder builder) => builder
            .ConfigureServices((context, services) => {
                services.AddSingleton<IMessageService>(c => new SqsMqServer(
                    context.Configuration["AwsAccessKey"],
                    context.Configuration["AwsSecretKey"],
                    RegionEndpoint.USEast1) 
                {
                    DisableBuffering = true, // Trade-off latency vs efficiency
                });
            })
            .ConfigureAppHost(afterAppHostInit: appHost => {
                appHost.Resolve<IMessageService>().Start();
            });
    }
}
