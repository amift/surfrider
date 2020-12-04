const { comparePassword } = require('../functions');
const Model = require('./Model');

class User extends Model {
    _about;
    _avatar;
    _username;
    _password;
    _hashedPassword;
    _created_at = (new Date).getTime();
    _updated_at = (new Date).getTime();

    constructor(id = null) {
        super("users", id);

        this.addColumns('id', 'username', 'avatar', 'about', 'password', 'created_at', 'updated_at');
    }

    getMessage() { }
    getAvatar() { }

    getUsername() { return this._username; }
    setUsername(username) { this._username = username; return this; }
    async hashPassword() { this._password = await this.hash(this._password); return this; }
    async setHashPassword(password) { this._hashedPassword = await this.hash(password); return this; }

    async auth() {
        if (this._username == null || this._password == null)
            return false;

        let findUser = this.getDb().find(this.getName(), {
            username: this._username
        });

        if (!findUser) return false;
        findUser = (new User).bind(findUser);

        let isSameUser = await comparePassword(this._password, findUser._password);

        return isSameUser ? findUser : false;
    }
}

module.exports = User;