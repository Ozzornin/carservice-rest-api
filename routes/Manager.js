const express = require("express");
const router = express.Router();
const jwt = require("jsonwebtoken");
const WorkersQuery = require("../queries/Workers");
const ClientsQuery = require("../queries/Clients");
const CarsQuery = require("../queries/Cars");
const OrdersQuery = require("../queries/Orders");
const CarSpareParts = require("../queries/CarSpareParts");
const OrderSpareParts = require("../queries/OrderSpareParts");
const Orders = require("../queries/Orders");
const { sequelize } = require("../models");
router.use(express.json());

router.use(async (req,res,next)=>{
    const token = req.header("authorization").replace("Bearer ", "");
    let decoded;
    try{
        decoded = await jwt.verify(token, "secretToken");
        console.log(decoded)
        if(decoded.login == undefined)
            throw new Error();

        const role = await WorkersQuery.getRoleByLogin(decoded.login);   
        console.log(role);
        if(role != "Менеджер" && role != "Адміністратор")        
            throw new Error();        
        
        res.locals.login = decoded.login;
        next();        
    }        
    catch(e){
        res.status(403).send("Forbidden access");
    }
    
})

router.post("/addClient", async (req, res)=>{
    try{
        res.status(200).json(await ClientsQuery.add(req.body));
    } catch(e)
    {
        res.status(500).send({error: e.message});
    }
})

router.patch("/editClient", async(req, res)=>{
    try{
        res.status(200).json({affectedRows: await ClientsQuery.edit(req.body.id, req.body.set)});
    }catch(e)
    {
        res.status(500).json({error: e})
    }
})

router.delete("/deleteClient", async (req,res)=>{
    try{
        await ClientsQuery.delete(req.body);
        res.status(200).send("Deleted syccessfully")
    }catch(e)
    {
        res.status(500).json({error: e.message});
    }
});

router.get("/selectClient", async (req, res)=>{
    try{
        res.status(200).json(await ClientsQuery.select(req.body.params, req.body.fields));
    }catch(e)
    {
        res.status(500).json({error: e.message});
    }
}
);

router.get("/globalClient", async(req,res)=>{
    try{
        res.status(200).json(await ClientsQuery.globalSelect(req.body.params));
    } catch (e){
        res.status(500).json({error: e.message});
    }
})

router.post("/addCar", async(req, res)=>{
    try{
        res.status(200).json(await CarsQuery.add(req.body));
    }catch(e)
    {
        res.status(500).json({error: e.message})
    }
})

router.get("/getClientCars", async(req, res)=>{
    try{
        res.status(200).json(await CarsQuery.getClientCar(req.body.param));
    } catch(e)
    {
        res.status(500).json({error: e.message})
    }
})

router.patch("/editCar", async(req,res)=>{
    try{        
        res.status(200).json(await CarsQuery.edit(req.body.id, req.body.set));
    } catch(e)
    {
        res.status(500).json({error: e.message});
    }
})

router.delete("/deleteCar", async(req,res)=>{
    try{
        await CarsQuery.delete(req.body.id);        
        res.status(200).send("Deleted syccessfully")
    } catch(e){
        res.status(500).json({error: e.message});
    }
})

router.get("/globalCar", async(req, res)=>{
    try{        
        res.status(200).json(await CarsQuery.globalSearch(req.body.param));
    } catch(e){
        res.status(500).json({error: e.message});
    }
})

router.post("/addOrder", async(req, res)=>{
    try{
        res.status(200).send(await OrdersQuery.add(req.body));
    }catch(e){
        res.status(500).json({error: e.message})
    }
})

router.get("/selectOrder", async(req,res)=>{
    try{
        res.status(200).send(await OrdersQuery.select(req.body));
    } catch(e)
    {
        res.status(500).send({error: e.message});
    }

})
/*
router.post("/assignMechanic", async(req,res)=>{
    try{
        res.status(200).send(await OrdersQuery.assignMechanic(req.body));
    } catch(e){
        res.status(500).json({error: e.message})
    }
})
*/
router.delete("/deleteOrder", async(req, res)=>{
    try{
        res.status(200).send(await OrdersQuery.delete(req.body.id));
    } catch(e)
    {
        res.status(500).json({error: e.message});
    }
})

router.get("/globalOrders", async (req, res)=>{
    try{
        res.status(200).send(await OrdersQuery.globalSearch(req.body.param))
    } catch(e)
    {
        res.status(500).json({error: e.message})
    }
})

router.patch("/editOrder", async (req, res)=>{
    try{
        res.status(200).send(await OrdersQuery.globalSearch(req.body.id, req.body.params));
    } catch(e)
    {
        res.status(500).json({error: e.message})
    }
})

router.post("/addSparePart", async(req, res)=>{
    try{
        res.status(200).send(await CarSpareParts.add(req.body))
    } catch(e){
        res.status(500).json({error: e.message})
    }
})

router.delete("/deleteSparePart", async(req, res)=>{
    try{
        res.status(200).send(await CarSpareParts.delete(req.body.id));
    } catch(e){
        res.status(500).json({error: e.message});
    }
})

router.patch("/editSparePart", async(req, res)=>{
    try{
        res.status(200).send(await CarSpareParts.edit(req.body.id, req.body.setParams));
    }catch (e){
        res.status(500).json({error: e.message});
    }
})

router.get("/getSparePart", async(req, res)=>{
    try{
        res.status(200).send(await CarSpareParts.select(req.body.name));
    }catch (e){
        res.status(500).json({error: e.message});
    }
})

router.get("/orderSpareParts", async(req, res)=>{
    try{
        res.status(200).send(await OrderSpareParts.getOrderParts(req.body.id));
    } catch(e)
    {
        res.status(500).send({error: e.message});
    }
})

// STATISTICS

router.get("/getCarRepairStatistics", async (req, res)=>{
    try{
        res.status(200).send(await OrdersQuery.getCarRepairStatistics());
    } catch(e)
    {
        res.send(500).json({error: e.message});
    }
})

router.get("/getTopUsedSpareParts", async (req,res)=>{
    try{
        res.status(200).send(await OrderSpareParts.getTopUsedSpareParts());
    } catch(e)
    {
        res.status(500).send({error: e.message});
    }
})

router.get("/getGeneralStatistics", async(req, res)=>{
    try{
        res.status(200).send(await sequelize.query("call GetGeneralStatistics()"));
    } catch(e)
    {
        res.status(500).send({error: e.original.sqlMessage});
    }

})

router.get("/getTopMechanicByMonth", async(req,res)=>{
    try{
        res.status(200).send(await OrdersQuery.getTopMechanicByMonth());
    } catch(e)
    {
        res.status(500).send({error: e.original.sqlMessage});
    }
})

router.get("/calculateRevenueByMonth", async(req,res)=>{
    try{
        res.status(200).send(await OrdersQuery.calculateRevenueByMonth());
    } catch(e)
    {
        res.status(500).send({erorr: e.message});
    }
})
module.exports = router;