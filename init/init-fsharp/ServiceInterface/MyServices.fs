namespace MyApp.ServiceInterface

open System
open ServiceStack
open MyApp.ServiceModel

type HelloService() =
    inherit Service()

    member this.Any (req:Hello) = 
        HelloResponse(Result = "Hello, " + req.Name)
