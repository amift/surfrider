const { v4: randomUUID } = require('uuid');

const bcrypt = require('bcrypt');

async function comparePassword(password, hashedPassword) { // updated

    let newpassword = String(password).toString();
    hashedPassword = String(hashedPassword).toString();

    return await bcrypt.compare(newpassword, hashedPassword); // updated
}

async function hashPassword(password) {
    password = String(password).toString();
    return await bcrypt.hash(password, await bcrypt.genSaltSync(10));
}

module.exports = {
    comparePassword: comparePassword,
    hashPassword: hashPassword,
    randomUUID: randomUUID
}
