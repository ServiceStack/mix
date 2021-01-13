using System;
using ServiceStack;
using ServiceStack.Text;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.Sqlite;
using ServiceStack.DataAnnotations;

var dbFactory = new OrmLiteConnectionFactory(":memory:", SqliteDialect.Provider);
var db = Seed.CreateArtistAndTrackTablesWithData(dbFactory.Open());

//Multiple Entities
var nirvana = db.Single<Artist>(x => x.Name == "Nirvana");
var nirvanaTracks = db.Select<Track>(x => x.ArtistId == nirvana.Id);
var noOfNirvanaTracksDeleted = db.DeleteAll(nirvanaTracks);
var remainingNirvanaTracks = db.Count<Track>(x => x.ArtistId == nirvana.Id);
$"{noOfNirvanaTracksDeleted} Nirvana Tracks Deleted, {remainingNirvanaTracks} Remaining".Print();

//Multiple rows by Ids
var live = db.Single<Artist>(x => x.Name == "Live");
var liveTrackIds = db.Column<int>(db.From<Track>().Where(x => x.ArtistId == live.Id).Select(x => x.Id));
var noOfLiveTracksDeleted = db.DeleteByIds<Track>(liveTrackIds);
var remainingLiveTracks = db.Count<Track>(x => x.ArtistId == nirvana.Id);
$"\n{noOfLiveTracksDeleted} Live Tracks Deleted, {remainingLiveTracks} Remaining".Print();

var remainingTracks = db.Select<Track>();
$"\nRemaining Tracks: {remainingTracks.Dump()}".Print();

var noOfTracksDeleted = db.DeleteAll<Track>();
var noOfRemainingTracks = db.Count<Track>();
$"\n{noOfTracksDeleted} Remaining Tracks Deleted, {noOfRemainingTracks} Left".Print();

Inspect.vars(new { nirvanaTracks, remainingTracks });
