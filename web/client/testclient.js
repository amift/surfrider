const { io } = require("socket.io-client");
require('colors');

let socket,
    events = ['auth', 'login', 'register', 'update', 'message', 'init', 'contacts', 'contact', 'privatemsg', 'alert'];

const readline = require("readline");
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

var cls = console.clear;
var logger = console.log;


console.log = (...args) => {
    logger([...args].join(''));
    logger('# '.green);
}

var cn = () => {
    socket = io.connect('ws://87.88.234.166:80');

    events.forEach(event => {
        socket.on(event, (...data) => {
            console.log('Event::'.yellow, event.green, '::'.yellow, '\n', JSON.stringify(...data));
        });
    })
}

cn();

var askCode = () => {
    console.log('\n\n');
    rl.question("# ".green, function (code) {
        try {
            eval(code);
        } catch (e) {
            console.log("catch>erro>>".red, "\n", e.message.blue);
        }

        askCode();
    });
}

askCode();

rl.on("close", function () {
    console.log("\nBYE BYE !!!");
    process.exit(0);
});