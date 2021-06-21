using ServiceStack;

namespace MyApp
{
    public class ConfigureServerEvents : IConfigureAppHost
    {
        public void Configure(IAppHost appHost)
        {
            appHost.Plugins.Add(new ServerEventsFeature());
        }
    }
}