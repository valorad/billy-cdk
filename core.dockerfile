FROM mcr.microsoft.com/dotnet/core/sdk:3.1-alpine AS builder

WORKDIR /src

ADD ./server/App ./

RUN dotnet restore \
&& dotnet publish -c Release -o /dist

# ============================================================
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-alpine AS runner

ARG BASE_DIR=/workspace/www/billyCDK

WORKDIR ${BASE_DIR}

COPY --from=builder /dist .

VOLUME ${BASE_DIR}"/appsettings.yaml"
VOLUME ${BASE_DIR}"/secrets.yaml"

ENTRYPOINT ["dotnet", "BillyCDK.dll"]