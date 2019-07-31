using System;
using System.Linq;
using System.Collections.Generic;
using ServiceStack;
using ServiceStack.Script;
using ServiceStack.Validation;
using MyApp.ServiceModel;
using MyApp.ServiceModel.Types;

namespace MyApp
{
    public class ConfigureContacts : IConfigureAppHost, IAfterInitAppHost
    {
        public void Configure(IAppHost appHost)
        {
            //Register required plugins if not registered already
            appHost.Plugins.AddIfNotExists(new ValidationFeature());
            appHost.Plugins.AddIfNotExists(new SharpPagesFeature());
            appHost.AssertPlugin<SharpPagesFeature>().ScriptMethods.Add(new ContactScripts());
            
            // Register Custom Auto Mapping for converting Contact Data Model to Contact DTO
            AutoMapping.RegisterConverter((Data.Contact from) => 
                from.ConvertTo<ServiceModel.Types.Contact>(skipConverters:true));
        }

        public void AfterInit(IAppHost appHost)
        {
            View.NavItems.Add(new NavItem { 
                Label = "Contacts",
                Href = "/contacts/",
            });
        }
    }

    // Custom filters for App data sources and re-usable UI snippets in ServiceStack Sharp Pages
    public class ContactScripts : ScriptMethods
    {
        static Dictionary<string, string> Colors = new Dictionary<string, string> {
            {"#ffa4a2", "Red"},
            {"#b2fab4", "Green"},
            {"#9be7ff", "Blue"}
        };

        public Dictionary<string, string> contactColors() => Colors;

        private static List<KeyValuePair<string, string>> Titles => EnumUtils.GetValues<Title>()
            .Where(x => x != Title.Unspecified)
            .ToKeyValuePairs();

        public List<KeyValuePair<string, string>> contactTitles() => Titles;

        private static List<string> FilmGenres => EnumUtils.GetValues<FilmGenres>().Map(x => x.ToDescription());
        public List<string> contactGenres() => FilmGenres;
    }
}
