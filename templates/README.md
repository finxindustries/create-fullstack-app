# ____template_placeholder____
Created with cfa.

## Prerequisites

This app is run using Docker, Make, Flutter, .NET Core 3.1 and Node.js.

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

Recomanded IDEs: Visual Studio and/or Visual Studio Code

- **Visual Studio**:
<br/>macOS: https://visualstudio.microsoft.com/vs/mac
<br/>Windows: https://visualstudio.microsoft.com/vs/community

- **Visual Studio Code**:
<br/>https://code.visualstudio.com/Download

Recommended Visual Studio Code extensions:
<br/>https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp
<br/>https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code
<br/>https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker
<br/>https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter
<br/>https://marketplace.visualstudio.com/items?itemName=mathiasfrohlich.Kotlin
<br/>https://marketplace.visualstudio.com/items?itemName=2gua.rainbow-brackets
<br/>https://marketplace.visualstudio.com/items?itemName=discountry.react-redux-react-router-snippets
<br/>https://marketplace.visualstudio.com/items?itemName=foxundermoon.shell-format
<br/>https://marketplace.visualstudio.com/items?itemName=wayou.vscode-todo-highlight
<br/>https://marketplace.visualstudio.com/items?itemName=basarat.god
<br/>https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.vscodeintellicode
<br/>https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons
<br/>https://marketplace.visualstudio.com/items?itemName=zxh404.vscode-proto3
<br/>https://marketplace.visualstudio.com/items?itemName=Equinusocio.vsc-material-theme

Run on first git clone:

```
$ sudo chmod +x ./setup.sh
$ sudo chmod +x ./updateProtos.sh
$ sudo chmod +x ./genProtoStubs.sh
$ ./setup.sh
```

## How to run backend

```
$ cd deployment && make
```

## Services structure

```
backend
│
└───____template_placeholder_____service_api_gateway
│   │   .NET Core 3.1 Api Gateway Service
│   │   Available at: http://localhost:6080
│
└───____template_placeholder_____service_api_gateway_grpc_web
│   │   .NET Core 3.1 Api Gateway Grpc Web Service
│   │   Available at: http://localhost:6081
│
└───____template_placeholder_____service_authentication_user
│   │   .NET Core 3.1 Authentication User Service
│   │   Internal port: 7082
│
└───____template_placeholder_____service_email
│   │   Node.js Email Service
│   │   Internal port: 7083
│
└───____template_placeholder_____service_user
    │   .NET Core 3.1 User Service
    │   Internal port: 7080
    │   MySQL DB
```