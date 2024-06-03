import db from "../app.js";


class checkExistingUserService{
    static async checkExistingUser(email){
        try{
           const checkExisting = await db.query("SELECT * FROM users WHERE email =$1",[email]);
           if(checkExisting.rows.length>0){
            return {status:"success",msg:"User Exists",statusCode:409};
           }
           else{
            return {status:"success" ,msg:"No User Found",statusCode:200};
           }
        }catch(err){
            return {status:"failure",msg:err};
        }
    }
}

export default checkExistingUserService;