using ServiceStack;
using ServiceStack.Script;
using ServiceStack.Messaging;
using db.ServiceModel;

namespace db
{
    public class FeatureMq : IConfigureAppHost, IPostInitPlugin
    {
        public void Configure(IAppHost appHost)
        {
            var mqServer = appHost.Resolve<IMessageService>();
            mqServer.RegisterHandler<TestMq>(appHost.ExecuteMessage);
            appHost.AssertPlugin<SharpPagesFeature>().ScriptMethods.Add(new MqScripts(mqServer));
        }

        public void AfterPluginsLoaded(IAppHost appHost)
        {
            ViewUtils.NavItems.Add(new NavItem {
                Label = "Messaging",
                Href = "/messaging",
            });
        }
    }

    public class MqScripts : ScriptMethods
    {
        IMessageService mq;
        public MqScripts(IMessageService mqService) => this.mq = mqService;

        public IMessageService mqService() => mq;
        public string mqStatsDescription(IMessageService mqService) => mqService.GetStatsDescription();
    }
}
