import userRegistrationService from "../services/userRegistrationService.js";


const registerUser = async (req,res,next)=>{
    const {email,password,fullName,dateofBirth,country,gender,maingender,instaId,snapchatId,imageFile,imageFile2,imageFile3,preferredCountry,preferredGender,prefgender}=req.body;
    try{
        const msg=await userRegistrationService.registerUser(email,password,fullName,dateofBirth,country,gender,maingender,instaId,snapchatId,imageFile,imageFile2,imageFile3,preferredCountry,preferredGender,prefgender);
        res.json({msg});
    }
    catch(err){
        console.log('Here is ', err)
        return {status:"failure",msg:err};
    }
}
const verifyImage = async(req,res,next)=>{
    const {imageFile,imageFile2,imageFile3}=req.body;
    try{
        const msg=await userRegistrationService.checkExistingImage(imageFile,imageFile2,imageFile3);
        res.json({msg});
    }
    catch(err){
        return {status:"failure",msg:err};
    }
}
const verifyInsta = async(req,res,next)=>{
    const {instaId}=req.body;
    try{
        const msg=await userRegistrationService.checkInsta(instaId);
        res.json({msg});
    }
    catch(err){
        return {status:"failure",msg:err};
    }
}
const verifySnap = async(req,res,next)=>{
    const {snapchatId}=req.body;
    try{
        const msg=await userRegistrationService.checkSnap(snapchatId);
        res.json({msg});
    }
    catch(err){
        return {status:"failure",msg:err};
    }
}

export default {registerUser,verifyImage,verifyInsta,verifySnap};