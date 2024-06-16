using ServiceStack;
using ServiceStack.Auth;
using ServiceStack.Data;
using ServiceStack.OrmLite;

[assembly: HostingStartup(typeof(MyApp.ConfigureApiKeys))]

namespace MyApp;

public class ConfigureApiKeys : IHostingStartup
{
    public void Configure(IWebHostBuilder builder) => builder
        .ConfigureServices(services =>
        {
            services.AddPlugin(new AuthFeature(new AuthSecretAuthProvider("p@55wOrd")));
            services.AddPlugin(new ApiKeysFeature
            {
                // Optional: Available Scopes Admin Users can assign to any API Key
                // Features = [
                //     "Paid",
                //     "Tracking",
                // ],
                // Optional: Available Features Admin Users can assign to any API Key
                // Scopes = [
                //     "todo:read",
                //     "todo:write",
                // ],
            });
        })
        .ConfigureAppHost(appHost =>
        {
            using var db = appHost.Resolve<IDbConnectionFactory>().Open();
            var feature = appHost.GetPlugin<ApiKeysFeature>();
            feature.InitSchema(db);
        });
}