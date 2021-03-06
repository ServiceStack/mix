using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using ServiceStack;
using ServiceStack.Messaging;
using ServiceStack.RabbitMq;

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
            services.AddSingleton<IMessageService>(c => 
                new RabbitMqServer(Configuration.GetConnectionString("RabbitMq") ?? "localhost:5672"));
        }

        public void AfterInit(IAppHost appHost)
        {
            appHost.Resolve<IMessageService>().Start();
        }
    }
}
