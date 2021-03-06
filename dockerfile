FROM node:14-alpine as builder-client

WORKDIR /build

ADD ./client ./

RUN echo " --- Building Client --- " \
 && yarn install --frozen-lockfile \
 && yarn build

# ============================================================
FROM mcr.microsoft.com/dotnet/core/sdk:3.1-alpine AS builder-server

WORKDIR /src

ADD ./server/App ./

RUN dotnet restore \
&& dotnet publish -c Release -o /dist

# ============================================================
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-alpine AS runner

ARG BASE_DIR=/workspace/www/billyCDK

WORKDIR ${BASE_DIR}

COPY --from=builder-server /dist .
COPY --from=builder-client /build/build ./wwwroot/

VOLUME ${BASE_DIR}"/appsettings.yaml"
VOLUME ${BASE_DIR}"/secrets.yaml"

ENTRYPOINT ["dotnet", "BillyCDK.dll"]