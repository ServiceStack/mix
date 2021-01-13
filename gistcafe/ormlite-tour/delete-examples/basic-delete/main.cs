using System;
using ServiceStack;
using ServiceStack.Text;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.Sqlite;
using ServiceStack.DataAnnotations;

var dbFactory = new OrmLiteConnectionFactory(":memory:", SqliteDialect.Provider);
var db = Seed.CreateArtistAndTrackTablesWithData(dbFactory.Open());

//By Entity
var alive = db.Single<Track>(x => x.Name == "Alive");
db.Delete(alive);
var stillAlive = db.Exists<Track>(x => x.Id == alive.Id);
$"Still Alive? {stillAlive}".Print();

//By Id
var remainingPearlJamTrack = db.Select<Track>(x => x.ArtistId == alive.ArtistId);
db.DeleteById<Track>(remainingPearlJamTrack[0]);
var noMorePearlJamTracks = db.Select<Track>(x => x.ArtistId == alive.ArtistId);
$"\nAll Pearl Jam Tracks Deleted: {noMorePearlJamTracks.Dump()}".Print();

//By Expression
var nirvana = db.Single<Artist>(x => x.Name == "Nirvana");
var noOfNirvanaTracksDeleted = db.Delete<Track>(x => x.ArtistId == nirvana.Id && x.Year == 1991);
var remainingNirvanaTracks = db.Count<Track>(x => x.ArtistId == nirvana.Id);
$"\n{noOfNirvanaTracksDeleted} Nirvana Tracks Deleted, {remainingNirvanaTracks} Remaining".Print();

//By SqlExpression
var q = db.From<Track>().Where(x => x.Year == 1993);
db.Delete(q);
var tracksFrom93 = db.Count<Track>(x => x.Year == 1993);
$"\nRemaining Tracks from 1993: {tracksFrom93}".Print();

//By Custom SQL
db.Delete<Track>("Name = @name", new { name = "Everythings Ruined" });

var remainingTracks = db.Select<Track>();
$"\nRemaining Tracks: {remainingTracks.Dump()}".Print();

Inspect.vars(new { remainingPearlJamTrack, tracksFrom93, remainingTracks });
