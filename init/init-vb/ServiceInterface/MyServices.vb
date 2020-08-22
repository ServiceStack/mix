Imports System
Imports ServiceStack
Imports MyApp.ServiceModel

Namespace Global.MyApp.ServiceInterface

    Public Class MyServices 
        Inherits Service

        public Function Any(request AS Hello) AS Object
            Return new HelloResponse With { .Result = $"Hello, {request.Name}!" }
        End Function

    End Class

End Namespace