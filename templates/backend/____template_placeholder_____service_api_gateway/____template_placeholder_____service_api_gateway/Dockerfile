FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS builder
WORKDIR /App
COPY . .
RUN dotnet restore ____template_placeholder_____service_api_gateway && \
    dotnet build ____template_placeholder_____service_api_gateway && \
    dotnet publish ____template_placeholder_____service_api_gateway -c Release

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim
WORKDIR /App
COPY --from=builder /App/____template_placeholder_____service_api_gateway/bin/Release/netcoreapp3.1/publish/ .
ENTRYPOINT ["./____template_placeholder_____service_api_gateway", "start"]
