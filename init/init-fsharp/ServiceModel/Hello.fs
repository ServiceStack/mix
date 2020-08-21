namespace MyApp.ServiceModel

open System
open System.Collections
open System.Collections.Generic
open System.Runtime.Serialization
open ServiceStack
open ServiceStack.DataAnnotations

    [<AllowNullLiteral>]
    type HelloResponse() = 
        member val Result:String = null with get,set

    [<Route("/hello")>]
    [<Route("/hello/{Name}")>]
    [<AllowNullLiteral>]
    type Hello() = 
        interface IReturn<HelloResponse>
        member val Name:String = null with get,set
