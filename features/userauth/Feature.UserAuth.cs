using ServiceStack;
using ServiceStack.Script;

[assembly: HostingStartup(typeof(MyApp.FeatureUserAuth))]

namespace MyApp
{
    public class FeatureUserAuth : IHostingStartup
    {
        public void Configure(IWebHostBuilder builder) => builder
            .ConfigureAppHost(appHost => {
                appHost.AssertPlugin<SharpPagesFeature>().ScriptMethods.Add(new UserAuthScripts());
            }, afterPluginsLoaded: appHost => {
                View.NavItems.Add(new NavItem {
                    Label = "Users",
                    Href = "/admin/users",
                    // Show = "role:Admin" // Uncomment to only show menu item to Admin Users
                });
            });
    }

    public class UserAuthScripts : ScriptMethods
    {
    }
}
