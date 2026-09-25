using System.Collections.Generic;
using OpenTelemetry.Metrics;
using OpenTelemetry.Resources;
using OpenTelemetry.Trace;
using ServiceStack;
using ServiceStack.Jobs;
using ServiceStack.Messaging;
using ServiceStack.Telemetry;

[assembly: HostingStartup(typeof(MyApp.ConfigureProfiling))]

namespace MyApp;

public class ConfigureProfiling : IHostingStartup
{
    public void Configure(IWebHostBuilder builder) => builder
        .ConfigureServices((context, services) => {
            services.AddOpenTelemetry()
                .ConfigureResource(resource => resource
                    .AddService(context.Configuration["OTEL_SERVICE_NAME"] ?? context.HostingEnvironment.ApplicationName,
                        serviceVersion: typeof(ConfigureProfiling).Assembly.GetName().Version?.ToString())
                    .AddAttributes(new Dictionary<string, object> {
                        ["deployment.environment.name"] = context.HostingEnvironment.EnvironmentName,
                    }))
                .WithTracing(tracing => tracing
                    .AddAspNetCoreInstrumentation()
                    .AddHttpClientInstrumentation()
                    .AddSource(OperationDiagnostics.Name, MessagingDiagnostics.Name, JobsDiagnostics.Name)
                    .AddOtlpExporter())
                .WithMetrics(metrics => metrics
                    .AddAspNetCoreInstrumentation()
                    .AddMeter(OperationDiagnostics.Name, MessagingDiagnostics.Name, JobsDiagnostics.Name)
                    .AddOtlpExporter());

            if (context.HostingEnvironment.IsDevelopment())
            {
                services.AddPlugin(new ProfilingFeature
                {
                    IncludeStackTrace = true,
                    ExternalTraceUrlTemplate = context.Configuration["OTEL_TRACE_URL_TEMPLATE"],
                });
            }
        });
}
