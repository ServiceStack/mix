using System;
using ServiceStack;
using ServiceStack.Text;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.Sqlite;
using ServiceStack.DataAnnotations;

var dbFactory = new OrmLiteConnectionFactory(":memory:", SqliteDialect.Provider);
var db = Seed.CreateArtistAndTrackTablesWithData(dbFactory.Open());

var alive = db.Single<Track>(x => x.Name == "Alive"); 

//Updates only fields in lambda expression
db.UpdateOnly(() => new Track { Name = "Still Alive", Year = 2000 }, 
	where: x => x.Id == alive.Id);

var updatedByExpression = db.SingleById<Track>(alive.Id);
$"Track Updated by Expression: {updatedByExpression.Dump()}".Print();

//Updates only fields specified
db.UpdateOnly(new Track { Year = 2001 }, onlyFields: x => x.Year, 
    where: x => x.Id == alive.Id);

var updatedSpecificField = db.SingleById<Track>(alive.Id);
$"\nTrack Year updated by Expression: {updatedSpecificField.Dump()}".Print();

//Updating multiple fields
db.UpdateOnly(new Track { Name = "Still Alive", Year = 2002 }, 
    onlyFields: p => new { p.Name, p.Year },
    where: x => x.Id == alive.Id);

var updatedMultipleFields = db.SingleById<Track>(alive.Id);
$"\nMultiple fields updated by Expression: {updatedMultipleFields.Dump()}".Print();

//Updating multiple fields by name
db.UpdateOnly(new Track { Name = "Staying Alive", Year = 2003 }, 
    onlyFields: p => new[] { "Name", "Year" },
    where: x => x.Id == alive.Id);

var updatedByFieldNames = db.SingleById<Track>(alive.Id);
$"\nMultiple fields updated by field names: {updatedByFieldNames.Dump()}".Print();

Inspect.vars(new { updatedByExpression, updatedSpecificField, updatedMultipleFields, updatedByFieldNames });
