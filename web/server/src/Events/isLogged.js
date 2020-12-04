const Event = require('./Event');


class eventClass extends Event {
    _name = "auth";

    call(client, args) {
        console.log('Is Logged :: Event Called ', client.id, args);
        let session = this.getServer()
            .getProvider()
            .get('auth')
            .getSession(client, args);

        client.emit(
            // send event back
            this.getName(),
            // send if user is logged or not
            session ? session.toJson() : { error: 'Please login !' }
        );
    }
}

module.exports.event = eventClass;
