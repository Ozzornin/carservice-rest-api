const mysqldump = require('mysqldump');
const path = require("path");
const express = require("express");
const router = express.Router();
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const WorkersQuery = require("../queries/Workers");
router.use(express.json());

router.use(async (req,res,next)=>{
    const token = req.header("authorization").replace("Bearer ", "");
    let decoded;
    try{
        decoded = await jwt.verify(token, "secretToken");
    }        
    catch(e){
        res.status(403).send("Forbidden access");
    }

    const role = await WorkersQuery.getRoleByLogin(decoded.login);
    console.log(role);
    if(role != "Адміністратор")
    {
        res.status(403).send("Forbidden access");
    }
    else
    {
        res.locals.login = decoded.login;
        next();
    }
})

router.post("/addWorker", async (req, res)=>{
    try{
        const resp = await WorkersQuery.add(req.body);
        res.status(200).json(resp);
    } catch(e)
    {
        res.status(500).json({ error: e.message })
    }
})

router.delete("/deleteWorker", async(req,res)=>{
    try{
        const resp = await WorkersQuery.remove(req.body);
        res.status(200).json(resp);
    }catch(e)
    {
        res.status(500).json({error: e.message});
    }
})


router.get("/backup", async(req, res)=>{
    const date = Date.now();
    const filePath = path.join(__dirname, `${date}backup.sql`).replace("routes", "backupDB");
    console.log(filePath);
   await mysqldump({
        connection:{
            user: "root",
            password: "root",
            database: "courseworkdb",
            host: "localhost"  
        },
        dumpToFile: filePath
    }) 
    res.status(200).sendFile(filePath);
})

module.exports = router;