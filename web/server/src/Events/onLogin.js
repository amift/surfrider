const Event = require('./Event');
const User = require('../Models/User');

class onLogin extends Event {
    _name = "login";

    call(client, args) {

        let session = this.getServer()
            .getProvider()
            .get('auth')
            .getSession(client, args);

        if (!!session)
            return client.emit("auth", session.toJson());

        return this.loginAction(client, args);
    }



    loginAction(client, data) {
        let userColumns = ['username', 'password'],
            user = new User();

        user.bind(data, userColumns);

        user.enableDebug()
            .setDb(this.getServer().getDb());

        user.auth().then(user => {
            if (user !== false)
                return client.emit("auth",
                    this.getServer().getProvider().get('auth').generateSession(user).toJson()
                );

            return client.emit(this.getName(), { error: "Invalide Credentials !" });
        });
    }

}

module.exports.event = onLogin;
