import deleteUserService from "../services/deleteUserService.js";


const deleteUserFunction =async (req,res,next)=>{
        try{
            const {uId}=req.body;
            const msg=await deleteUserService.deleteUser(uId);
            res.json({msg});
        }catch(err){
            console.log("Error in Delete User Controller", err);
            return {msg:err};
        }


};


export default {deleteUserFunction};