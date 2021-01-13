using System;
using System.Linq;
using System.Collections.Generic;
using ServiceStack;
using ServiceStack.Text;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.Sqlite;

var dbFactory = new OrmLiteConnectionFactory(":memory:", SqliteDialect.Provider);
var db = dbFactory.Open();

db.CreateTable<Artist>();

//INSERT one row
db.Insert(new Artist { Id = 1, Name = "Faith No More" });

db.Insert( //INSERT multiple rows (params)
    new Artist { Id = 2, Name = "Live" },
    new Artist { Id = 3, Name = "Nirvana" });

//INSERT multiple rows (IEnumerable<T>)
db.InsertAll(new[] { 
    new Artist { Id = 4, Name = "Pearl Jam" },
    new Artist { Id = 5, Name = "Tool" } });

var artists = db.Select<Artist>();
$"All Artists: {artists.Dump()}".Print();

Inspect.vars(new { artists });

public class Artist
{
    public int Id { get; set; }
    public string Name { get; set; }
    public override string ToString() => Name;
}
