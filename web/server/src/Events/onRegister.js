const validator = require('validator');

const User = require('../Models/User');
const Event = require('./Event');


class onRegister extends Event {
    _name = "register";

    call(client, args) {
        let session = this.getServer()
            .getProvider()
            .get('auth')
            .getSession(client, args);

        if (!!session)
            return client.emit("auth", session.toJson());

        return this.registerAction(client, args);
    }

    registerAction(client, data) {
        let userColumns = ['username', 'password'],
            user = new User();

        user.bind(data, userColumns);

        if (!validator.matches(user._username, /^[a-zA-Z0-9]([._-](?![._-])|[a-zA-Z0-9]){0,18}[a-zA-Z0-9]$/)) {
            return client.emit(this.getName(), { error: "Username is not valid ! " });
        }
        let db = this.getServer()
            .getDb();
        let dbuser = db
            .find('users', {
                username: user._username
            });

        if (!!dbuser)
            return client.emit(this.getName(), { error: "Username already used ! " });

        return user.enableDebug()
            .setDb(db)
            .hashPassword()
            .then(r => {
                user.save();
                return client.emit("auth",
                    this.getServer().getProvider().get('auth').generateSession(user).toJson()
                );
            });
    }

}


module.exports.event = onRegister;