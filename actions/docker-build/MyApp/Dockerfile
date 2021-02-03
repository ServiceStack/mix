FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS runtime
WORKDIR /app
COPY published/MyApp.dll ./
ENTRYPOINT ["dotnet", "MyApp.dll"]
