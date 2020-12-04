#!/usr/local/bin/node

console.log("create-fullstack-app");

var exec = require('child_process').execSync;
var chalk = require('chalk');
var yargs = require("yargs").argv;
var path = require('path');
var fs = require('fs');

const printStatus = (parent, status, separator) => {
    let line = "________________________________";
    console.log(chalk.grey(line.replace("_", separator)));
    console.log(chalk.grey('${parent}: ${status}'));
    console.log(chalk.grey(line.replace("_", separator)));
};

printStatus("Setup", "started");
// 
printStatus("Setup", "complete");
console.log();
