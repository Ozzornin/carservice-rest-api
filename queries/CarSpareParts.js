const { QueryTypes} = require('sequelize');
const { sequelize } = require("../models");

module.exports = {
    table: "carspareparts",

    add: async function(params)
    {
        try{
            return await sequelize.query("call AddCarSparePart(:name, :price, :partNumber)",{
                replacements: {
                    name: params.name,
                    price: params.price,
                    partNumber: params.partNumber
                }
            });
        } catch(e)
        {
            console.log(e);
            throw new Error(e.original.sqlMessage);
        }
    },
    delete: async function(id)
    {
        try{
            return await sequelize.query(`DELETE FROM ${this.table} where id = ${id}`);
        } catch(e)
        {
            throw new Error(e.original.sqlMessage);
        }
    },
    edit: async function(id, setParams){
        let paramsArray = [];
        
        for (let key in setParams)
        {
            if (setParams.hasOwnProperty(key))
            {
                paramsArray.push(`${key} = '${setParams[key]}'`);
            }
        }
        setParams = paramsArray.join(', ');
        try{
            await sequelize.query(`UPDATE ${this.table} SET ${setParams} where id = ${id}`);
            return await sequelize.query(`SELECT * FROM ${this.table} where id = ${id}`,{type: QueryTypes.SELECT});
        } catch(e)
        {
            console.log(e);
            throw new Error(e.original.sqlMessage);
        }
    },
    select: async function(name)
    {
        try{
            return await sequelize.query(`SELECT * FROM ${this.table} where name Like '%${name}%' OR partNumber LIKE '%${name}%'`,{
                type: QueryTypes.SELECT
            });
        } catch(e)
        {
            console.log(e);
            throw new Error(e.original.sqlMessage);
        }
    }
}