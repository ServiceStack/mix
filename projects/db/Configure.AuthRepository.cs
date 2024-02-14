using System;
using System.Collections.Generic;
using Microsoft.Extensions.DependencyInjection;
using ServiceStack;
using ServiceStack.Web;
using ServiceStack.Data;
using ServiceStack.Auth;
using ServiceStack.Text;
using ServiceStack.Configuration;
using ServiceStack.OrmLite;

namespace MyApp
{
    // Custom User Table with extended Metadata properties
    public class AppUser : UserAuth
    {
        public string ProfileUrl { get; set; }
        public string LastLoginIp { get; set; }
        public DateTime? LastLoginDate { get; set; }
    }

    public class CustomUserAuth : UserAuth
    {
        public string DefaultProfileUrl { get; set; }
        public string IpAddress { get; set; }
        public string RefSource { get; set; }
        public string RefUrn { get; set; }
        public DateTime? Banned { get; set; }
        public string BannedBy { get; set; }
        public string Notes { get; set; }
        public DateTime? DisableEmails { get; set; }
        public string CreatedBy { get; set; }
    }

    public class AppUserAuthEvents : AuthEvents
    {
        public override void OnAuthenticated(IRequest req, IAuthSession session, IServiceBase authService, 
            IAuthTokens tokens, Dictionary<string, string> authInfo)
        {
            var authRepo = HostContext.AppHost.GetAuthRepository(req);
            using (authRepo as IDisposable)
            {
                var userAuth = (AppUser)authRepo.GetUserAuth(session.UserAuthId);
                userAuth.ProfileUrl = session.GetProfileUrl();
                userAuth.LastLoginIp = req.UserHostAddress;
                userAuth.LastLoginDate = DateTime.UtcNow;
                authRepo.SaveUserAuth(userAuth);
            }
        }
    }

    public class ConfigureAuthRepository : IConfigureAppHost, IConfigureServices, IPreInitPlugin
    {
        public void Configure(IServiceCollection services)
        {
            services.AddSingleton<IAuthRepository>(c =>
                new OrmLiteAuthRepository<AppUser, UserAuthDetails>(c.GetRequiredService<IDbConnectionFactory>()) {
                    UseDistinctRoleTables = true
                });            
        }

        public void Configure(IAppHost appHost)
        {
            var authRepo = appHost.Resolve<IAuthRepository>();
            authRepo.InitSchema();

            CreateUser(authRepo, "admin@email.com", "Admin User", "p@55wOrd", roles:new[]{ RoleNames.Admin });

            //ImportTechStackUsers((OrmLiteConnectionFactory) appHost.Resolve<IDbConnectionFactory>(), authRepo);
        }

        public void ImportTechStackUsers(OrmLiteConnectionFactory dbFactory, IAuthRepository authRepo)
        {
            dbFactory.RegisterConnection("techstacks", 
                Environment.GetEnvironmentVariable("TECHSTACKS_DB"),
                PostgreSqlDialect.Provider);

            using var db = dbFactory.Open();
            using var dbTechStacks = dbFactory.Open("techstacks");

            var existingEmails = db.ColumnDistinct<string>(db.From<AppUser>().Select(x => x.Email));
            var techstackUsers = dbTechStacks.Select(dbTechStacks.From<CustomUserAuth>());
            foreach (var user in techstackUsers)
            {
                try
                {
                    if (existingEmails.Contains(user.Email))
                        continue;
                    var appUser = user.ConvertTo<AppUser>();
                    appUser.ProfileUrl = user.DefaultProfileUrl;
                    authRepo.CreateUserAuth(appUser, "test");
                }
                catch (Exception ex)
                {
                    ex.Message.Print();
                }
            }
        }

        public void BeforePluginsLoaded(IAppHost appHost)
        {
            appHost.AssertPlugin<AuthFeature>().AuthEvents.Add(new AppUserAuthEvents());
        }

        // Add initial Users to the configured Auth Repository
        public void CreateUser(IAuthRepository authRepo, string email, string name, string password, string[] roles)
        {
            if (authRepo.GetUserAuthByUserName(email) == null)
            {
                var newAdmin = new AppUser { Email = email, DisplayName = name };
                var user = authRepo.CreateUserAuth(newAdmin, password);
                authRepo.AssignRoles(user, roles);
            }
        }
    }
}
