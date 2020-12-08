# create-fullstack-app [![npm](https://img.shields.io/npm/v/@finxindustries/create-fullstack-app?style=plastic)](https://www.npmjs.com/package/@finxindustries/create-fullstack-app) [![license GPL-3.0](https://img.shields.io/github/license/finxindustries/create-fullstack-app?style=plastic)](https://github.com/finxindustries/create-fullstack-app/blob/master/LICENSE)
Generate a fullstack app using GRPC, .NET Core 3.1, Node.js, Docker, Flutter and/or React.

**This is a work in progress!**

## How to use

```
$ npx @finxindustries/create-fullstack-app my_app
```
More info about your app is available at `my_app/README.md`

## Prerequisites

- **Docker**: <br/>
https://www.docker.com/products/docker-desktop

- **Make**:
<br/>macOS: `brew install make`
<br/>Ubuntu: `sudo apt-get install build-essential`
<br/>Windows: https://www.cygwin.com (select make package during installation)

- **Flutter**:
<br/>https://flutter.dev/docs/get-started/install

- **.NET Core 3.1**:
<br/>https://dotnet.microsoft.com/download/dotnet-core/3.1

- **Node.js**:
<br/>https://nodejs.org/en/

## Services structure

```
backend
│
└───service_api_gateway
│   │   .NET Core 3.1 Api Gateway Service
│   │   Available at: http://localhost:6080
│
└───service_api_gateway_grpc_web
│   │   .NET Core 3.1 Api Gateway Grpc Web Service
│   │   Available at: http://localhost:6081
│
└───service_authentication_user
│   │   .NET Core 3.1 Authentication User Service
│   │   Internal port: 7082
│
└───service_email
│   │   Node.js Email Service
│   │   Internal port: 7083
│
└───service_user
    │   .NET Core 3.1 User Service
    │   Internal port: 7080
    │   MySQL DB
```
