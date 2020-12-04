#!/usr/local/bin/node

console.log("create-fullstack-app\n");

var exec = require('child_process').execSync;
var chalk = require('chalk');
var yargs = require("yargs").argv;
var path = require('path');
var fs = require('fs');

const printStatus = (parent, status, separator = "|") => {
    const line = "________________________________".replace(/_/g, separator);
    console.log(chalk.grey(line));
    console.log(chalk.grey(`${parent}: ${status}`));
    console.log(chalk.grey(line));
};

printStatus("Setup", "started");
// 
printStatus("Setup", "complete");
console.log();
