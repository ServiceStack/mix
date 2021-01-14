## SELECT Examples

OrmLite has extensive support for Querying exposing an intuitive 1:1 Typed API that maps cleanly and has a high affinity 
with SQL that's not only natural to write but also easy to predict what SQL it generates. 

For simple queries you can use terse lambda Expressions to specify the filter conditions you want:

 - [SELECT lambda Expression examples](#doc=select-examples.md&gist=43a09ba142f24ab2ec878284c8b942ca)

For more advanced queries you can leverage the `SqlExpression` builder which provides a Typed API that closely follows 
SQL except it's created by calling `db.From<T>` with the table you want to query and optionally ends with a 
Custom `.Select()` if you want to customize the resultset that's returned (similar to LINQ). Some examples of 
SqlExpression in action:

 - [SELECT SqlExpression examples](#doc=select-examples.md&gist=6c5bcce2ea5574f88378d1beb089a2ba)

Just like SQL, SqlExpression supports multiple JOIN's that can leverage 
<a href="https://github.com/ServiceStack/ServiceStack.OrmLite#typed-sqlexpression-support-for-joins" target="_top">OrmLite's Reference Conventions</a>
for Simple, Terse and Intuitive Table JOIN's:

 - [SELECT SqlExpression with JOIN examples](#doc=select-examples.md&gist=c7abdceb53fef604ca4d4bc78ae65912)

In addition to `db.Select()` OrmLite provides a number of other convenience API's to return results for your
preferred use-case:

 - [Single, Scalar, Count, Exists, Where and Lazy examples](#doc=select-examples.md&gist=ff9f813bc40ac15d27b5aee405d848ef)

In addition there are convenience API's to return results in your preferred .NET Collection:

 - [Column, ColumnDistinct, Dictionary and Lookup Examples](#doc=select-examples.md&gist=327fc4c5733cbb875f2c7edf87b1dbec)

If you need more flexibility or RDBMS-specific functionality that's not possible using Typed APIs you can 
drop down to raw SQL using our Custom SQL APIs:

 - [Custom SQL Examples](#doc=select-examples.md&gist=bcf01823bcf03b111b00f6a9a4bf0723)

Whilst OrmLite is predominantly a typed code-first ORM it also offers several options for reading 
unstructured results when the Schema is unknown or unavailable:

 - [Dynamic Result Set Examples](#doc=select-examples.md&gist=cd29bd6b9914c0f8a8541881ea4cbb2e)

---

### [< Home](#doc=index.md) · [INSERT Examples >](#doc=insert-examples.md&gist=f9d55e68175169a5568ecef22d14921d)
