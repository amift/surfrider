class DatabaseAdapter {
    _adapter;
    _dbstruct = {};

    constructor(dbstruct) {
        this._dbstruct = dbstruct;
    }

    insert(table, data) {
        console.log(`Insert to table '${table}' data : "${JSON.stringify(data)}"`);
    }
    delete(table, where) {
        console.log(`Delte from table '${table}' where : "${JSON.stringify(where)}"`);
    }
    find(table, where) {
        console.log(`Select from table '${table}' where : "${JSON.stringify(where)}"`);
    }
    update(table, where, data) {
        console.log(`Update in table '${table}' where: "${JSON.stringify(where)}" set:"${JSON.stringify(data)}"`);
    }
    updateOrInsert(table, where, data) {
        if (!this.find(table, where))
            return this.insert(table, data);

        return this.update(table, where, data);
    }

    init() {
        console.log('Initing Database ...');
    }


    getStructDefault() {
        return this._dbstruct;
    }
}


module.exports = {
    DatabaseAdapter: DatabaseAdapter
}