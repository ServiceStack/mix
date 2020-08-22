Imports ServiceStack

Namespace Global.MyApp.ServiceModel

    <Route("/hello")>
    <Route("/hello/{Name}")>
    Public Partial Class Hello
        Implements IReturn(Of HelloResponse)
        Public Overridable Property Name As String
    End Class

    Public Partial Class HelloResponse
        Public Overridable Property Result As String
    End Class

End Namespace