using ServiceStack;

[assembly: HostingStartup(typeof(MyApp.ConfigureServerEvents))]

namespace MyApp;

public class ConfigureServerEvents : IHostingStartup
{
    public void Configure(IWebHostBuilder builder) => builder
        .ConfigureServices(services => {
            services.AddPlugin(new ServerEventsFeature());
        });
}
