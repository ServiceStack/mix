using System;
using System.Linq;
using System.Collections.Generic;
using ServiceStack;
using ServiceStack.Text;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.Sqlite;
using ServiceStack.DataAnnotations;

var dbFactory = new OrmLiteConnectionFactory(":memory:", SqliteDialect.Provider);
var db = dbFactory.Open();

db.CreateTable<Track>();

//Using lambda expression
db.InsertOnly(() => new Track { Name = "State of Love and Trust", Album = "Singles" });

//Using explicit fields
db.InsertOnly(new Track { Name = "I Got ID", Album = "Merkin Ball" }, x => new { x.Name, x.Album });

var tracks = db.Select<Track>();
$"Partially Inserted Tracks: {tracks.Dump()}".Print();

Inspect.vars(new { tracks });

public class Track
{
    [AutoIncrement]
    public int Id { get; set; }
    public string Name { get; set; }
    public string Album { get; set; }
    [Default(5)]
    public int Rating { get; set; }
    public override string ToString() => Name;
}

