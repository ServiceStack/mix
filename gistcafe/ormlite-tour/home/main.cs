using System;
using System.Linq;
using System.Collections.Generic;
using ServiceStack;
using ServiceStack.Text;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.Sqlite;

var dbFactory = new OrmLiteConnectionFactory(":memory:", SqliteDialect.Provider);
var db = dbFactory.OpenDbConnection();

//DROP and CREATE Artist and Track Tables from their POCO definition
db.DropAndCreateTable<Artist>();
db.DropAndCreateTable<Track>();

//INSERT each Artist, including their Track references
Seed.Artists.Each(x => db.Save(x, references:true));

//SELECT all artists including their Track references
var allArtists = db.LoadSelect<Artist>();
allArtists.PrintDump();

Inspect.vars(new { allArtists });