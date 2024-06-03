import db from "../app.js";


class FriendService{
    static async addFriend(uId,userId){
        try{
        await db.query("INSERT INTO friendList(uId,userId) VALUES ($1,$2)",[uId,userId]);
        }
        catch(err){
            console.log(`Error Adding Friend Into Database: ${err}`);
        }
    }
}

export default FriendService;