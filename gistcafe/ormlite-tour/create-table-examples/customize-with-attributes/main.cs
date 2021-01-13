using System;
using ServiceStack;
using ServiceStack.Text;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.Sqlite;
using ServiceStack.DataAnnotations;

var dbFactory = new OrmLiteConnectionFactory(":memory:", SqliteDialect.Provider);
var db = dbFactory.Open();

db.CreateTable<CustomTable>();
var id = db.Insert(new CustomTable { CSharpName = "Name", IndexColumn = "bar", RequiredCustomLength = "foo",
	CustomDecimalPrecision = 1.111m, CustomProperty = 2.222m }, selectIdentity:true);

var customTableRow = db.SingleById<CustomTable>(id);
$"Custom Table Row: {customTableRow.Dump()}".Print();

Inspect.vars(new { customTableRow });

[Schema("TheSchema")]
[Alias("TableAlias")]
public class CustomTable
{
    [PrimaryKey]
    [AutoIncrement]
    public int CustomKey { get; set; }
    
    [Alias("RDBMS_NAME")]
    public string CSharpName { get; set; }
    
    [Index(Unique = true)]
    public string IndexColumn { get; set; }

    [Default(100)]
    public int? DefaultValue { get; set; }
    
    [Default(OrmLiteVariables.SystemUtc)]
    public DateTime CurrentDate { get; set; }

    [Required]
    [StringLength(3)]
    public string RequiredCustomLength { get; set; } //= NOT NULL
    
    [DecimalLength(18,4)]
    public decimal? CustomDecimalPrecision { get; set; }
    
    [CustomField("DECIMAL(18,4)")]
    public decimal? CustomProperty { get; set; }
    
    // Completely ignored in OrmLite (used in Serialization only)
    [Ignore]
    public int IgnoredProperty { get; set; }

    // Doesn't exist on Table, only used in SELECT Statements
    [CustomSelect("CustomKey + DefaultValue")] 
	public int SelectOnlyProperty { get; set; }
}
