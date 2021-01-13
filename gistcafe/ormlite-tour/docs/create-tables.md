## CREATE Table Examples

As a code-first ORM, creating tables is effortless in OrmLite that uses your POCO Type definition to generate RDBMS Table schemas that cleanly maps .NET data types 1:1 to the most appropriate RDBMS column definition:

 - [Basic Create Table Examples](#doc=create-tables.md&gist=ab8d48cff82044238acd2b5730e63e08)

OrmLite also supports persisting rich complex types which are blobbed by default or you can use the `[Reference]` support to persist Nested Complex Types in their own Table Definitions:

 - [Create Tables with Complex Types](#doc=create-tables.md&gist=862a83d8a8a428c513b97dc0a1021470)

When needed you can markup your POCO's with .NET Attributes to allow further specialization of your Table schema and unlock RDBMS server features:

 - [Customize Tables using Attributes](#doc=create-tables.md&gist=6ca7c1cf2b6826a05ad6d3245d32fa9b)

A popular use-case where you'd want to use Attributes is to define Foreign Keys:

 - [Create Tables with Foreign Keys](#doc=create-tables.md&gist=1a12d49fe9427abdcafeb05a0163ab33)

---

### [< DELETE Examples](#doc=delete-examples.md) · [Home](#doc=index.md) · [Modify Schema Examples >](#doc=modify-schema.md)
