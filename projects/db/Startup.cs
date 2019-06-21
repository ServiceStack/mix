using System;
using System.Net;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Funq;
using ServiceStack;
using ServiceStack.Messaging;
using ServiceStack.Web;
using MyApp.ServiceInterface;
using MyApp.ServiceModel;

namespace MyApp
{
    public class Startup : ModularStartup
    {
        public Startup(IConfiguration configuration) : base(configuration) {}

        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        public new void ConfigureServices(IServiceCollection services)
        {
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseServiceStack(new AppHost
            {
                AppSettings = new NetCoreAppSettings(Configuration)
            });
        }
    }

    public class AppHost : AppHostBase
    {
        public AppHost() : base("MyApp", typeof(MyServices).Assembly) { }

        public override void Configure(IServiceCollection services)
        {
            // Register dependencies you want available to ASP.NET Core + ServiceStack
        }

        // Configure your AppHost with the necessary configuration and dependencies your App needs
        public override void Configure(Container container)
        {
            Plugins.Add(new SharpPagesFeature()); // enable server-side rendering, see: https://sharpscript.net/docs/sharp-pages

            SetConfig(new HostConfig
            {
                UseSameSiteCookies = true,
                AddRedirectParamsToQueryString = true,
                DebugMode = AppSettings.Get(nameof(HostConfig.DebugMode), HostingEnvironment.IsDevelopment()),
            });

            this.CustomErrorHttpHandlers[HttpStatusCode.NotFound] = new SharpPageHandler("/notfound");
            this.CustomErrorHttpHandlers[HttpStatusCode.Forbidden] = new SharpPageHandler("/forbidden");

            Svg.Load(RootDirectory.GetDirectory("/assets/svg"));
            Svg.CssFillColor["svg-icons"] = "#2f495e";
        }

        public override void OnStartupException(Exception ex)
        {
            Console.WriteLine(ex.StackTrace);
            Console.WriteLine(ex?.InnerException.StackTrace);
            base.OnStartupException(ex);
        }
    }
}
