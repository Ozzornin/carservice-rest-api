const express = require("express");
const app = express();
const db = require("./models");


const adminRouter = require("./routes/Admin");
const commonRouter = require("./routes/Common");
const managerRouter = require("./routes/Manager");
const mechanicRouter = require("./routes/Mechanic");

app.use("/manager", managerRouter);
app.use("/common", commonRouter);
app.use("/admin", adminRouter);
app.use("/mechanic", mechanicRouter);


db.sequelize.sync().then(()=>{
  app.listen(3001, () => {
    console.log("Server started on port 3001");
  });
});

