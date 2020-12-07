var chalk = require('chalk');

const printStatus = (parent, status, separator = "|") => {
    const line = "________________________________".replace(/_/g, separator);
    console.log(chalk.grey(line));
    console.log(chalk.cyan(`${parent}: `) + chalk.yellow(status));
    console.log(chalk.grey(line));
};

module.exports = { printStatus };
