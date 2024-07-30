using ServiceStack;

[assembly: HostingStartup(typeof(MyApp.ConfigureAutoQuery))]

namespace MyApp;

public class ConfigureAutoQuery : IHostingStartup
{
     public void Configure(IWebHostBuilder builder) => builder
        .ConfigureServices(services => {
            services.AddPlugin(new AutoQueryFeature {
               MaxLimit = 1000,
                IncludeTotal = true,
                GenerateCrudServices = new GenerateCrudServices {
                    // Move Plugin registration to Configure.Db.cs if using Endpoint Routing, see:
                    // https://docs.servicestack.net/autoquery/autogen#register-db-connection
                    // DbFactory = dbFactory,

                    AutoRegister = true,
                    //AddDataContractAttributes = false,
                }
            });
        });
}