class EventsManager {
    _server;
    _clients = {};
    _events = {
        onLogin: null,
        onRegister: null,
        isLogged: null,
    };
    _debug = false;

    setServer(server) { this._server = server; }
    getServer() { return this._server; }
    getEvents() { return this._events; }

    constructor(server) {
        this._server = server;

        this.loadEvents();
    }

    clientConnected(client) {
        if (this._debug) console.log('Client Connected :', client.id);
        this._clients[client.id] = client;


        for (var e in this.getEvents()) {
            let event = this.getEvents()[e];
            client.on(event.getName(), (...args) => event.call(client, ...args));
        }
    }

    clientDisconnected(client) {
        if (this._debug) console.log('Client Disconnected :', client.id);
        delete this._clients[client.id];
    }

    loadEvents() {
        for (const event in this.getEvents()) {
            let eventPath = './Events/' + event;

            if (this._events[event] == undefined || this._events[event] == null) {
                this._events[event] = this.createEvent(eventPath);
            } else {
                if (this._debug) console.log('@[[Add New Event]]', eventPath, ">>", this._events[event].getName());
            }

            if (this._debug) console.log("@[[Loading event]]", eventPath, ">>", this._events[event].getName());
        }
    }

    /**
     * Get Event
     * @param {string} name 
     */
    get(name) {
        return this.getEvents()[name];
    }
    add(name, path) {
        this.set(name, this.createEvent(path));
        return this;
    }
    set(name, instance) {
        this._events[name] = instance;
        this.loadEvents();
        return this;
    }

    createEvent(path) {
        let event = require(path).event;
        return new event(this.getServer());
    }
}


module.exports = {
    EventsManager: EventsManager
}