## UPDATE Examples

In its most simple form, updating a model on its own without any filter conditions will 
**update every field**, except the `Id` which is used to limit the update to itself. 
Otherwise you can specify a custom filter condition using a typed expression:

 - [Basic Update Examples](#doc=update-examples.md&gist=974a093d0b5f68ba9c3801c72bf37778)

### UpdateOnly

As updating a partial set of fields is a common use-case, OrmLite provides several `UpdateOnly()` APIs for this purpose:

 - [Update Only specific fields Examples](#doc=update-examples.md&gist=36b8e0fcde41d8949b7ff67fef54f7ea)

### UpdateAdd

When you need to update existing values you can use `UpdateAdd()` Typed APIs:

 - [Update Existing Values Examples](#doc=update-examples.md&gist=6530acd18823bb037fe668f6dce67d0e)

---

### [< INSERT Examples](#doc=insert-examples.md) · [Home](#doc=index.md) · [DELETE Examples >](#doc=delete-examples.md)
