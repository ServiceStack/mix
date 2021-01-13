using System;
using System.Linq;
using System.Collections.Generic;
using ServiceStack;
using ServiceStack.Text;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.Sqlite;

var dbFactory = new OrmLiteConnectionFactory(":memory:", SqliteDialect.Provider);
var db = Seed.CreateArtistAndTrackTablesWithData(dbFactory.OpenDbConnection());

var q = db.From<Track>()
    .Join<Artist>() //Uses implicit reference convention
    .Where<Artist>(x => x.Name == "Nirvana");
var implicitJoin = db.Select(q);
$"Nirvana Tracks (implicit join): {implicitJoin.Dump()}".Print();

var explicitJoin = db.Select(db.From<Track>()
	.Join<Artist>((track,artist) => track.ArtistId == artist.Id)
    .Where<Artist>(x => x.Name == "Nirvana"));
$"\nNirvana Tracks (explicit join): {explicitJoin.Dump()}".Print();

var nirvanaWithRefs = db.LoadSingleById<Artist>(explicitJoin[0].ArtistId);
$"\nNirvana with References: {nirvanaWithRefs.Dump()}".Print();

var oldestTracks = db.Select(db.From<Track>()
    .Where(x => Sql.In(x.Year, db.From<Track>().Select(y => Sql.Min(y.Year)))));
$"\nOldest Tracks: {oldestTracks.Dump()}".Print();

var oldestTrackIds = oldestTracks.Map(x => x.Id);
var earliestArtistsWithRefs = db.LoadSelect(db.From<Artist>()
    .Where(a => oldestTracks.Map(t => t.ArtistId).Contains(a.Id)));
$"\nEarliest Artists: {earliestArtistsWithRefs.Dump()}".Print();

var oldestTracksAndArtistNames = db.Dictionary<string, string>(db.From<Track>()
	.Join<Artist>()
	.Where(x => oldestTrackIds.Contains(x.Id))
    .Select<Track,Artist>((t,a) => new { t.Name, Artist = a.Name }));
$"\nOldest Track and Artist Names: {oldestTracksAndArtistNames.Dump()}".Print();

var oldestTrackAndArtists = db.SelectMulti<Track,Artist>(db.From<Track>()
      .Join<Artist>()
      .Where(x => oldestTrackIds.Contains(x.Id)));
foreach (var tuple in oldestTrackAndArtists)
{
    Track track = tuple.Item1;
    Artist artist = tuple.Item2;
    $"\nOldest Track + Artist: {new { track, artist }.Dump()}".Print();
}

Inspect.vars(new { implicitJoin, explicitJoin, nirvanaWithRefs, oldestTracks, earliestArtistsWithRefs });
