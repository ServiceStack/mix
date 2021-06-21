using ServiceStack;
using ServiceStack.Data;
using ServiceStack.Validation;

namespace MyApp
{
    public class ConfigureValidation : IConfigureAppHost
    {
        public void Configure(IAppHost appHost)
        {
            appHost.Plugins.Add(new ValidationFeature());
        }
    }
}