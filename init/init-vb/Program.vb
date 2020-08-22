Imports System
Imports System.Collections.Generic
Imports System.IO
Imports System.Linq
Imports System.Threading.Tasks
Imports Microsoft.AspNetCore
Imports Microsoft.AspNetCore.Hosting
Imports Microsoft.Extensions.Configuration
Imports Microsoft.Extensions.Logging
Imports ServiceStack

Module Program

    Sub Main(args As String())
        BuildWebHost(args).Run()
    End Sub

    Function BuildWebHost(args As String()) As IWebHost
        Return WebHost.CreateDefaultBuilder(args).UseModularStartup(Of Startup)().Build()
    End Function

End Module
