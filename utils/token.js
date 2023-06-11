const jwt = require("jsonwebtoken");

module.exports = 
    async function(login)
    {
       return await jwt.sign({login: login}, "secretToken");
    }