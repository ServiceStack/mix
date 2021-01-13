using System;
using ServiceStack;
using ServiceStack.Text;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.Sqlite;
using ServiceStack.DataAnnotations;

var dbFactory = new OrmLiteConnectionFactory(":memory:", SqliteDialect.Provider);
var db = dbFactory.Open();

db.CreateTable<Track>();

var autoId = db.Insert(new Track { Name = "Everythings Ruined", Album = "Angel Dust", Year = 1992 });
$"AutoIncrement Id: {autoId}".Print();

var track = db.SingleById<Track>(autoId);
$"\nTrack: {track.Dump()}".Print();

var savedTrack = new Track { Name = "Ashes to Ashes", Album = "Album of the Year", Year = 1997 };
db.Save(savedTrack);
$"\nSaved AutoIncrement Id: {savedTrack.Id}".Print();
$"\nSaved Track: {savedTrack.Dump()}".Print();

Inspect.vars(new { track, savedTrack });

public class Track
{
    [AutoIncrement]
    public int Id { get; set; }
    public string Name { get; set; }
    public string Album { get; set; }
    public int Year { get; set; }
    public override string ToString() => Name;
}
