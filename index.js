#!/usr/local/bin/node

var projectPath = "";
var projectName = "";
var projectAuthor = "";
var projectMobileReverseDomain = "";

console.log("create-fullstack-app\n");

var exec = require('child_process').execSync;
const process = require('process');
var path = require('path');
var fs = require('fs');
var chalk = require('chalk');
var printStatus = require('./utils/print').printStatus;
var commandExists = require('command-exists').sync;
var prompt = require('prompt-sync')();
const replace = require('replace-in-file');
var failed = false;
var args = process.argv.slice(2);

if (args.length === 0 || args[0] === "." || args[0] === "./") {
    projectPath = path.join(__dirname, "/");
    projectName = path.basename(projectPath);
    if (!/^[a-z_]+$/.test(projectName)) {
        console.log(chalk.red(`${projectName} is not an valid project name! Only lowercase letters and _ are allowed!`));
        return 1;
    }
} else {
    projectName = args[0];
    if (!/^[a-z_]+$/.test(projectName)) {
        console.log(chalk.red(`${projectName} is not an valid project name! Only lowercase letters and _ are allowed!`));
        return 1;
    }
    projectPath = path.join(__dirname, args[0]);
    projectPath = path.join(projectPath, "/");
    if (!fs.existsSync(projectPath)) {
        fs.mkdirSync(projectPath);
    }
}
if (fs.readdirSync(projectPath).length !== 0) {
    console.log(chalk.red(`${projectPath} is not an empty directory!`));
    return 1;
}

projectAuthor = prompt("Author: ");
projectMobileReverseDomain = prompt("Mobile Reverse Domain (ex: com.example): ");
if (!/^[a-z.]+$/.test(projectMobileReverseDomain) || projectMobileReverseDomain === "") {
    console.log(chalk.red(`${projectName} is not an valid reverse domain! ex: com.example`));
    return 1;
}

var answer = prompt("Do you have dotnet, flutter, make, docker and nodejs installed? y/n: ");
if (answer.toUpperCase() !== "Y") {
    console.log("Please install dotnet, flutter, make, docker and nodejs!")
    return 1;
}

console.log();
// Checking prerequisites
printStatus("Checking prerequisites", "started");
if (!commandExists('dotnet')) {
    console.log(chalk.red("dotnet missing in PATH, please install dotnet sdk: https://dotnet.microsoft.com/download/dotnet-core/3.1"))
    failed = true;
}
if (!commandExists('flutter')) {
    console.log(chalk.red("flutter missing in PATH, please install flutter sdk: https://flutter.dev/docs/get-started/install"))
    failed = true;
}
if (!commandExists('make')) {
    console.log(chalk.red("make missing in PATH"))
    failed = true;
}
if (!commandExists('docker')) {
    console.log(chalk.red("docker missing in PATH"))
    failed = true;
}
if (failed) {
    return 1;
} else {
    console.log("All good!");
}
printStatus("Checking prerequisites", "complete");

console.log();
// Creating project
printStatus("Creating project", "started");

exec(`cp -a ./templates/. ${projectPath}`);

const listDir = (dir, fileList = []) => {

    let files = fs.readdirSync(dir);

    files.forEach(file => {
        if (fs.statSync(path.join(dir, file)).isDirectory()) {
            fileList = listDir(path.join(dir, file), fileList);
        }
        if (/____template_placeholder____/.test(file)) {
            let name = file.replace("____template_placeholder____", projectName);
            let src = path.join(dir, file);
            let newSrc = path.join(dir, name);
            fileList.push({
                oldSrc: src,
                newSrc: newSrc
            });
        }
        if (/____templatePlaceholderMRDExtension____/.test(file)) {
            let name = file.replace("____templatePlaceholderMRDExtension____", projectMobileReverseDomain.split(".")[0]);
            let src = path.join(dir, file);
            let newSrc = path.join(dir, name);
            fileList.push({
                oldSrc: src,
                newSrc: newSrc
            });
        }
        if (/____templatePlaceholderMRDName____/.test(file)) {
            let name = file.replace("____templatePlaceholderMRDName____", projectMobileReverseDomain.split(".")[1]);
            let src = path.join(dir, file);
            let newSrc = path.join(dir, name);
            fileList.push({
                oldSrc: src,
                newSrc: newSrc
            });
        }
    });

    return fileList;
};

let foundFiles = listDir(projectPath);
foundFiles.forEach(f => {
    fs.renameSync(f.oldSrc, f.newSrc);
    console.log("Created: " + f.newSrc);
});

const listDirReplaceText = (dir, fileList = []) => {

    let files = fs.readdirSync(dir);

    files.forEach(file => {
        if (fs.statSync(path.join(dir, file)).isDirectory()) {
            fileList = listDirReplaceText(path.join(dir, file), fileList);
        } else {
            fileList.push(path.join(dir, file));
        }
    });

    return fileList;
};
let foundFilesReplaceText = listDirReplaceText(projectPath);

function _snake2Pascal(str) {
    str += '';
    str = str.split('_');
    for (var i = 1; i < str.length; i++) {
        str[i] = str[i].slice(0, 1).toUpperCase() + str[i].slice(1, str[i].length);
    }
    return str.join('');
}

foundFilesReplaceText.forEach(f => {
    const options = {
        files: f,
        from: /____template_placeholder____/g,
        to: projectName,
    };
    const options2 = {
        files: f,
        from: /____template-placeholder____/g,
        to: projectName.replace("_", "-"),
    };
    const options3 = {
        files: f,
        from: /____templatePlaceholder____/g,
        to: _snake2Pascal(projectName)
    };
    const options4 = {
        files: f,
        from: /____templatePlaceholderMobileReverseDomain____/g,
        to: projectMobileReverseDomain,
    };
    try {
        let results = replace.sync(options);
        if (results[0].hasChanged)
            console.log("Configured: " + f);
        results = replace.sync(options2);
        if (results[0].hasChanged)
            console.log("Configured: " + f);
        results = replace.sync(options3);
        if (results[0].hasChanged)
            console.log("Configured: " + f);
        results = replace.sync(options4);
        if (results[0].hasChanged)
            console.log("Configured: " + f);
    }
    catch (error) {
        console.error('Error occurred:', error);
    }
});

fs.writeFileSync(path.join(projectPath, "deployment/.env"), "", function (err) {
    if (err) throw err;
    console.log("Created: " + path.join(projectPath, "deployment/.env"));
});

printStatus("Creating project", "complete");

console.log();
// Setup
printStatus("Setup", "started");
console.log("Executing setup.sh ...");
exec(`cd ${projectPath} && ./setup.sh`);
printStatus("Setup", "complete");
console.log("To run backend: cd " + projectName + "/deployment && make");
console.log("Frontends available in " + projectName + "/frontend");
