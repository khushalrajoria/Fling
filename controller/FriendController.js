import FriendService from "../services/FriendService.js";
import SwipeService from "../services/SwipeService.js";


const addFriendController=async (req,res,next)=>{
    try{
        const{uId,userId} =req.body;
        await SwipeService.removeFromRightSwipe(uId,userId);
        await FriendService.addFriend(uId,userId);
        res.json({status:"success",statusCode:200,msg:"Friend Added"});
    }
    catch(err){
        return {status:"failure",statusCode:409,msg:err};
    }
}
const rejectFriendController=async (req,res,next)=>{
    try{
        const{uId,userId} =req.body;
        await SwipeService.removeFromRightSwipe(uId,userId);
        await SwipeService.leftSwipeUser(uId,userId);
        res.json({status:"success",statusCode:200,msg:"Friend Added"});
    }
    catch(err){
        return {status:"failure",statusCode:409,msg:err};
    }
};


export default {addFriendController,rejectFriendController};