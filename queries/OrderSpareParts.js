const { QueryTypes} = require('sequelize');
const { sequelize } = require("../models");

module.exports = {
    table: "orderspareparts",
    add: async function(login,orderId, partId, amount)
    {
        try{
            return await sequelize.query("call insert_order_spare_part(:login,:orderId, :partId, :quantity)", {
                replacements:{
                    login: login,
                    orderId: orderId,
                    partId: partId,
                    quantity: amount
                }
            })
        } catch(e)
        {
            throw new Error(e.original.sqlMessage);
        }
    },

    getOrderParts: async function(orderId){
        try{
            return await sequelize.query(`call getOrderSpareParts(${orderId})`, {type: QueryTypes.SELECT});
        } catch(e)
        {
            throw new Error(e.original.sqlMessage);
        }
    },
    getTopUsedSpareParts: async function()
    {
        try{
            return await sequelize.query("call GetTopUsedSpareParts()");
        } catch(e)
        {
            throw new Error(e.original.sqlMessage);
        }
    } 
}