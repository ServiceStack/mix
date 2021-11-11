using ServiceStack;

[assembly: HostingStartup(typeof(MyApp.ConfigureGrpc))]

namespace MyApp
{
    public class ConfigureGrpc : IHostingStartup
    {
        public void Configure(IWebHostBuilder builder) => builder
            .ConfigureServices(services => services.AddServiceStackGrpc())
            .Configure(app => app.UseRouting())
            .ConfigureAppHost(appHost => {
                appHost.Plugins.Add(new GrpcFeature(appHost.GetApp()));
            });
    }
}