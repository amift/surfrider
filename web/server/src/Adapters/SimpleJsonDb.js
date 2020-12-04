const { DatabaseAdapter } = require('./DatabaseAdapter');
const low = require('lowdb');
const FileSync = require('lowdb/adapters/FileSync');

class SimpleJsonDb extends DatabaseAdapter {
    _source = './db.json';


    constructor(struct, source) {
        super(struct);
        this._source = source;


        this.init();
    }

    init() {
        this.db = low(new FileSync(this.getSource()));
        this.db.defaults(this.getStructDefault())
            .write();
    }

    insert(table, data) {
        return this.db.get(table).push(data).write();
    }
    delete(table, where) {
        return this.db.get(table).find(where).delete().write();
    }
    find(table, where) {
        return this.db
            .get(table)
            .find(where)
            .value();
    }
    update(table, where, data) {
        return this.db
            .get(table)
            .find(where)
            .assign(data)
            .write();
    }


    getSource() { return this._source; }
}


module.exports = {
    SimpleJsonDb: SimpleJsonDb
}