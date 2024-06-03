import moment from "moment-timezone";
import db from "../app.js";
import getUserInfoService from "./getUserInfoService.js";


class updateUserInfoService{
    static async updateUserInfo(uId,fullName,dateOfBirth,country,gender,maingender,instaId,snapchatId,preferredCountry,preferredGender,prefGender){
            const existingUserData=getUserInfoService.getCompleteInfo(uId);
            if(existingUserData.fullName!=fullName && fullName!=null){
                await db.query("UPDATE data SET fullname = $1 WHERE userid=$2",[fullName,uId]);
            }
            if(existingUserData.dateOfBirth!=dateOfBirth && dateOfBirth!=null){
                const istDateOfBirth = moment.tz(dateOfBirth, 'Asia/Kolkata').format('YYYY-MM-DD');
                await db.query("UPDATE data SET dateofbirth = $1 WHERE userid=$2",[istDateOfBirth,uId]);
            }
            if(existingUserData.country!=country && country!=null){
                await db.query("UPDATE data SET country = $1 WHERE userid=$2",[country,uId]);
            }
            if(existingUserData.gender!=gender && gender!=null){
                await db.query("UPDATE data SET gender = $1 WHERE userid=$2",[gender,uId]);
            }
            if(existingUserData.maingender!=maingender && maingender!=null){
                await db.query("UPDATE data SET maingender = $1 WHERE userid=$2",[maingender,uId]);
            }
            if(existingUserData.instaId!=instaId && instaId!=null){
                await db.query("UPDATE data SET instaid = $1 WHERE userid=$2",[instaId,uId]);
            }
            if(existingUserData.snapchatId!=snapchatId && snapchatId!=null){
                await db.query("UPDATE data SET snapchatid = $1 WHERE userid=$2",[snapchatId,uId]);
            }
            if(existingUserData.preferredCountry!=preferredCountry && preferredCountry!=null){
                await db.query("UPDATE data SET preferredcountry = $1 WHERE userid=$2",[preferredCountry,uId]);
            }
            if(existingUserData.preferredGender!=preferredGender && preferredGender!=null){
                await db.query("UPDATE data SET preferredgender = $1 WHERE userid=$2",[preferredGender,uId]);
            }
            if(existingUserData.prefGender!=prefGender && prefGender!=null){
                await db.query("UPDATE data SET prefgender = $1 WHERE userid=$2",[prefGender,uId]);
            }
            return {status:"Success",statusCode:200};
    }

}

export default updateUserInfoService;