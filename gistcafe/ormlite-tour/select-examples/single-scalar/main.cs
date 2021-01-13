using System;
using System.Linq;
using System.Collections.Generic;
using ServiceStack;
using ServiceStack.Text;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.Sqlite;

var dbFactory = new OrmLiteConnectionFactory(":memory:", SqliteDialect.Provider);
var db = Seed.CreateArtistAndTrackTablesWithData(dbFactory.OpenDbConnection());

var nevermind = db.Single<Track>(x => x.Album == "Nevermind");
$"Nevermind: {nevermind.Dump()}".Print();

var nirvana = db.SingleById<Artist>(nevermind.ArtistId);
$"\nNirvana: {nirvana.Dump()}".Print();

var latestYear = db.Scalar<int>(db.From<Track>()
    .Select(x => Sql.Max(x.Year)));
$"\nLatest Year: {latestYear}".Print();

var differentArtistsCount = db.Scalar<int>(db.From<Track>()
    .Select(x => Sql.CountDistinct(x.ArtistId)));
$"\nNumber of Artists: {differentArtistsCount}".Print();

int tracksAfter93 = db.Scalar<Track,int>(x=> Sql.Count("*"), x=> x.Year > 1993);
$"\nTracks after 1993: {tracksAfter93}".Print();

var nirvanaTracksCount = db.Count<Track>(x => x.ArtistId == nirvana.Id);
$"\nNumber of Nirvana Tracks: {nirvanaTracksCount}".Print();

$"\nHave Tracks in 1990: {db.Exists<Track>(x => x.Year == 1990)}".Print();
$"\nHave Tracks in 1991: {db.Exists<Track>(x => x.Year == 1991)}".Print();

var inUtero = db.Where<Track>(new { ArtistId = nirvana.Id, Year = 1993 });
$"\nIn Utero: {inUtero.Dump()}".Print();

var lazySequence = db.SelectLazy(db.From<Track>().OrderBy(x => x.Year));
var lazyLinq = lazySequence.Take(3).Select(x => $"{x.Year}: {x.Album}");
db.Insert(new Track {
    Name = "About a Girl", ArtistId = nirvana.Id, Album="Bleach", Year=1989 }); 
lazyLinq.Each(x => x.Print()); 

Inspect.vars(new { nevermind, nirvana, inUtero });