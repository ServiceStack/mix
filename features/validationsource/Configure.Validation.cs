using ServiceStack;
using ServiceStack.Data;

[assembly: HostingStartup(typeof(MyApp.ConfigureOpenApi))]

namespace MyApp
{
    public class ConfigureValidation : IHostingStartup
    {
        // Add support for dynamically generated db rules
        public void Configure(IWebHostBuilder builder) => builder
            .ConfigureServices(services => services.AddSingleton<IValidationSource>(c =>
                new OrmLiteValidationSource(c.Resolve<IDbConnectionFactory>())))
            .ConfigureAppHost(appHost => {
                appHost.Resolve<IValidationSource>().InitSchema();
            });
    }
}