const { EventsManager } = require('./EventsManager');
const { ProvidersManager } = require('./ProvidersManager');
const { DatabaseAdapter } = require('./Adapters/DatabaseAdapter');
const { Server } = require('socket.io');

class AppServer {
    _db;
    _ip;
    _port;
    _http;
    _socket;
    _event;
    _provider = {};

    _usehttp = false;

    constructor(ip = "localhost", port = 3030) {
        this._ip = ip;
        this._port = port;
        this._db = new DatabaseAdapter({ users: {}, messages: {}, contacts: [] });
        this._event = new EventsManager(this);
        this._provider = new ProvidersManager(this);
    }

    onInit() {
        this._provider.onInit();
    }

    onStart() {
        this._provider.onStart();
    }

    /**
     * Getters
     */
    getDb() { return this._db; }
    getIp() { return this._ip; }
    getPort() { return this._port; }
    getSocket() { return this._socket; }
    getHttpServer() { return this._http; }
    getProvider() { return this._provider; }
    getEventManager() { return this._event; }
    /**
     * Setters ( server / socket )
     */
    setSocket(socket) {
        this._socket = socket;
        return this;
    }
    setHttpServer(server) {
        this._http = server;
        return this;
    }
    setDb(db) {
        this._db = db;
    }

    createSocket() {
        this.setSocket(new Server());

        if (this._usehttp) {
            // Http create
            this.setHttpServer(require('http').createServer());

            // Create Socket && Attach Http
            this.getSocket()
                .attach(this.getHttpServer(), { cors: { origin: '*' } });
        }

        return this;
    }

    run(cb = () => console.log('Server is running ...')) {
        this.createSocket();

        if (this._usehttp) {
            this.getHttpServer().listen(this.getPort(), this.getIp());

            this.getSocket().listen(this.getHttpServer(), cb(this));
        }
        else
            this.getSocket().listen(this._port, cb(this));

        this.onStart();
    }

    startEvents(cbClientConnected = () => { }) {
        this.getSocket().on('connection', client => {
            this.getEventManager().clientConnected(client);
            cbClientConnected(client);

            client.on('disconnect',
                () => this.getEventManager().clientDisconnected(client)
            );
        });
    }

}

module.exports = {
    AppServer: AppServer
}