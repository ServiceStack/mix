using MyApp.Data;
using ServiceStack;
using ServiceStack.Auth;
using ServiceStack.Data;
using ServiceStack.OrmLite;
using ServiceStack.Configuration;

[assembly: HostingStartup(typeof(MyApp.ConfigureApiKeys))]

namespace MyApp;

public class ConfigureApiKeys : IHostingStartup
{
    public void Configure(IWebHostBuilder builder) => builder
        .ConfigureServices(services =>
        {
            services.AddPlugin(new AuthFeature(new AuthSecretAuthProvider()));
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
                
                // Optional: Limit available Scopes Users can assign to their own API Keys
                // UserScopes = [
                //     "todo:read",
                // ],
                // Optional: Limit available Features Users can assign to their own API Keys
                // UserFeatures = [
                //     "Tracking",
                // ],
            });
        })
        .ConfigureAppHost(appHost =>
        {
            appHost.Config.AdminAuthSecret = "p@55wOrd";
            
            using var db = appHost.Resolve<IDbConnectionFactory>().Open();
            var feature = appHost.GetPlugin<ApiKeysFeature>();
            feature.InitSchema(db);
        });
}