import db from "../app.js";
import fs from "fs";
import moment from "moment-timezone";

class getUserInfoService{
    static async getCompleteInfo(userId){
        const user =await db.query("SELECT * FROM data where userid=$1",[userId]);
        const userEmail =await db.query("SELECT email FROM users where userid=$1",[userId]);
        const age=await this.getAge(userId);
        const imageFile164=await this.getImageFile1(userId);
        var imageFile264=null,imageFile364=null;
        if(user.rows[0].imagefile2!=null){
            imageFile264=await this.getImageFile2(userId);
        }
        if(user.rows[0].imagefile3!=null){
            imageFile364=await this.getImageFile3(userId);
        }

        // console.log(userEmail.rows[0].email);
        user.rows[0].dateofbirth = moment(user.rows[0].dateofbirth).tz('Asia/Kolkata').format('YYYY-MM-DD');
        const msg={
            ...user.rows[0],
            email:userEmail.rows[0].email,
            age:age,
            imageFile164:imageFile164,
            imageFile264:imageFile264,
            imageFile364:imageFile364,
            statusCode:200

        }
        return {msg};
    


    }
    static async readImageFile(filePath) {
        return new Promise((resolve, reject) => {
            if (filePath) {
                fs.readFile(filePath, (err, data) => {
                    if (err) {
                        reject(err);
                    } else {
                        resolve(data.toString('base64'));
                    }
                });
            } else {
                resolve(null);
            }
        });
    }
    static async getImageFile1(userId) {
        try {
            const imageFileResp = await db.query("SELECT imageFile FROM data WHERE userid=$1", [userId]);
            if (imageFileResp.rows.length === 0) {
                throw new Error('Image file not found for user');
            }
            const imageFile = imageFileResp.rows[0].imagefile; // Ensure you access the imagefile property correctly
            const imageBase64 = await this.readImageFile(imageFile);
            return imageBase64;
        } catch (err) {
            console.error(err);
            throw err;
        }
    }
    static async getImageFile2(userId) {
        try {
            const imageFileResp = await db.query("SELECT imageFile2 FROM data WHERE userid=$1", [userId]);
            if (imageFileResp.rows.length === 0) {
                throw new Error('Image file not found for user');
            }
            const imageFile = imageFileResp.rows[0].imagefile; // Ensure you access the imagefile property correctly
            const imageBase64 = await this.readImageFile(imageFile);
            return imageBase64;
        } catch (err) {
            console.error(err);
            throw err;
        }
    }

    static async getImageFile3(userId) {
        try {
            const imageFileResp = await db.query("SELECT imageFile3 FROM data WHERE userid=$1", [userId]);
            if (imageFileResp.rows.length === 0) {
                throw new Error('Image file not found for user');
            }
            const imageFile = imageFileResp.rows[0].imagefile; // Ensure you access the imagefile property correctly
            const imageBase64 = await this.readImageFile(imageFile);
            return imageBase64;
        } catch (err) {
            console.error(err);
            throw err;
        }
    }


    static async getuserID(email){
        let userData=await db.query("SELECT userid from users where email=$1",[email]);
        return userData.rows[0].userid;
    }
    static async getName(userId){
        let userData =await db.query("SELECT fullname FROM data where userid=$1",[userId]);
        return userData.rows[0].fullname;
    }

    static async getGemCount(userId){
        let userData =await db.query("SELECT gemcount FROM data where userid=$1",[userId]);
        return userData.rows[0].gemcount;
    }

    static async getDateOfBirth(userId){
        let userData =await db.query("SELECT dateofbirth FROM data where userid=$1",[userId]);
        const istDateOfBirth = moment(userData.rows[0].dateofbirth).tz('Asia/Kolkata').format('YYYY-MM-DD');
        return istDateOfBirth;
    }

    static async getAge(userId){
        let userData =await db.query("SELECT dateofbirth FROM data where userid=$1",[userId]);
        const istDateOfBirth = moment(userData.rows[0].dateofbirth).tz('Asia/Kolkata').format('YYYY-MM-DD');
        var now = new Date();
        var age = moment().diff(istDateOfBirth, 'years');
        if (moment() < moment(now.setFullYear(now.getFullYear() - age)).valueOf()) age--;
        return age;
    }

    static async getCountry(userId){
        let userData =await db.query("SELECT country FROM data where userid=$1",[userId]);
        return userData.rows[0].country;
    }

    static async getGender(userId){
        let userData =await db.query("SELECT gender,maingender FROM data where userid=$1",[userId]);
        return userData.rows[0];
    }

    static async getInsta(userId){
        let userData =await db.query("SELECT instaid FROM data where userid=$1",[userId]);
        return userData.rows[0].instaid;
    }

    static async getSnap(userId){
        let userData =await db.query("SELECT snapchatid FROM data where userid=$1",[userId]);
        return userData.rows[0].snapchatid;
    }

    static async getPreferredCountry(userId){
        let userData =await db.query("SELECT preferredcountry FROM data where userid=$1",[userId]);
        return userData.rows[0].preferredcountry;
    }

    static async getPreferredGender(userId){
        let userData =await db.query("SELECT preferredgender,prefgender FROM data where userid=$1",[userId]);
        return userData.rows[0];
    }



}

export default getUserInfoService;