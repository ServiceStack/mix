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
    .OrderByDescending(x => x.Year)
    .Take(3);
var latest3Tracks = db.Select(q);
$"Latest 3 Tracks: {latest3Tracks.Dump()}".Print();
$"SQL: {db.GetLastSql()}".Print();

var faithAndLiveTracks = db.Select(db.From<Track>()
    .Where(x => x.Album == "Angel Dust" && x.Year == 1992)
    .Or(x => x.Album == "Throwing Copper" && x.Year == 1994));
$"\nEverythings Ruined + Lightning Crashes: {faithAndLiveTracks.Dump()}".Print();

// More advanced SQL Expression
var customYears = new[] { 1993, 1994, 1997 };
q = db.From<Track>()
    .Where(x => customYears.Contains(x.Year))
    .And(x => x.Name.Contains("A"))
    .GroupBy(x => x.Year)
    .OrderByDescending("Total")
    .ThenBy(x => x.Year)
    .Take(2)
    .Select(x => new { x.Year, Total = Sql.Count("*") });

var top2CountOfAByYear = db.Dictionary<string, int>(q);
$"\nLatest 2 Count of A Tracks Grouped by Year: {top2CountOfAByYear.Dump()}".Print();
$"SQL: {db.GetLastSql()}".Print();

Inspect.vars(new { latest3Tracks, faithAndLiveTracks, top2CountOfAByYear });