using System;
using System.Linq;
using System.Collections.Generic;
using ServiceStack;
using ServiceStack.Text;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.Sqlite;

var dbFactory = new OrmLiteConnectionFactory(":memory:", SqliteDialect.Provider);
var db = Seed.CreateArtistAndTrackTablesWithData(dbFactory.OpenDbConnection());

var upperNamesWithA = db.SqlColumn<string>(
    "SELECT upper(Name) FROM Track WHERE instr(Name,'a') > 0");
$"Uppercase Names of Tracks containing 'a': {upperNamesWithA.Dump()}".Print();

var meta = db.SqlList<CustomPoco>(
    "SELECT DISTINCT Year % 10 as Year, hex(Year % 10) as Hex FROM Track");
$"\nTrack Years and their Hex Value: {meta.Dump()}".Print();

db.ExecuteSql("ALTER TABLE Track ADD Rand INT default 0");
db.ExecuteSql("UPDATE Track SET Rand = abs(random()) % 1000");

var trackRandValues = db.Dictionary<string,int>("SELECT Name, Rand FROM Track");
$"\nTracks and their Rand value: {trackRandValues.Dump()}".Print();

var maxRand = db.SqlScalar<int>("SELECT MAX(Rand) FROM Track");
$"\nMax Rand Value: {maxRand}".Print();

Inspect.vars(new { upperNamesWithA, meta, trackRandValues });

class CustomPoco 
{
    public int Year { get; set; }
    public string Hex { get; set; }
}
