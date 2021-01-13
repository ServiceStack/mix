using System;
using System.Linq;
using System.Collections.Generic;
using ServiceStack;
using ServiceStack.Text;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.Sqlite;

var dbFactory = new OrmLiteConnectionFactory(":memory:", SqliteDialect.Provider);
var db = Seed.CreateArtistAndTrackTablesWithData(dbFactory.OpenDbConnection());

List<int> trackIds = db.Column<int>(db.From<Track>());
$"Track Ids: {trackIds.Join(", ")}".Print();

HashSet<int> years = db.ColumnDistinct<int>(db.From<Track>().Select(x => x.Year));
$"\nUnique Years: {years.OrderBy(x => x).Join(", ")}".Print();

Dictionary<string, int> trackAndYears = db.Dictionary<string, int>(
    db.From<Track>().Select(x => new { x.Name, x.Year }));
$"\nTracks with Year: {trackAndYears.Dump()}".Print();

var tracksCountByYear = db.Dictionary<int, int>(db.From<Track>()
	.Join<Artist>()
    .GroupBy(x => x.Year)     
    .OrderBy(x => x.Year)
    .Select(x => new { x.Year, Count = Sql.Count("*") }));
$"\nNo of Tracks in each Year: {tracksCountByYear.Dump()}".Print();

Dictionary<int, List<string>> tracksByYear = db.Lookup<int, string>(
	db.From<Track>().Select(x => new { x.Year, x.Name }));
$"\nTracks released by Year: {tracksByYear.Dump()}".Print();

Inspect.vars(new { trackIds, trackAndYears, tracksCountByYear, tracksByYear });
