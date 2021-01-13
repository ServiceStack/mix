using System.Collections.Generic;
using ServiceStack;
using ServiceStack.Text;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.Sqlite;
using ServiceStack.DataAnnotations;

var dbFactory = new OrmLiteConnectionFactory(":memory:", SqliteDialect.Provider);
var db = dbFactory.Open();

db.CreateTable<ArtistWithBlobTracks>();
db.CreateTable<Artist>();
db.CreateTable<Track>();

db.Insert(new ArtistWithBlobTracks { 
    Id = 1, Name = "Faith No More", 
    Tracks = new List<Track> { 
        new Track { Name = "Everythings Ruined", Album = "Angel Dust" },
        new Track { Name = "Ashes to Ashes", Album = "Album of the Year" } } 
});
var artistWithBlobTracks = db.SingleById<ArtistWithBlobTracks>(1);
$"Artist with blobbed Tracks: {artistWithBlobTracks.Dump()}".Print();
$"\nBlob Tracks Count: {db.Count<Track>()}".Print();

db.Save(new Artist { 
    Id = 1, Name = "Faith No More", 
    Tracks = new List<Track> { 
        new Track { Name = "Everythings Ruined", Album = "Angel Dust" },
        new Track { Name = "Ashes to Ashes", Album = "Album of the Year" } }
}, references: true);

var artistWithRefTracks = db.LoadSingleById<Artist>(1);
$"\nArtist with referenced Tracks: {artistWithRefTracks.Dump()}".Print();
$"\nReferenced Tracks Count: {db.Count<Track>()}".Print();

Inspect.vars(new { artistWithBlobTracks, artistWithRefTracks });

public class ArtistWithBlobTracks
{
    public int Id { get; set; }
    public string Name { get; set; }
    //By default Complex Types are blobbed with the containing record
    public List<Track> Tracks { get; set; }
}
public class Artist
{
    public int Id { get; set; }
    public string Name { get; set; }
    //Complex Type References are persisted in own table
    [Reference] public List<Track> Tracks { get; set; }
}
public class Track
{
    [AutoIncrement] 
    public int Id { get; set; }
    public string Name { get; set; }
    public string Album { get; set; }
    public int ArtistId { get; set; } // Implicit Reference Id
}
