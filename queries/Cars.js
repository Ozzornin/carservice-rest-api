const { QueryTypes} = require('sequelize');
const { sequelize } = require("../models");

module.exports = Cars = {
    table: "cars",
    add: async function(params) {
        try{
            const response = await sequelize.query(`call add_car(:brand, :model, :year, :vin, :clientId);`,{
                replacements:{
                    brand: params.brand,
                    model: params.model,
                    year: params.year,
                    vin: params.vin,
                    clientId: params.clientId
                }
            });
            return response;
        }catch(e)
        {
            throw new Error(e.original.sqlMessage);
        }
    },
    delete: async function(id){
                
        try{
            const res = await sequelize.query(`DELETE FROM ${this.table} WHERE id = ${id}`);
            if(res[0].affectedRows == 0)
            {
                throw new Error("There is no such car with this id in database");
            }       
            return res;

        }catch(e)
        {
            throw new Error(e.original.sqlMessage);
        }
    },
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
    getClientCar: async function(param)
    {
        try{
            const resp = await sequelize.query(`call SearchCarsByClientIdOrPhoneNumber(${param})`);
            return resp;
        } catch(e)
        {
            throw new Error(e.original.sqlMessage)
        }
    },
    
    globalSearch: async function(param)
    {
        try{
            const resp = await sequelize.query(`call GlobalSearchCars('${param}')`);
            return resp;
        } catch(e)
        {
            throw new Error(e.original.sqlMessage)
        }
    }

}