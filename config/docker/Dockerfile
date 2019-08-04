FROM microsoft/dotnet:2.1-aspnetcore-runtime
COPY app /app
WORKDIR /app
EXPOSE 5000/tcp
ENV ASPNETCORE_URLS https://*:5000
ENTRYPOINT ["web"]