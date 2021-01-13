using System;
using System.Collections.Generic;
using ServiceStack;
using ServiceStack.Text;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.Sqlite;
using ServiceStack.DataAnnotations;

var dbFactory = new OrmLiteConnectionFactory(":memory:", SqliteDialect.Provider);
var db = dbFactory.Open();

db.CreateTable<Artist>();
db.CreateTable<Track>();

db.Save(new Artist { 
    Id = 1, Name = "Faith No More", 
    Tracks = new List<Track> { 
        new Track { Name = "Everythings Ruined", Album = "Angel Dust", Year = 1992 },
        new Track { Name = "Ashes to Ashes", Album = "Album of the Year", Year = 1997 },
    }
}, references:true);

var artist = db.SingleById<Artist>(1);
$"Artist: {artist.Dump()}".Print();
var tracks = db.Select<Track>();
$"\nTracks: {tracks.Dump()}".Print();
var artistWithTracks = db.LoadSingleById<Artist>(1);
$"\nArtist with Tracks: {artistWithTracks.Dump()}".Print();

var track = new Track { Name = "The Gentle Art of Making Enemies", Album = "King for a Day", Year = 1995, ArtistId = 1 };
db.Save(track); // Inserts new Track
$"\nInserted Track: {db.SingleById<Track>(track.Id).Dump()}".Print();

track.Name = "King for a Day... Fool for a Lifetime";
db.Save(track); // Updates existing Track
$"\nUpdated Track: {db.SingleById<Track>(track.Id).Dump()}".Print();

Inspect.vars(new { artist, track });

public class Artist {
    public int Id { get; set; }
    public string Name { get; set; }
    [Reference] public List<Track> Tracks { get; set; }
    public override string ToString() => Name;
}
public class Track {
    [AutoIncrement] 
    public int Id { get; set; }
    public string Name { get; set; }
    public int ArtistId { get; set; }
    public string Album { get; set; }
    public int Year { get; set; }
    public override string ToString() => Name;
}
