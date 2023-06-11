const { QueryTypes, ValidationErrorItem, where} = require('sequelize');
const { sequelize } = require("../models");
const { table } = require('./Workers');

module.exports = Clients = {

    table: "clients",
    //returns client if client is created
    add: async function (params)
    {
        try{
            await sequelize.query(`INSERT INTO ${this.table} (name,surname,phoneNumber,email,address)`+
            "VALUES (:name, :surname, :phoneNumber, :email, :address)",{
            replacements: {
                name: params.name,
                surname: params.surname,
                phoneNumber: params.phoneNumber,
                email: params.email,
                address: params.address
            },
            type: QueryTypes.INSERT
          });
          const response = await sequelize.query(`Select * from ${this.table} where phoneNumber = :phoneNumber`,{
            replacements:{
                phoneNumber: params.phoneNumber
            }
          })    
          return response[0];
          
        }
        catch(e)
        {
            throw new Error(e.original.sqlMessage);
        }
    },

    //returns count of edited rows
    edit: async function(id,params)
    {
        let paramsArray = [];
        
        for (let key in params)
        {
            if (params.hasOwnProperty(key))
            {
                paramsArray.push(`${key} = '${params[key]}'`);
            }
        }
        const setParams = paramsArray.join(', ');
        

        try{
            let [results, metadata] = await sequelize.query(`UPDATE ${this.table} SET ${setParams} WHERE id = ${id}`, {
                type: QueryTypes.UPDATE
            })          
            if(metadata != 0)
            {
                let respon = await sequelize.query(`Select * from ${this.table} WHERE id = ${id}`,
                {type: sequelize.QueryTypes.SELECT});
                return respon;
            } 
            return metadata;

        }catch(e)
        {
            throw new Error(e.original.sqlMessage);
        }
    },

    delete: async function(id){
                
        try{
            const res = await sequelize.query(`DELETE FROM ${this.table} WHERE id = ${id}`, {
                
            })
            if(res[0].affectedRows == 0)
            {
                throw new Error("There is no such clients with these parameters");
            }       
            return res;

        }catch(e)
        {
            throw new Error(e);
        }
    },

    select: async function(params, fields)
    {
        let paramsArray = [];       
        let whereParams = '';
        
        for (let key in params)
        {
            if (params.hasOwnProperty(key))
            {
                paramsArray.push(`${key} = '${params[key]}'`);
            }
        }
        whereParams = "where " + paramsArray.join('and ');         
        paramsArray = [];
        fields?.forEach(el=> paramsArray.push(el));       
        let queryFields = paramsArray.join(', ');        
        queryFields = queryFields ? queryFields: "*";
        try{
            const resp = await sequelize.query(`SELECT ${queryFields} from ${this.table} ${whereParams}`, {type: sequelize.QueryTypes.SELECT});
            return resp;
            
        } catch (e){
            throw new Error(e.original.sqlMessage);
        }        
    },

    globalSelect: async function(params){
        try{
            const resp = await sequelize.query("call GlobalSearchClient(:param)", {
                replacements: {
                    param: params
                }
            })
            return resp;
        } catch(e)
        {
            throw new Error(e.original.sqlMessage);
        }
    }
    
    
}