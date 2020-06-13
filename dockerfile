FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-alpine

ARG BASE_DIR=/www/billyCDK

ADD ./server/App/bin/Release/netcoreapp3.1/publish/ ${BASE_DIR}/

VOLUME [${BASE_DIR}"/appsettings.yaml"]
VOLUME [${BASE_DIR}"/secrets.yaml"]

WORKDIR ${BASE_DIR}/

CMD ["dotnet", "BillyCDK.dll"]