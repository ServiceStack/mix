using System.Collections.Generic;
using System.Data;
using ServiceStack;
using ServiceStack.OrmLite;
using ServiceStack.DataAnnotations;

public class Artist
{
    public int Id { get; set; }
    public string Name { get; set; }
    
    [Reference]
    public List<Track> Tracks { get; set; }
    public override string ToString() => Name;
}

public class Track
{
    [AutoIncrement]
    public int Id { get; set; }
    public string Name { get; set; }
    public int ArtistId { get; set; }
    public string Album { get; set; }
    public int Year { get; set; }
    public override string ToString() => Name;
}

public static class Seed 
{
    public static IDbConnection CreateArtistAndTrackTablesWithData(IDbConnection db)
    {
        db.DropAndCreateTable<Artist>();
        db.DropAndCreateTable<Track>();
        Artists.Each(x => db.Save(x, references:true));
        return db;
    }

    public static Artist[] Artists = new [] {
        new Artist { 
            Id = 1, Name = "Faith No More", 
            Tracks = new List<Track> { 
                new Track { Name = "Everythings Ruined", Album = "Angel Dust", Year = 1992 },
                new Track { Name = "Ashes to Ashes", Album = "Album of the Year", Year = 1997 },
            }
        },
        new Artist { 
            Id = 2, Name = "Live", 
            Tracks = new List<Track> { 
                new Track { Name = "Lightning Crashes", Album = "Throwing Copper", Year = 1994 },
                new Track { Name = "Lakini's Juice", Album = "Secret Samadhi", Year = 1997 },
            }
        },
        new Artist { 
            Id = 3, Name = "Nirvana", 
            Tracks = new List<Track> { 
                new Track { Name = "Smells Like Teen Spirit", Album = "Nevermind", Year = 1991  },
                new Track { Name = "Heart-Shaped Box", Album = "In Utero", Year = 1993 },
            }
        },
        new Artist { 
            Id = 4, Name = "Pearl Jam", 
            Tracks = new List<Track> { 
                new Track { Name = "Alive", Album = "Ten", Year = 1991 },
                new Track { Name = "Daughter", Album = "Vs", Year = 1993 },
            }
        },
    };
}
