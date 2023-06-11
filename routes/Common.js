

const express = require("express");
const router = express.Router();
const bcrypt = require("../utils/bcrypt");
const token = require("../utils/token");
const WorkersQuery = require("../queries/Workers");
router.use(express.json());


router.post("/login", async (req, res)=>{
    console.log(req.originalUrl);
    try{
        const resp = await WorkersQuery.getPasswordByLogin(req.body);
        
        if(resp != undefined && await bcrypt.comparePassword(req.body.password, resp))
        {
            const genToken = await token(req.body.login);
            res.status(200).json({genToken})
        }        
        else
        {
            res.status(403).send("Wrong login or password");
        }
    }catch(e)
    {
        res.status(500).json({error: e.message});
    }
})

router.post("/logout", async (req, res)=>{
  if(req.header("authorization").replace("Bearer ", "") != "")
  {
    req.headers['Authorization'] = "";
    console.log(req.headers['Authorization'])
    res.status(200).send("Logout sucess");
  }
  else{
    res.status(401).send("Authentication required")
  }
})


module.exports = router;