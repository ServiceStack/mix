# <a target="_top" href="https://github.com/ServiceStack/ServiceStack.OrmLite">OrmLite</a>

is a fast, simple, typed code-first ORM for .NET supporting 
<a target="_top" href="https://github.com/ServiceStack/ServiceStack.OrmLite#download">most popular RDBMS's</a>. 
For this interactive tour we'll use OrmLite's cross-platform In Memory SQLite database
in the
<a href="https://www.nuget.org/packages/ServiceStack.OrmLite.Sqlite" target="_top">ServiceStack.OrmLite.Sqlite</a>
NuGet package.

A copy of test `data.cs` most examples use is available in:

 - [OrmLite Reference Test Data](#gist=87164fa870ac7503b43333d1d275456c&show=data.cs)

For a quick 1-page dive into OrmLite, checkout:

 - [OrmLite CRUD demo](#gist=366428a36503971c38496cbe30d6cfea) ([async](#gist=f49d30be9ed7a549636adda4b4e96939))
 - [OrmLite Rich CREATE Table Example](#gist=ed9518f550a5dc3fc3a079df4f584eaa)

### Try out features

See each section for more in-depth examples of OrmLite's features:

 - [SELECT Examples](#doc=select-examples.md&gist=43a09ba142f24ab2ec878284c8b942ca) - Typed, Advanced, Custom and dynamic Queries with OrmLite
 - [INSERT Examples](#doc=insert-examples.md&gist=f9d55e68175169a5568ecef22d14921d) - Inserting records
 - [UPDATE Examples](#doc=update-examples.md&gist=974a093d0b5f68ba9c3801c72bf37778) - Updating records
 - [DELETE Examples](#doc=delete-examples.md&gist=2094c4cfd41c709241c8647b39be0b10) - Deleting records
 - [CREATE Table Examples](#doc=create-tables.md&gist=ab8d48cff82044238acd2b5730e63e08) - Creating Table Schemas for POCO Type definitions
 - [Modify Schema Examples](#doc=modify-schema.md&gist=4467fba9a611cc060c193568c3c07dff) - Modifying existing tables
 
<h3><a target="_top" href="https://github.com/ServiceStack/ServiceStack.OrmLite">OrmLite's Documentation</a></h3>

  - Async APIs
  - Type Converters
  - Transaction Support
  - Optimistic Concurrency
  - Multitenancy
  - Always applied Ensure APIs
  - Pluggable Complex Type Serializers
  - Nested Typed Sub SqlExpressions
  - Parametrized IN Values
  - Typed in-place updates
  - Partial Inserts
  - Delete from JOIN Table, Soft Deletes
  - INSERT into SELECT
  - Global Insert / Update Filters
  - Exec, Result and String Filters
  - Merge Disconnected POCO Result Sets
  - Unique & Check Constraints
  - Auto populated Guid Ids
  - PostgreSQL Array, HStore, JSON & Rich Type APIs
  - SQL Server 2012 Sequences, Table Hints, Memory tables
  - Conflict Resolution
  - Custom SQL Fields, Fragments, Expressions
  - Custom Insert and Update Expressions
  - Pre / Post Custom SQL DDL Hooks
  - Stored Procedure APIs
  - Table aliases
  - Mocking

---

### [SELECT Examples >](#doc=select-examples.md)
