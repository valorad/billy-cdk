# billy-cdk

[![Docker pulls](https://img.shields.io/docker/pulls/valorad/billy-cdk.svg?style=flat-square)](https://hub.docker.com/r/valorad/billy-cdk/)
[![Image version](https://images.microbadger.com/badges/version/valorad/billy-cdk.svg)](https://microbadger.com/images/valorad/billy-cdk "billy-cdk Version")
[![Image Info](https://images.microbadger.com/badges/image/valorad/billy-cdk.svg)](https://microbadger.com/images/valorad/billy-cdk "billy-cdk Image")

[![CircleCI](https://circleci.com/gh/valorad/billy-cdk/tree/circleci-project-setup.svg?style=svg)](https://circleci.com/gh/valorad/billy-cdk)


BillyCDK Remastered Edition. Manage CDKey inventory and more. Featuring C#, TypeScript, GraphQL, React-Redux and more.

## Demo

A demo has been uploaded to [Bilibili](https://www.bilibili.com/video/BV1uD4y1D7cf/) and [Youtube](https://youtu.be/SDYstk_ewAU).

## Features
Currently, you are automatically logged in as Billy, a super admin. The user info will be saved in the redux store after a successful log-in.

![Cover](https://i.imgur.com/MPgWouv.png)

### How to navigate

The UI of BillyCDK is inspired by the Fallout 4 terminal.

You can click the menu items with mouse clicking or by tapping, just like browsing a normal website.

Also, since this is designed as a terminal interface, you can try navigating with your keyboard. Try selecting a menu with arrow keys, press "Enter" to go into a menu, or press "ESC" to go back. Besides, you can always press the "Home" key to go back to the main menu. Currently, to focus different items in a form interface (e.g. Add a new game window), you need to press the "Tab" key to switch your input focus.

### Buy games from the store
![Buygames](https://i.imgur.com/H00qLg6.png)

### View the player list
![ViewPlayers](https://i.imgur.com/zo4qwFN.png)

### Manage the CDKeys
![ManageCDKeys](https://i.imgur.com/43QQaet.png)

### Manage players
![ManagePlayers](https://i.imgur.com/UN6krEA.png)
Admins can manage the players. They can help to register a new player, edit the information of an existing player, or delete a player. 

### Manage store games
![ManageStoreGames](https://i.imgur.com/CT1r1ad.png)
Admins have the privilege to manage the store. They can publish a new game, edit the details of the existing games, or delete a game.

### Issue CDKeys for games
![IssueCDKeys](https://i.imgur.com/Ta0g5tI.png)
Admin can issue CDKeys for a certain game. To to that, you need a CDKey value prepared in advance.

## Todo

Server:
- ✔ CDKey Management (add, get, update, remove)
- User authorization (player sign-up, login)
- Premium Examination
- ❌ Platform management (restart, download, delete)

Client:
- UI ✔
- i18n

## Class diagram for CDK inventory
![billy-cdk-class](https://i.imgur.com/CzKKRgY.png)

## Deployment

### Preparations

- A working MongoDB: [Set up via docker](https://gist.github.com/valorad/40bd4dad5fc94adf03f3451868634213) or [install one manually](https://docs.mongodb.com/manual/installation/).

- `secrets.yaml` for DB connection configs.

- `appsettings.yaml` for appliaction settings.

  - Set a `basePath` if the server is behind a reverse-proxy (e.g. Nginx, Kubernetes)

  - Do remember to specify the Kestrel Url in `appsettings.yaml`, otherwise, you cannot access the server! Refer to `server/App/appsettings.Development.yaml` for hints or refer to section [ListenOptions.UseHttps](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/servers/kestrel?view=aspnetcore-3.1#listenoptionsusehttps) on article "Kestrel web server implementation in ASP.NET Core".

### Docker

Run:

``` bash
docker run -d \
--network my-vps-main-network \
--name billy-cdk-c1 \
-v /path/2/appsettings.yaml:/workspace/www/billyCDK/appsettings.yaml \
-v /path/2/secrets.yaml:/workspace/www/billyCDK/secrets.yaml \
valorad/billy-cdk:latest
```

### Manually

- Install [.NET Core Runtime](https://dotnet.microsoft.com/download/dotnet-core) ^3.1.0

- Download the release version, extract files, and locate the directory.

- Create your own `appsettings.yaml` and `secrets.yaml` in that directory.

- Run:

  ``` bash
  dotnet BillyCDK.dll
  ```

## Links to git submodule of this repo

Github has a problem accessing the git submodule with relative paths. You can access them from the links below.

- [billy-cdk-server](https://github.com/valorad/billy-cdk-server)

- [billy-cdk-client](https://github.com/valorad/billy-cdk-client)


## Original version
The [original version](https://github.com/valorad/C_cc/blob/master/BillyCDK%20x64.C) was developed in 2014 as a personal project after finishing the C programming course.