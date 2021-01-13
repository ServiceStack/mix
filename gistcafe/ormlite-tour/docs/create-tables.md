## CREATE Table Examples

As a code-first ORM, creating tables is effortless in OrmLite that uses your POCO Type definition to generate RDBMS Table schemas that cleanly maps .NET data types 1:1 to the most appropriate RDBMS column definition:

 - [Basic Create Table Examples](#gist=44638e3bd0f5b6057b6f1109a33439ef)

OrmLite also supports persisting rich complex types which are blobbed by default or you can use the `[Reference]` support to persist Nested Complex Types in their own Table Definitions:

 - [Create Tables with Complex Types](#gist=6aca5ffeca1046e3d8d5b0429b548ee8)

When needed you can markup your POCO's with .NET Attributes to allow further specialization of your Table schema and unlock RDBMS server features:

 - [Customize Tables using Attributes](#gist=ff0dc61589ed49267d864ebfbec3b9df)

A popular use-case where you'd want to use Attributes is to define Foreign Keys:

 - [Create Tables with Foreign Keys](#gist=1a2966dc699940e0688cf4863f0b629b)

---

### [< DELETE Examples](#doc=delete-examples.md) · [Home](#doc=index.md) · [Modify Schema Examples >](#doc=modify-schema.md)
