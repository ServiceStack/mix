using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using ServiceStack;
using ServiceStack.VirtualPath;
using ServiceStack.Azure;
using ServiceStack.Azure.Storage;

namespace MyApp
{
    public class ConfigureVfsAzureBlob : IConfigureAppHost
    {
        public void Configure(IAppHost appHost)
        {
            appHost.AddVirtualFileSources.Add(new AzureBlobVirtualFiles(
                appHost.GetConnectionString("AzureBlob"), 
                appHost.GetString("AzureBlobContainer")));
        }
    }    
}
