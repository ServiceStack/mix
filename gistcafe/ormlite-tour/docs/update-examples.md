## UPDATE Examples

In its most simple form, updating a model on its own without any filter conditions will 
**update every field**, except the `Id` which is used to limit the update to itself. 
Otherwise you can specify a custom filter condition using a typed expression:

 - [Basic Update Examples](#gist=81ac4745d2cb085f4779b1eee3e86c1a)

### UpdateOnly

As updating a partial set of fields is a common use-case, OrmLite provides several `UpdateOnly()` APIs for this purpose:

 - [Update Only specific fields Examples](#gist=066742f7504cf5f053d1633e4f33c871)

### UpdateAdd

When you need to update existing values you can use `UpdateAdd()` Typed APIs:

 - [Update Existing Values Examples](#gist=ba3da7dad0185105eecf0e321637f7a2)

---

### [< INSERT Examples](#doc=insert-examples.md) · [Home](#doc=index.md) · [DELETE Examples >](#doc=delete-examples.md)
