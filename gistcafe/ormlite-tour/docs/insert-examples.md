## INSERT Examples

In most cases INSERT's in OrmLite is as straight forward as passing the POCO you want inserted:

 - [Inserting data with OrmLite](#doc=insert-examples.md&gist=f9d55e68175169a5568ecef22d14921d)

OrmLite provides a couple of different ways to handle Inserting records with AutoIncrementing Ids:

 - [Insert records with AutoIncrement Ids](#doc=insert-examples.md&gist=604730bb2b77e9bd735c54c5772d611b)

OrmLite's `Save()` API offers high-level functionality over `Insert()` including auto populating 
AutoIncrementing Ids, transparently handling Insert or Updates and saving reference data:

 - [OrmLite Save API](#doc=insert-examples.md&gist=775126a1cd3a49e3111a6b2b4be989aa)
 
Use `InsertOnly()` for the rare cases when you don't want to insert an entire record. One instance
when you would want to do this is to use the default value defined on the underlying CREATE TABLE 
RDBMS Schema:

 - [Insert partial records](#doc=insert-examples.md&gist=9bfb5113695986279c1efb80ff80325e)

---

### [< SELECT Examples](#doc=select-examples.md&gist=43a09ba142f24ab2ec878284c8b942ca) · [Home](#doc=index.md) · [UPDATE Examples >](#doc=update-examples.md&gist=974a093d0b5f68ba9c3801c72bf37778)
