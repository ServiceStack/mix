using ServiceStack;

[assembly: HostingStartup(typeof(MyApp.ConfigureGrpc))]

namespace MyApp;

public class ConfigureGrpc : IHostingStartup
{
    public void Configure(IWebHostBuilder builder) => builder
        .ConfigureServices(services => {
            services.AddServiceStackGrpc();
            services.AddTransient<IStartupFilter,StartupFilter>();
        })
        .ConfigureAppHost(appHost => {
            appHost.Plugins.Add(new GrpcFeature(appHost.GetApp()));
        });
    
    public class StartupFilter : IStartupFilter
    {
        public Action<IApplicationBuilder> Configure(Action<IApplicationBuilder> next) => app =>
        {
            app.UseRouting();
            next(app);
        };
    }
}
