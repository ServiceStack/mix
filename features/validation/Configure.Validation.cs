using ServiceStack;
using ServiceStack.Validation;

[assembly: HostingStartup(typeof(MyApp.ConfigureValidation))]

namespace MyApp;

public class ConfigureValidation : IHostingStartup
{
    public void Configure(IWebHostBuilder builder) => builder
        .ConfigureServices(services => {
            // ValidationFeature is pre-registered by default from v5.13 
            // services.AddPlugin(new ValidationFeature());
        });
}
