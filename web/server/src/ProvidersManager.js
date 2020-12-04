const Provider = require('./Providers/Provider');

class ProvidersManager {
    _server;
    _events = {};
    _providers = {};
    _debug = false;


    setServer(server) { this._server = server; }
    getServer() { return this._server; }
    getProviders() { return this._providers; }

    constructor(server) {
        this._server = server;

        this.loadProviders();
    }

    onInit() {
        for (const p in this.getProviders())
            this.getProviders()[p].onInit();
    }

    onStart() {
        for (const p in this.getProviders())
            this.getProviders()[p].onStart();
    }

    loadProviders() {
        for (const provider in this.getProviders()) {
            let providerPath = './providers/' + provider;

            if (this._providers[provider] == undefined || this._providers[provider] == null) {
                this._providers[provider] = this.createProvider(providerPath);
            } else {
                if (this._debug) console.log('@[[Add New Provider]]', providerPath, ">>", this._providers[provider].getName());
            }


            if (this._debug) console.log("@[[Loading provider]]", providerPath, ">>", this._providers[provider].getName());
        }
    }

    /**
     * Get Provider
     * @param {string} name 
     */
    get(name) {
        return this.getProviders()[name];
    }
    add(name, path) {
        this.set(name, this.createProvider(path));
        return this;
    }
    set(name, instance) {
        this._providers[name] = instance;
        this.loadProviders();
        return this;
    }

    createProvider(path) {
        let provider = require(path).provider;
        return new provider(this.getServer());
    }
}


module.exports = {
    ProvidersManager: ProvidersManager
}