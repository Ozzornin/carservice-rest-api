const express = require("express");
const router = express.Router();
const jwt = require("jsonwebtoken");
const WorkersQuery = require("../queries/Workers");
const OrdersQuery = require("../queries/Orders");
const CarSpareParts = require("../queries/CarSpareParts");
const OrderSpareParts = require("../queries/OrderSpareParts");
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
        if(role != "Механік" && role != "Адміністратор")        
            throw new Error();        
        
        res.locals.login = decoded.login;
        next();        
    }        
    catch(e){
        res.status(403).send("Forbidden access");
    }    
})

router.get("/orders", async(req,res)=>{
    try{
        res.status(200).send(await OrdersQuery.mechanicOrders(res.locals.login));
    } catch(e)
    {
        res.status(500).json({error: e.message});
    }
});

router.post("/completeOrder", async (req, res)=>{
    try{
        res.status(200).send(await OrdersQuery.markAsDone(res.locals.login, req.body.id));
    } catch(e)
    {
        res.status(500).json({error: e.message});
    }
})

router.post("/addOrderPart",async(req,res)=>{
    try{
        res.status(200).send(await OrderSpareParts.add(res.locals.login, req.body.orderId, req.body.partId, req.body.amount));
    } catch(e)
    {
        res.status(500).send({error: e.message});
    }
})

module.exports = router;