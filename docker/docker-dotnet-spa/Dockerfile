FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
 && apt-get install -y --no-install-recommends nodejs \
 && echo "node version: $(node --version)" \
 && echo "npm version: $(npm --version)" \
 && rm -rf /var/lib/apt/lists/*

COPY MyApp/package.json .
COPY MyApp/npm-shrinkwrap.json .

RUN npm --prefix MyApp install

COPY . .
RUN dotnet restore

WORKDIR /app/MyApp
RUN dotnet publish -c release -o /out --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
WORKDIR /app
COPY --from=build /out ./
ENTRYPOINT ["dotnet", "MyApp.dll"]