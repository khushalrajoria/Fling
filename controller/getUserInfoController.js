import getUserInfoService from "../services/getUserInfoService.js";

const getUserInfoController=async(req,res,next)=>{
    const {uId}=req.body;
    const msg = await getUserInfoService.getCompleteInfo(uId);
    res.json({msg});
};

const getNameController=async(req,res,next)=>{
    const {uId}=req.body;
    const msg=await getUserInfoService.getName(uId);
    res.json({msg});
};

const getUserIDController=async(req,res,next)=>{
    const {email}=req.body;
    const msg=await getUserInfoService.getuserID(email);
    res.json({msg});
};

const getDateOfBirthController=async(req,res,next)=>{
    const {uId}=req.body;
    const msg=await getUserInfoService.getDateOfBirth(uId);
    res.json({msg});
};

const getGemCountController=async(req,res,next)=>{
    const {uId}=req.body;
    const msg=await getUserInfoService.getGemCount(uId);
    res.json({msg});
};

const getAgeController=async(req,res,next)=>{
    const {uId}=req.body;
    const msg=await getUserInfoService.getAge(uId);
    res.json({msg});
};

const getCountryController=async(req,res,next)=>{
    const {uId}=req.body;
    const msg=await getUserInfoService.getCountry(uId);
    res.json({msg});
};
const getGenderController=async(req,res,next)=>{
    const {uId}=req.body;
    const msg=await getUserInfoService.getGender(uId);
    res.json({msg});
};
const getInstaController=async(req,res,next)=>{
    const {uId}=req.body;
    const msg=await getUserInfoService.getInsta(uId);
    res.json({msg});
};
const getSnapController=async(req,res,next)=>{
    const {uId}=req.body;
    const msg=await getUserInfoService.getSnap(uId);
    res.json({msg});
};
const getPreferredCountryController=async(req,res,next)=>{
    const {uId}=req.body;
    const msg=await getUserInfoService.getPreferredCountry(uId);
    res.json({msg});
};

const getPreferredGenderController=async(req,res,next)=>{
    const {uId}=req.body;
    const msg=await getUserInfoService.getPreferredGender(uId);
    res.json({msg});
};


export default {getUserInfoController,getNameController,getUserIDController,getGemCountController,getDateOfBirthController,getAgeController,getCountryController,getGenderController,getInstaController,getSnapController,getPreferredCountryController,getPreferredGenderController};