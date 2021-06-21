using ServiceStack;
using ServiceStack.Api.OpenApi;

namespace MyApp
{
    public class ConfigureOpenApi : IConfigureAppHost
    {
        public void Configure(IAppHost appHost)
        {
            appHost.Plugins.Add(new OpenApiFeature());
        }
    }
}