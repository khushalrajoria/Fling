import SwipeService from "../services/SwipeService.js";


const LeftSwipeController=async (req,res,next)=>{
    const {uId,userId}=req.body;

    try{
    await SwipeService.leftSwipeUser(uId,userId);
    res.json({status:"success",statusCode:200,msg:"Left Swipe Success"});
    }
    catch(err){
        return {status:"failure",statusCode:409,msg:err};
    }
};

const RightSwipeController=async (req,res,next)=>{
    const {uId,userId}=req.body;

    try{
    await SwipeService.rightSwipeUser(uId,userId);
    res.json({status:"success",statusCode:200,msg:"Right Swipe Success"});
    }
    catch(err){
        return {status:"failure",statusCode:409,msg:err};
    }
};


export default {LeftSwipeController,RightSwipeController};