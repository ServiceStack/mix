using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using ServiceStack;
using ServiceStack.Messaging;

namespace db
{
    /**
      Register Services you want available via MQ in your AppHost, e.g:
        var mqServer = appHost.Resolve<IMessageService>();
        mqServer.RegisterHandler<MyRequest>(ExecuteMessage);
    */
    public class ConfigureMq : IConfigureServices, IAfterInitAppHost
    {
        public void Configure(IServiceCollection services)
        {
            services.AddSingleton<IMessageService>(c => new BackgroundMqService());
        }

        public void AfterInit(IAppHost appHost)
        {
            appHost.Resolve<IMessageService>().Start();
        }
    }
}
