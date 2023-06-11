const { QueryTypes} = require('sequelize');
const { sequelize } = require("../models");

module.exports = Orders = {
    table: "orders",
    add: async function(params)
    {        
        try{
            const resp = await sequelize.query("call addOrder(:carId, :description)",
            {
                replacements:{
                    carId: params.carId,
                    description: params.description
                }
            });
            return resp;
        }catch(e)
        {
            console.log(e);
            throw new Error(e.original.slqMessage);
        }
    },

    delete: async function(id){
                
        try{
            const res = await sequelize.query(`DELETE FROM ${this.table} WHERE id = ${id}`, {
                
            })
            if(res[0].affectedRows == 0)
            {
                throw new Error("There is no such order");
            }       
            return res;

        }catch(e)
        {
            throw new Error(e.original.slqMessage);
        }
     
    },
    /*assignMechanic: async function(params)
    {
        try{
            const resp = await sequelize.query("call assign_mechanic(:orderId, :mechanicId)", {
                replacements:{
                    orderId: params.orderId,
                    mechanicId: params.mechanicId
                }
            });
            return resp;
        } catch(e)
        {
            console.log(e);
            throw new Error(e.original.slqMessage);
        }
    },*/
    globalSearch: async function(param){
        try{
            return await sequelize.query(`call GlobalSearchOrders('${param}')`);
        } catch (e){
            throw new Error(e.original.slqMessage); 
        } 
    },
    edit: async function(id, params)
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

    mechanicOrders: async function(login){
        try{
            return sequelize.query("call findMechanicOrders(:login, :current)", {
                replacements:{
                    login: login,
                    current: false
                },
                type: QueryTypes.SELECT});
        } catch (e)
        {
            throw new Error(e.original.sqlMessage);
        }
    },

    markAsDone: async function(login, id)
    {
        try{
            return await sequelize.query("call complete_order(:login, :id)", {
                replacements:{
                    login: login,
                    id: id
                }
            })
        } catch(e){
            console.log(e);
            throw new Error(e.original.slqMessage);
        }
    },

    select: async function(params)
    {
        let paramsArray = [];
        
        for (let key in params)
        {
            if (params.hasOwnProperty(key))
            {
                paramsArray.push(`${key} = '${params[key]}'`);
            }
        }
        const whereParams = paramsArray.join(', ');             
        try{
            return await sequelize.query(`SELECT * FROM ${this.table} WHERE ${whereParams}`,{type: QueryTypes.SELECT});
        } catch(e)
        {
            throw new Error(e.original.sqlMessage);
        }
    }, 
    getCarRepairStatistics: async function()
    {
        try{
            return await sequelize.query("call getCarRepairStatistics()");
        } catch(e)
        {
            throw new Error(e.original.sqlMessage);
        }
    },

    getTopMechanicByMonth: async function(){        
        try{
            return await sequelize.query("call GetTopMechanicByMonth()");
        } catch(e)
        {
            throw new Error(e.original.sqlMessage);
        }
        
    },

    calculateRevenueByMonth: async function()
    {
        try {
            return await sequelize.query("call CalculateRevenueByMonth()");
        } catch(e) {
            throw new Error(e.original.sqlMessage);
        }
    }

}

// TODO: редагування замовлення (статистику на кінець)
// додавання деталей до складу, редагування деталей, видалення деталей, вивід деталей
// роут для механіка