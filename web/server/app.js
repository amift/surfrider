const { AppServer } = require('./src/AppServer');
const { SimpleJsonDb } = require('./src/Adapters/SimpleJsonDb');

const server = new AppServer("0.0.0.0", 80);

server.setDb(
    new SimpleJsonDb({ sessions: [], users: [], messsages: {}, contacts: [] }, 'data/data.json')
);

server.run((info) => {
    console.log('Server Started at ', info.getIp(), info.getPort());
    server.startEvents((client) => {
        console.log('Client Connected ! ', client.id);
    });

    server.getProvider().add('auth', './Providers/Auth');
});
