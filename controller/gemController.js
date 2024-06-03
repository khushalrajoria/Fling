import gemService from "../services/gemService.js";


const gemCountController= async (req,res,next)=>{
    try{
        const {uId}=req.body;
        const result = await gemService.getGemCount(uId);
        res.json({"gemCount":result,statusCode:200});
    }
    catch(err){
        console.log("Error in getting user's gem count: ", err);
    }

};
const remove10gemsController=async (req,res,body)=>{
    try{
        const {uId}=req.body;
        const result = await gemService.remove10gems(uId);
        res.json({"gemCount":result,statusCode:200});
    }catch(err){
        console.log("Error is removing 10 gems from user's account",err);
    }
}

const purchaseGemsController = async (req,res,next)=>{
    try{
        const {uId,gemsToAdd}=req.body;
        const result = await gemService.addGems(uId,gemsToAdd);
        res.json({"gemCount":result,statusCode:200});
    }catch(err){
        console.log("Error in adding gems to user's account",err);
    }

}
const addViaClaimButton =async (req,res,next)=>{
    try{
        const {uId}=req.body;
        const result = await gemService.addViaClaimButton(uId);
        res.json({"gemCount":result,statusCode:200});
    }
    catch(err){
        console.log("Error in updating gems to db",err);
    }
}

export default {gemCountController,remove10gemsController,purchaseGemsController,addViaClaimButton};