// "use strict"
import express from "express";
import bodyParser from "body-parser";
import registerRoute from "./router/Routes.js";

const port=8000;
const app=express();

app.use(
    bodyParser.urlencoded({limit:'50mb',extended:true})
);
app.use(
    bodyParser.json({limit:'50mb'})
)
app.use('/',registerRoute);

app.get(
    "/",(req,res)=>{
        res.render("index.ejs");
    }
)

app.listen(port,(err)=>{
    if(err){
        console.log("Error: ", err);
    }
    else{
        console.log(`Server is running on ${port}`);
    }
})