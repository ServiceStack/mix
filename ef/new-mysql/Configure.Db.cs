using Microsoft.EntityFrameworkCore;
using ServiceStack.OrmLite;
using MyApp.Data;

[assembly: HostingStartup(typeof(MyApp.ConfigureDb))]

namespace MyApp;

public class ConfigureDb : IHostingStartup
{
    public void Configure(IWebHostBuilder builder) => builder
        .ConfigureServices((context, services) => {
            var connectionString = context.Configuration.GetConnectionString("DefaultConnection")
                ?? "Server=localhost;Database=test;UID=root;Password=test;SslMode=Required;AllowLoadLocalInfile=true;Convert Zero Datetime=True";
            
            services.AddOrmLite(options => options.UseMySql(connectionString));

            // $ dotnet ef migrations add CreateIdentitySchema
            // $ dotnet ef database update
            services.AddDbContext<ApplicationDbContext>(options =>
                options.UseMySQL(connectionString, b => b.MigrationsAssembly(nameof(MyApp))));
            
            // Enable built-in Database Admin UI at /admin-ui/database
            services.AddPlugin(new AdminDatabaseFeature());
        });
}
