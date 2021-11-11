using ServiceStack;
using ServiceStack.Redis;

[assembly: HostingStartup(typeof(MyApp.ConfigureRedis))]

namespace MyApp
{
    public class ConfigureRedis : IHostingStartup
    {
        public void Configure(IWebHostBuilder builder) => builder
            .ConfigureServices((context, services) => {
                services.AddSingleton<IRedisClientsManager>(new RedisManagerPool();
            })
            .ConfigureAppHost(afterConfigure:appHost => {
                appHost.ScriptContext.ScriptMethods.Add(new RedisScripts());
            });
    }
}