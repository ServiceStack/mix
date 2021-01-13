using System;
using ServiceStack;
using ServiceStack.Text;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.Sqlite;
using ServiceStack.DataAnnotations;

var dbFactory = new OrmLiteConnectionFactory(":memory:", SqliteDialect.Provider);
var db = dbFactory.Open();

if (db.CreateTableIfNotExists<AllFields>()) { //= true; if table was created
    db.Insert(new AllFields { 
        Id = "Id", Int = 1, Long = 2, Uint = 3, Guid = Guid.NewGuid(), Bool = true, DateTime = DateTime.UtcNow,
        Float = 1.1f, Double = 2.2d, Decimal = 3.3m, TimeSpan = new TimeSpan(1,1,1,1) });
}
var allFields = db.SingleById<AllFields>("Id");
$"All Fields: {allFields.Dump()}".Print();

db.DropAndCreateTable<AllFields>();
var emptyAllFieldsCount = db.Count<AllFields>();
$"All Fields Count: {emptyAllFieldsCount}".Print();

db.DropTable<AllFields>();
var oldTableExists = db.TableExists<AllFields>();
$"Old Table Exists: {oldTableExists}".Print();

db.CreateTable<AllFields>();
var newTableExists = db.TableExists<AllFields>();
$"New Table Exists: {newTableExists}".Print();

Inspect.vars(new { allFields });

public class AllFields
{
    public string Id { get; set; } //implicit Primary Key
    public int Int { get; set; }
    public int? NInt { get; set; }
    public long Long { get; set; }
    public long? NLong { get; set; }
    public uint Uint { get; set; }
    public uint? NUint { get; set; }
    public Guid Guid { get; set; }
    public Guid? NGuid { get; set; }
    public bool Bool { get; set; }
    public bool? NBool { get; set; }
    public DateTime DateTime { get; set; }
    public DateTime? NDateTime { get; set; }
    public float Float { get; set; }
    public float? NFloat { get; set; }
    public double Double { get; set; }
    public double? NDouble { get; set; }
    public decimal Decimal { get; set; }
    public decimal? NDecimal { get; set; }
    public TimeSpan TimeSpan { get; set; }
    public TimeSpan? NTimeSpan { get; set; }
}
