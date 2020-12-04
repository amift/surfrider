const Provider = require('./Provider');
const User = require('../Models/Session');
const Session = require('../Models/Session');


class providerClass extends Provider {
    _name = "auth";
    _authed = {};
    _banned = {};


    onStart(...args) {
        this._authed = {};
    }

    getSession(client, data = {}) {
        let db = this.getServer().getDb(),
            sessionData = db.find('sessions', {
                token: data.token
            });
        return sessionData ? new Session().setDb(db).bind(sessionData) : false;
    }

    generateSession(user) {
        let session = new Session(),
            today = (new Date()).getTime();

        session.bind({
            userid: user.getId(),
            created_at: today,
            expired_at: today + 60 * 60 * 24 * 15,
        });

        session.enableDebug()
            .setDb(this.getServer().getDb())
            .updateOrInsert({
                userid: user.getId()
            });

        return session;
    }

    isLogged(client) {
        return !!this.getSession(client);
    }
}

module.exports.provider = providerClass;
