using System;
using System.Collections.Generic;
using ServiceStack;
using ServiceStack.Text;
using ServiceStack.OrmLite;
using ServiceStack.OrmLite.Sqlite;
using ServiceStack.DataAnnotations;

var dbFactory = new OrmLiteConnectionFactory(":memory:", SqliteDialect.Provider);
var db = dbFactory.Open();     //Open ADO.NET DB Connection

db.DropAndCreateTable<User>(); //DROP (if exist) and CREATE Table from User POCO

db.Insert(                     //INSERT multiple Users by params
    new User { Id = 1, Name = "A", CreatedDate = DateTime.Now },
    new User { Id = 2, Name = "B", CreatedDate = DateTime.Now },
    new User { Id = 3, Name = "C", CreatedDate = DateTime.Now },
    new User { Id = 4, Name = "C", CreatedDate = DateTime.Now });

var rowsC = db.Select<User>(x => x.Name == "C"); //SELECT by typed expression
$"No of 'C' Rows: {rowsC.Count}, Ids:".Print();  //= 2
rowsC.ConvertAll(x => x.Id).PrintDump();         //= 3,4

db.Delete<User>(x => x.Name == "C");             //DELETE by typed expression

var remainingC = db.Select<User>("Name= @name", new { name="C" }); //Custom SQL
$"\nNo of 'C' Rows: {remainingC.Count}".Print();   //= 0

var rowsLeft = db.Select<User>();
$"\nRows Left: {rowsLeft.Count}".Print();          //= 2
rowsLeft.PrintDump();                            //= A,B

Inspect.vars(new { rowsC, remainingC, rowsLeft });

public class User
{
    public long Id { get; set; }
    
    [Index]
    public string Name { get; set; }
    public DateTime CreatedDate { get; set; }
    public override string ToString() => Name;
}
