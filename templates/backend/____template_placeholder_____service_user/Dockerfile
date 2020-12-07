FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS builder
WORKDIR /App
COPY . .
RUN dotnet restore && \
    dotnet build && \
    dotnet publish -c Release

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim
WORKDIR /App
COPY --from=builder /App/bin/Release/netcoreapp3.1/publish/ .
ENTRYPOINT ["./____template_placeholder_____service_user", "start"]