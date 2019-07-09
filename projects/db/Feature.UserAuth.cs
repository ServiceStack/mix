using ServiceStack;
using ServiceStack.Script;

namespace MyApp
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
            });
        }
    }

    public class UserAuthScripts : ScriptMethods
    {
    }
}
