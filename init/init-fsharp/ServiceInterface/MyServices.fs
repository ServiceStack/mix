namespace MyApp.ServiceInterface

open System
open ServiceStack
open MyApp.ServiceModel

type HelloService() =
    inherit Service()

    member this.Any (req:Hello) = 
        let mutable ret = HelloResponse()
        ret.Result <- "Hello, " + req.Name
        ret