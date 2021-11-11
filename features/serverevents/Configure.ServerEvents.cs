using ServiceStack;

[assembly: HostingStartup(typeof(MyApp.ConfigureServerEvents))]

namespace MyApp
{
    public class ConfigureServerEvents : IHostingStartup
    {
        public void Configure(IWebHostBuilder builder) => builder
            .ConfigureAppHost(appHost => {
                appHost.Plugins.Add(new ServerEventsFeature());
            });
    }
}