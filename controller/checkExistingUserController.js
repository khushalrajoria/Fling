import checkExistingUserService from "../services/checkExistingUserService.js";

const checkExistingUser = async (req,res,next)=>{
    const email=req.body.email;
    try{


        const msg=await checkExistingUserService.checkExistingUser(email);
        res.json({msg});
    }
    catch(err){
        return {status:"failure",msg:err};
    }
}

export default {checkExistingUser};