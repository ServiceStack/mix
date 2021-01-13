using System;
using ServiceStack;
using ServiceStack.Text;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.Sqlite;
using ServiceStack.DataAnnotations;

var dbFactory = new OrmLiteConnectionFactory(":memory:", SqliteDialect.Provider);
var db = dbFactory.Open();

bool v1TableExists, v1RatingExists, v2RatingExists;

v1TableExists = db.TableExists<Track>();
$"Table Exists: {v1TableExists}".Print();
if (!v1TableExists)
{
	db.CreateTable<Track>(); 
	v1TableExists = db.TableExists<Track>();
    $"Table Exists v1: {v1TableExists}".Print();
}

v1RatingExists = db.ColumnExists<Track_v2>(x => x.Rating);
$"Rating Exists v1: {v1RatingExists}".Print();
if (!v1RatingExists)
{
    db.AddColumn<Track_v2>(x => x.Rating);
    v2RatingExists = db.ColumnExists<Track_v2>(x => x.Rating);
    $"Rating Exists v2: {v2RatingExists}".Print();
}

public class Track
{
    [AutoIncrement]
    public int Id { get; set; }
    public string Name { get; set; }
    public string Album { get; set; }
    public int ArtistId { get; set; } 
}

// Map to same "Track" RDBMS Table, not needed when Track is refactored
[Alias("Track")]
public class Track_v2
{
    [AutoIncrement]
    public int Id { get; set; }
    public string Name { get; set; }
    public string Album { get; set; }
    public int ArtistId { get; set; } 
    [Default(5)]
    public int Rating { get; set; }  // ADD
}
