/* Options:
Date: 2023-01-13 13:45:10
Version: 6.41
Tip: To override a DTO option, remove "//" prefix before updating
BaseUrl: https://localhost:5001

//GlobalNamespace:
//AddServiceStackTypes: True
//AddResponseStatus: False
//AddImplicitVersion:
//AddDescriptionAsComments: True
//IncludeTypes:
//ExcludeTypes:
//DefaultImports: package:servicestack/servicestack.dart
*/

import 'package:servicestack/servicestack.dart';

class HelloResponse implements IConvertible
{
    String? result;

    HelloResponse({this.result});
    HelloResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        result = json['result'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'result': result
    };

    getTypeName() => "HelloResponse";
    TypeContext? context = _ctx;
}

// @Route("/hello")
// @Route("/hello/{Name}")
class Hello implements IReturn<HelloResponse>, IConvertible
{
    String? name;

    Hello({this.name});
    Hello.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        name = json['name'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'name': name
    };

    createResponse() => HelloResponse();
    getResponseTypeName() => "HelloResponse";
    getTypeName() => "Hello";
    TypeContext? context = _ctx;
}

TypeContext _ctx = TypeContext(library: 'localhost', types: <String, TypeInfo> {
    'HelloResponse': TypeInfo(TypeOf.Class, create:() => HelloResponse()),
    'Hello': TypeInfo(TypeOf.Class, create:() => Hello()),
});

