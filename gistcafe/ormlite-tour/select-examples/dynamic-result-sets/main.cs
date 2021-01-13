using System;
using System.Linq;
using System.Collections.Generic;
using ServiceStack;
using ServiceStack.Text;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.Sqlite;

var dbFactory = new OrmLiteConnectionFactory(":memory:", SqliteDialect.Provider);
var db = Seed.CreateArtistAndTrackTablesWithData(dbFactory.OpenDbConnection());

var aggregates = db.Select<List<object>>(
    db.From<Track>().Select("COUNT(*), MIN(Year), MAX(Year)")).First();
$"List<object> Aggregates: {aggregates.Dump()}".Print();

var keyValuePairs = db.Select<Dictionary<string, object>>(
    db.From<Track>().Select("COUNT(*) Total, MIN(Year) Min, MAX(Year)")).First();

$"\nDictionary<string,object> Aggregates: {keyValuePairs.Dump()}".Print();

var q = db.From<Track>().Select("COUNT(*) Total, MIN(Year) Min, MAX(Year) Max");

var customPoco = db.Select<Poco>(q).First();
$"\nPoco Aggregates: {customPoco.Dump()}".Print();

var dynamicResult = db.Select<dynamic>(q).First();
long total = dynamicResult.Total;
long min = dynamicResult.Min;
long max = dynamicResult.Max;
$"\nDynamic Aggregates: Total: {total}, Min: {min}, Max: {max}".Print();

var artistsWithTracksFrom93 = db.SelectMulti<Track,Artist>(db.From<Track>()
      .Join<Artist>()
      .Where(x => x.Year == 1993));
$"\nArtists with Tracks from 1993:".Print();
foreach (var tuple in artistsWithTracksFrom93)
{
    $"\nTrack/Artist: {new {track=tuple.Item1, artist=tuple.Item2}.Dump()}".Print();
}

Inspect.vars(new { aggregates, keyValuePairs, customPoco, artistsWithTracksFrom93 });

class Poco
{
    public int Total { get; set; }
    public int Min { get; set; }
    public int Max { get; set; }
}

