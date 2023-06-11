const bcrypt = require("bcrypt");

module.exports = mybcrypt = {
    createPassword: async function(password){
        return await bcrypt.hash(password, 8);
    },
    comparePassword: async function(reqPassword, basePassword){
        return bcrypt.compareSync(reqPassword, basePassword);
    }
}