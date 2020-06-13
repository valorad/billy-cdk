# billy-cdk

[![Docker pulls](https://img.shields.io/docker/pulls/valorad/billy-cdk.svg?style=flat-square)](https://hub.docker.com/r/valorad/billy-cdk/)
[![Image version](https://images.microbadger.com/badges/version/valorad/billy-cdk.svg)](https://microbadger.com/images/valorad/billy-cdk "billy-cdk Version")
[![Image Info](https://images.microbadger.com/badges/image/valorad/billy-cdk.svg)](https://microbadger.com/images/valorad/billy-cdk "billy-cdk Image")

BillyCDK Remastered Edition. Manage CDKey inventory and more. Featuring GraphQL.

## Todo

Server:
- ✔ CDKey Management (add, get, update, remove)
- User authorization (player sign-up, login)
- Premium Examination
- ❌ Platform management (restart, download, delete)

Client:
- UI

## Class diagram for CDK inventory
![billy-cdk-class](https://i.imgur.com/CzKKRgY.png)

## Deployment

### Preparations

- A working MongoDB: [Set up via docker](https://gist.github.com/valorad/40bd4dad5fc94adf03f3451868634213) or [install one manually](https://docs.mongodb.com/manual/installation/).

- `secrets.yaml` for DB connection configs.

- `appsettings.yaml` for appliaction settings.

  Note: Do remember to specify the Kestrel Url in `appsettings.yaml`, otherwise, you cannot access the server! Refer to `server/App/appsettings.Development.yaml` for hints or refer to section [ListenOptions.UseHttps](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/servers/kestrel?view=aspnetcore-3.1#listenoptionsusehttps) on article "Kestrel web server implementation in ASP.NET Core".

### Docker

Run:

``` bash
docker run -d \
--network my-vps-main-network \
--name billy-cdk-c1 \
-v /path/2/appsettings.yaml:/www/billyCDK/appsettings.yaml \
-v /path/2/secrets.yaml:/www/billyCDK/secrets.yaml \
valorad/billy-cdk:latest
```

### Manually

- Install [.NET Core Runtime](https://dotnet.microsoft.com/download/dotnet-core) ^3.1.0

- Download the release version, extract files, and locate the directory.

- Run:

  ``` bash
  dotnet BillyCDK.dll
  ```


## Links to git submodule of this repo

Github has a problem accessing the git submodule with relative paths. You can access them from the links below.

- [billy-cdk-server](https://github.com/valorad/billy-cdk-server)

- [billy-cdk-client](https://github.com/valorad/billy-cdk-client)


## Original version
The [original version](https://github.com/valorad/C_cc/blob/master/BillyCDK%20x64.C) was developped in 2014 as a personal project after finishing C programming course.