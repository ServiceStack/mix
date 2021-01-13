using System;
using ServiceStack;
using ServiceStack.Text;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.Sqlite;
using ServiceStack.DataAnnotations;

var dbFactory = new OrmLiteConnectionFactory(":memory:", SqliteDialect.Provider);
var db = Seed.CreateArtistAndTrackTablesWithData(dbFactory.Open());

var alive = db.Single<Track>(x => x.Name == "Alive"); 
alive.Name = "Still Alive";
alive.Year = 2000;
db.Update(alive); // Updates all fields except `Id` which is used to filter
var updatedTrackById = db.SingleById<Track>(alive.Id);
$"Track Updated by Id: {updatedTrackById}".Print();

var pearlJamTracks = db.Select<Track>(x => x.ArtistId == alive.ArtistId);
pearlJamTracks.Each(x => x.Album = "Rearviewmirror (Greatest Hits 1991–2003)");
db.Update(pearlJamTracks[0], pearlJamTracks[1]); //Update by params
pearlJamTracks = db.Select<Track>(x => x.ArtistId == alive.ArtistId);
$"\nUpdated all Pearl Jam Tracks: {pearlJamTracks.Dump()}".Print();

//Updates only non-default value fields (inc Id) matching specified filter
db.UpdateNonDefaults(new Track { Id = 10, Name = "Still Alive..." }, x => x.Name == "Still Alive");
var updatedNonDefaults = db.SingleById<Track>(10);
$"\nUpdateNonDefaults: {updatedNonDefaults.Dump()}".Print();

//Updates ALL fields matching specified filter
db.Update(new Track { Id = 20, Name = "Partially Alive...", ArtistId = alive.ArtistId }, 
	where: x => x.Name == "Still Alive...");
var updatedAllFields = db.SingleById<Track>(20);
$"\nUpdate ALL fields with custom filter: {updatedAllFields.Dump()}".Print();

//Update only fields in anonymous type
db.Update<Track>(new { Year = 2000 }, where: x => x.Id == 20);
var updateOnlyAnonTypeFields = db.SingleById<Track>(20);
$"\nUpdate only fields in anonymous Type: {updateOnlyAnonTypeFields.Dump()}".Print();

Inspect.vars(new { updatedTrackById, pearlJamTracks, updatedNonDefaults, updatedAllFields, updateOnlyAnonTypeFields });
