Imports System.Collections.Generic
Imports System.Linq
Imports Microsoft.AspNetCore.Builder
Imports Microsoft.AspNetCore.Hosting
Imports Microsoft.Extensions.Hosting
Imports Microsoft.Extensions.DependencyInjection
Imports Microsoft.Extensions.Configuration
Imports Funq
Imports ServiceStack
Imports ServiceStack.Configuration
Imports MyApp.ServiceInterface
Imports ServiceStack.Script
Imports ServiceStack.Web
Imports System
Imports ServiceStack.Text
Imports ServiceStack.Logging

Namespace Global.MyApp

    Class Startup 
        Inherits ModularStartup

        ' This method gets called by the runtime. Use this method to add services to the container.
        ' For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        Overloads Sub ConfigureServices(Services as IServiceCollection)
        End Sub

        Overloads Sub Configure(app AS IApplicationBuilder, env AS IWebHostEnvironment)
            If env.IsDevelopment() 
                app.UseDeveloperExceptionPage()
            End If

            app.UseServiceStack(new AppHost With {
                .AppSettings = new NetCoreAppSettings(Configuration)
            })

        End Sub        
    End Class

    Class AppHost 
        Inherits AppHostBase

        Public Sub New()
            MyBase.New("My App", GetType(MyServices).Assembly)
        End Sub

        ' Configure your AppHost with the necessary configuration and dependencies your App needs
        Public Overrides Sub Configure(container AS Container)
            SetConfig(new HostConfig With {
                .UseSameSiteCookies = true,
                .DebugMode = HostingEnvironment.IsDevelopment()
            })
        End Sub
        
    End Class

End Namespace
