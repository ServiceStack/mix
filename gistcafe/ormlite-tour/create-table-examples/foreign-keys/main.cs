using System;
using ServiceStack;
using ServiceStack.Text;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.Sqlite;
using ServiceStack.DataAnnotations;

var dbFactory = new OrmLiteConnectionFactory(":memory:", SqliteDialect.Provider);
var db = dbFactory.Open();

db.CreateTable<Artist>();
db.CreateTable<Album>();
db.CreateTable<Track>(); //Order is important for tables with Foreign Keys
var createTableDefinition = db.GetLastSql();
createTableDefinition.Print();

db.Insert(new Artist { Id = 1, Name = "Nirvana" });
db.Insert(new Album { Id = 2, Name = "Nevermind", ArtistId = 1 });
db.Insert(new Track { Id = 3, Name = "Smells Like Teen Spirit", AlbumId = 2, ArtistId = 1 });

var artist = db.SingleById<Artist>(1);
var album = db.SingleById<Album>(2);
var track = db.SingleById<Track>(3);

var artistTracksAndAlbum = new { artist, album, track };
$"Artist, Album + Tracks: {artistTracksAndAlbum.Dump()}".Print();

Inspect.vars(new { artistTracksAndAlbum });

public class Artist
{
    public int Id { get; set; }
    public string Name { get; set; }
}

public class Album
{
    public int Id { get; set; }
    public string Name { get; set; }

    [ForeignKey(typeof(Album), OnDelete = "CASCADE")]
    public int ArtistId { get; set; }
}

public class Track
{
    public int Id { get; set; }
    public string Name { get; set; }

    [References(typeof(Album))]
    public int AlbumId { get; set; } // db-agnostic attribute, generates FK to Artist

    [ForeignKey(typeof(Artist), OnDelete = "CASCADE")]
    public int ArtistId { get; set; }
}
