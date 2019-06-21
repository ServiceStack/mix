using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using ServiceStack;
using ServiceStack.IO;
using ServiceStack.VirtualPath;

namespace MyApp
{
    public class ConfigureVfsGist : IConfigureAppHost
    {
        public void Configure(IAppHost appHost)
        {
            appHost.AddVirtualFileSources.Add(
                new GistVirtualFiles(appHost.GetString("VfsGistId"), appHost.GetString("GitHubAccessToken")));
        }
    }    
}
