import db from "../app.js";


class deleteUserService{
    static async deleteUser(uId){
        try{
            await db.query("DELETE FROM friendList where uid=$1 or userid=$1",[uId]);
            await db.query("DELETE FROM rightSwipeUsers where userwhoswiped=$1 or userwhogotswiped=$1",[uId]);
            await db.query("DELETE FROM leftSwipeUsers where userwhoswiped=$1 or userwhogotswiped=$1",[uId]);
            await db.query("DELETE FROM data where userid=$1",[uId]);
            await db.query("DELETE FROM users where userid=$1",[uId]);
            return {status: 'success',msg:`User Deleted from Database`,statusCode:200};
        }catch(err){
            return {status: 'failure',msg:`Error Deleting from Database ${err}`,statusCode:409};
        }
    }
}

export default deleteUserService;