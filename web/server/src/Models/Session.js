const Model = require('./Model');
const User = require('./User');
const { randomUUID } = require('../functions');

class Session extends Model {
    _token;
    _user;
    _userid;
    _created_at;
    _expired_at;


    constructor(id = null) {
        super("sessions", id);

        this.addColumns('id', 'token', 'user', 'userid', 'created_at', 'expired_at');

        // generate an init random token
        this.generateRandomToken();
    }

    toJson(fields = []) {
        this._user = new User().bind(
            this.hasDb() ?
                this.getDb().find('users', { id: this._userid })
                : {}
        ).toJson(
            ['id', 'username', 'avatar', 'about']
        );

        return this.toObject(fields);
    }


    generateRandomToken() {
        this._token = randomUUID();
    }
}

module.exports = Session;