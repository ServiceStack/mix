using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using ServiceStack;
using ServiceStack.Messaging;
using ServiceStack.Aws;
using ServiceStack.Aws.Sqs;

namespace MyApp
{
    /**
      Register Services you want available via MQ in your AppHost, e.g:
        var mqServer = container.Resolve<IMessageService>();
        mqServer.RegisterHandler<MyRequest>(ExecuteMessage);
    */
    public class ConfigureMq : IConfigureServices, IAfterInitAppHost
    {
        IConfiguration Configuration { get; }
        public ConfigureMq(IConfiguration configuration) => Configuration = configuration;

        public void Configure(IServiceCollection services)
        {
            services.AddSingleton<IMessageService>(c => new SqsMqServer(
                    Configuration["AwsAccessKey"],
                    Configuration["AwsSecretKey"],
                    RegionEndpoint.USEast1) 
                {
                    DisableBuffering = true, // Trade-off latency vs efficiency
                });
        }

        public void AfterInit(IAppHost appHost)
        {
            appHost.Resolve<IMessageService>().Start();
        }
    }    
}
