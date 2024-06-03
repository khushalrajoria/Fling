import db from "../app.js";


class userLoginService{
    static async verifyUser(email,password){
        try{
           const checkExisting = await db.query("SELECT * FROM users WHERE email =$1 AND password=$2",[email,password]);
           if(checkExisting.rows.length>0){
            return {status:"success",msg:"Login Successful",statusCode:200,"userId":checkExisting.rows[0].userid};
           }
           else{
            return {status:"success" ,msg:"login failed",statusCode:402};
           }
        }catch(err){
            return {status:"failure",msg:err};
        }
    }
}

export default userLoginService;