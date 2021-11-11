using ServiceStack;
using ServiceStack.Html;
using NUglify;

[assembly: HostingStartup(typeof(MyApp.ConfigureNUglify))]

namespace MyApp
{
    public class NUglifyJsMinifier : ICompressor
    {
        public string Compress(string js) => Uglify.Js(js).Code;
    }
    public class NUglifyCssMinifier : ICompressor
    {
        public string Compress(string css) => Uglify.Css(css).Code;
    }
    public class NUglifyHtmlMinifier : ICompressor
    {
        public string Compress(string html) => Uglify.Html(html).Code;
    }

    public class ConfigureNUglify : IHostingStartup
    {
        public void Configure(IWebHostBuilder builder) => builder
            .ConfigureAppHost(_ => {
                Minifiers.JavaScript = new NUglifyJsMinifier();
                Minifiers.Css = new NUglifyCssMinifier();
                Minifiers.Html = new NUglifyHtmlMinifier();
            });
    }
}
