const { QueryTypes, ExclusionConstraintError} = require('sequelize');
const { sequelize } = require("../models");
const bcrypt = require("../utils/bcrypt");
module.exports = Workers = {

    table: "workers",

    add: async function (params){
        try{
            const resp = await sequelize.query("call AddWorker(:name, :surname, :login, :password, :roleId)",{
                replacements:{
                    name: params.name,
                    surname: params.surname,
                    login: params.login,
                    password: await bcrypt.createPassword(params.password),
                    roleId: params.roleId
                }
                        })
            console.log(resp);
            return resp;
        } catch(e){
            console.log(e);
             throw new Error(e.original.sqlMessage);
        }        
    },

    remove: async function(params){
        try{
            const resp = await sequelize.query("call DeleteWorkerByLogin(:login)", {
                replacements:{
                    login: params.login
                }
            });
            console.log(resp);
            return resp;
        }catch(e)
        {
            console.log(e);
            throw new Error(e.original.sqlMessage);
        }
    },
    
    getPasswordByLogin: async function(params){
        try{
            const resp = await sequelize.query("SELECT password FROM workers WHERE login = :login",{
                replacements: {
                    login: params.login
                },
                type: sequelize.QueryTypes.SELECT
            });      
            return resp[0]?.password;
        } catch(e)
        {
            console.log(e);
            throw new Error(e.original.sqlMessage);
        }
    },

    getRoleByLogin: async function(login){
        try{
            const resp = await sequelize.query("call GetUserRoleByLogin(:login)", {
                replacements:{
                    login: login
                }
            })
            return resp[0].role;
        } catch(e)
        {
            console.log(e);
            throw new Error(e.original.sqlMessage);
        }
    }

}