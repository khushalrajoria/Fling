import updateUserInfoService from "../services/updateUserInfoService.js";


const updateInfoController= async (req,res,next)=>{
    try{
        const {uId,fullName,dateOfBirth,country,gender,maingender,instaId,snapchatId,preferredCountry,preferredGender,prefGender} = req.body;
        const msg = await updateUserInfoService.updateUserInfo(uId,fullName,dateOfBirth,country,gender,maingender,instaId,snapchatId,preferredCountry,preferredGender,prefGender);
        res.json({msg});
        }catch(error){
            console.log("Error in updating User Info: ", error)
            };
}

export default {updateInfoController};