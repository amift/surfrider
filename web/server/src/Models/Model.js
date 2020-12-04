const { hashPassword, randomUUID } = require('../functions');

class Model {
    _id;
    __db;
    __name = "model";
    __columns = [];
    __debug = false;

    constructor(name, id = null) {
        // set table name 
        this.__name = name;

        // init an id for each row create ( uuid to prevent same id )
        if (!id)
            this.randId();
    }

    // getters
    getId() { return this._id; }
    getName() { return this.__name; }
    hasDb() { return this.__db != undefined && this.__db != null; }
    getDb() {
        if (!this.hasDb())
            throw 'Database does not exist in model:' + this.getName() + ', db:' + this.__db;
        return this.__db;
    }
    // setters
    setId(id) { this._id = id; return this; }
    setName(name) { this.__name = name; return this; }
    setDb(db) { this.__db = db; return this; }
    enableDebug() { this.__debug = true; return this; }
    disableDebug() { this.__debug = false; return this; }
    addColumns(...args) {
        [...args].forEach((key) => this.__columns.push(key));
        return this;
    }
    // bind data to columns
    bind(data = {}, fields = []) {
        Object.keys(data).forEach((key) => {
            if (fields === null || fields.length === 0 || fields.includes(key))
                this['_' + key] = data[key];
        });
        return this;
    }
    // get orm data
    toORM() {
        return { row: this.toObject(), table: this.getName() };
    }

    // save to this.getDb()
    save() {
        let orm = this.toORM();
        if (this.__debug)
            console.log(orm.table, orm.row);

        return this.getDb().insert(orm.table, orm.row);
    }
    // update
    update(where) {
        let orm = this.toORM();
        return this.getDb().update(orm.table, where, orm.row);
    }
    // update
    updateOrInsert(where) {
        let orm = this.toORM();
        return this.getDb().updateOrInsert(orm.table, where, orm.row);
    }

    // magic methods lol
    toObject(fields = []) {
        let obj = {};

        (fields.length > 0 ? fields : this.__columns).forEach(key => {
            obj[key] = this['_' + key] ? this['_' + key] : null;
        });

        return obj;
    }
    toJson(fields = []) {
        return this.toObject(fields);
    }

    // random id
    randId() { this._id = randomUUID(); return this; }

    // utils
    async hash(data) {
        return await hashPassword(data);
    }
}


module.exports = Model;