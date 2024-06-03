import userLoginService from "../services/userLoginService.js";

const verifyUserController =async (req,res,next)=>{
    const {email,password}=req.body;
    try{
        const msg= await userLoginService.verifyUser(email,password);
        res.json({msg});
    }catch(err){
        return {status:"failure",msg:err};   
     }
}

export default {verifyUserController};