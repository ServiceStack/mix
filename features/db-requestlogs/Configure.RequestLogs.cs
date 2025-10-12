using ServiceStack.Web;

[assembly: HostingStartup(typeof(MyApp.ConfigureRequestLogs))]

namespace MyApp;

public class ConfigureRequestLogs : IHostingStartup
{
    public void Configure(IWebHostBuilder builder) => builder
        .ConfigureServices((context, services) => {

            services.AddPlugin(new RequestLogsFeature {
                RequestLogger = new DbRequestLogger {
                    // NamedConnection = "<alternative db>"
                },
                EnableResponseTracking = true,
                EnableRequestBodyTracking = true,
                EnableErrorTracking = true
            });
            services.AddHostedService<RequestLogsHostedService>();

            if (context.HostingEnvironment.IsDevelopment())
            {
                services.AddPlugin(new ProfilingFeature());
            }
        });
}

public class RequestLogsHostedService(ILogger<RequestLogsHostedService> log, IRequestLogger requestLogger) : BackgroundService
{
    protected override async Task ExecuteAsync(CancellationToken stoppingToken)
    {
        using var timer = new PeriodicTimer(TimeSpan.FromSeconds(3));
        if (requestLogger is IRequireAnalytics logger)
        {
            while (!stoppingToken.IsCancellationRequested && await timer.WaitForNextTickAsync(stoppingToken))
            {
                await logger.TickAsync(log, stoppingToken);
            }
        }
    }
}
