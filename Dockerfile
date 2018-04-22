FROM microsoft/aspnetcore-build AS builder
WORKDIR ./src

COPY . .
RUN dotnet restore
RUN dotnet publish --output /app/ --configuration Release

FROM microsoft/aspnetcore
WORKDIR /app
COPY --from=builder /app .
EXPOSE 80/tcp
ENTRYPOINT ["dotnet", "DemoApp.dll"]