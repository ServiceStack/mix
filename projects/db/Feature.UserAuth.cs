using ServiceStack;
using ServiceStack.Script;

namespace db
{
    public class FeatureUserAuth : IConfigureAppHost, IPostInitPlugin
    {
        public void Configure(IAppHost appHost)
        {
            appHost.AssertPlugin<SharpPagesFeature>().ScriptMethods.Add(new UserAuthScripts());
        }

        public void AfterPluginsLoaded(IAppHost appHost)
        {
            ViewUtils.NavItems.Add(new NavItem {
                Label = "Users",
                Href = "/admin/users",
                // Show = "role:Admin" // Uncomment to restrict menu item to Admin Users
            });
        }
    }

    public class UserAuthScripts : ScriptMethods
    {
    }
}
