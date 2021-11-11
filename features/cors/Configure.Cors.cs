using ServiceStack;

[assembly: HostingStartup(typeof(MyApp.ConfigureCors))]

namespace MyApp
{
    public class ConfigureCors : IHostingStartup
    {
        public void Configure(IWebHostBuilder builder) => builder
            .ConfigureAppHost(appHost => {
                appHost.Plugins.Add(new CorsFeature());
            });
    }
}