using System;
using System.Linq;
using System.Collections.Generic;
using ServiceStack;
using ServiceStack.Text;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.Sqlite;

var dbFactory = new OrmLiteConnectionFactory(":memory:", SqliteDialect.Provider);
var db = Seed.CreateArtistAndTrackTablesWithData(dbFactory.OpenDbConnection());

var nirvana = db.Select<Artist>(x => x.Name == "Nirvana").First();
$"\nNirvana: \n{nirvana.Dump()}".Print();

var nirvanaTracks = db.Select<Track>(x => x.ArtistId == nirvana.Id);

var nirvanaTrackIds = nirvanaTracks.Map(x => x.Id); // Convenience Extension method
$"\nNirvana TrackIds: \n{nirvanaTrackIds.Dump()}".Print();

//Using SQL IN by .NET Collection `Contains()` or explicit `Sql.In()`
var nirvanaTracksByIn = db.Select<Track>(x => nirvanaTrackIds.Contains(x.Id));
var nirvanaTracksByInAlt = db.Select<Track>(x => Sql.In(x.Id, nirvanaTrackIds));
$"\nNirvana Track Names: {nirvanaTracksByIn.Map(x => x.Name).Dump()}".Print();

var pearlJam = db.Select<Artist>(x => x.Name.StartsWith("Pearl")).First();
$"\nPearl Jam: \n{pearlJam.Dump()}".Print();

var faithNoMore = db.Select<Artist>(x => x.Name.EndsWith("More")).First();
$"\nFaith No More: \n{faithNoMore.Dump()}".Print();

var smellsLikeTeenSpirit = db.Select<Track>(x => x.Name.Contains("Teen")).First();
$"\nSmells Like Teen Spirit: \n{smellsLikeTeenSpirit.Dump()}".Print();

var latestTracks = db.Select<Track>(x => x.Year >= 1997);
$"\nLatest Tracks: \n{latestTracks.Dump()}".Print();

var heartShapedBox = db.Select<Track>(x => x.ArtistId == nirvana.Id 
	&& x.Year == 1993 && x.Album == "In Utero").First();
$"\nHeart-Shaped Box: \n{heartShapedBox.Dump()}".Print();

Inspect.vars(new { nirvanaTracksByIn, pearlJam, faithNoMore, latestTracks, heartShapedBox });
