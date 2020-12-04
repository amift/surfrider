class Provider {
    _name;
    _server;

    constructor(server) {
        this._server = server;
    }

    /**
     * Name
     */
    getName() { return this._name }
    setName(name) { this._name = name }

    /**
     * Server
     */
    getServer() { return this._server }
    setName(server) { this._server = server }


    /**
     * calls
     */
    onInit() {
        console.log('<', this.getName(), '>  Provider Called :: OnInit');
    }
    onStart() {
        console.log('<', this.getName(), '>  Provider Called :: OnStart');
    }

}


module.exports = Provider;