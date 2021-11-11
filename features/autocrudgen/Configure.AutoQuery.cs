using ServiceStack;

[assembly: HostingStartup(typeof(MyApp.ConfigureAutoQuery))]

namespace MyApp
{
    public class ConfigureAutoQuery : IHostingStartup
    {
        public void Configure(IWebHostBuilder builder) => builder
            .ConfigureAppHost(appHost => {
                appHost.Plugins.Add(new AutoQueryFeature {
                    MaxLimit = 1000,
                    IncludeTotal = true,
                    GenerateCrudServices = new GenerateCrudServices {
                        AutoRegister = true,
                        //AddDataContractAttributes = false,
                    }
                });
            });
    }
}