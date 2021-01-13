## INSERT Examples

In most cases INSERT's in OrmLite is as straight forward as passing the POCO you want inserted:

 - [Inserting data with OrmLite](#gist=90c2dac71a22ece5b62660659b09cf98)

OrmLite provides a couple of different ways to handle Inserting records with AutoIncrementing Ids:

 - [Insert records with AutoIncrement Ids](#gist=cd34f47a6314ebff1a3673c7e16cd60f)

OrmLite's `Save()` API offers high-level functionality over `Insert()` including auto populating 
AutoIncrementing Ids, transparently handling Insert or Updates and saving reference data:

 - [OrmLite Save API](#gist=3ca519d6b039e142c84978e0cbb49b32)
 
Use `InsertOnly()` for the rare cases when you don't want to insert an entire record. One instance
when you would want to do this is to use the default value defined on the underlying CREATE TABLE 
RDBMS Schema:

 - [Insert partial records](#gist=c0814f297f98fad330758e8fc755a345)

---

### [< SELECT Examples](#doc=select-examples.md) · [Home](#doc=index.md) · [UPDATE Examples >](#doc=update-examples.md)
