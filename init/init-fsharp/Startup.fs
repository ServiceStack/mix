namespace fsharp

open System
open Microsoft.AspNetCore.Builder
open Microsoft.AspNetCore.Hosting
open Microsoft.AspNetCore.Http
open Microsoft.Extensions.DependencyInjection
open Microsoft.Extensions.Hosting
open Microsoft.Extensions.Configuration
open Funq
open ServiceStack
open ServiceStack.Configuration
open ServiceStack.Text
open MyApp.ServiceInterface

type AppHost =
    inherit AppHostBase
    new() = { inherit AppHostBase("Hi F#!", typeof<HelloService>.Assembly) }
    override this.Configure(container:Container) :unit =
        let mutable config = HostConfig()
        config.UseSameSiteCookies <- Nullable true
        config.DebugMode <- base.HostingEnvironment.IsDevelopment()
        base.SetConfig(config) |> ignore

type Startup(Configuration:IConfiguration) =
    inherit ModularStartup()

    // This method gets called by the runtime. Use this method to add services to the container.
    // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
    member this.ConfigureServices(services: IServiceCollection) =
        ()

    // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
    member this.Configure(app: IApplicationBuilder, env: IWebHostEnvironment) =
        if env.IsDevelopment() then
            app.UseDeveloperExceptionPage() |> ignore

        let mutable appHost = AppHost()
        appHost.AppSettings <- NetCoreAppSettings(Configuration) 
        app.UseServiceStack(appHost) |> ignore
