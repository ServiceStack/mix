using System;
using System.Linq;
using ServiceStack;
using ServiceStack.Text;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.Sqlite;
using ServiceStack.DataAnnotations;

var dbFactory = new OrmLiteConnectionFactory(":memory:", SqliteDialect.Provider);
var db = Seed.CreateArtistAndTrackTablesWithData(dbFactory.Open());

//Increase all Track Years by 1 using lambda expression
db.UpdateAdd(() => new Track { Year = 1 }); 
var incrementedYears = db.Select<Track>().OrderBy(x => x.Year).Take(3).ToList();
$"Increased all Track Years by +1: {incrementedYears.Dump()}".Print();

//Decreasing all Track Years by -1 using specific field
db.UpdateAdd(() => new Track { Year = -1 }); 
var decrementedYears = db.Select<Track>().OrderBy(x => x.Year).Take(3).ToList();
$"\nDecreased all Track Years by -1: {decrementedYears.Dump()}".Print();

//UpdateAdd on non-numeric fields are updated normally:
db.UpdateAdd(() => new Track { Year = -10, Album = "Lost a decade" }, x => x.Year == 1997); 
var updatedIntAndString = db.Select<Track>().OrderBy(x => x.Year).Take(2).ToList();
$"\nUpdated existing Year Value and Name: {updatedIntAndString.Dump()}".Print();

//Add 10 years to all 1991 Tracks
var q = db.From<Track>()
    .Where(x => x.Year == 1991);
db.UpdateAdd(() => new Track { Year = 10 }, q);

var tracks2001 = db.Select<Track>(x => x.Year == 2001);
$"\nTracks updated to 2001: {tracks2001.Dump()}".Print();

Inspect.vars(new { incrementedYears, decrementedYears, updatedIntAndString, tracks2001 });
