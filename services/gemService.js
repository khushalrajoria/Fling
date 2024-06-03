import db from "../app.js";

class gemService{
    static async getGemCount(uId){
        const gemCountField=await db.query("SELECT gemCount from data WHERE userid=$1",[uId]);
        var gemCount=gemCountField.rows[0].gemcount;
        return gemCount;
    }

    static async remove10gems(uId){
        var gemCount =await this.getGemCount(uId);
        gemCount=await (gemCount-10);
        if(gemCount<=10){
            gemCount =await 0;
        }
        await db.query("UPDATE data SET gemcount = $1 WHERE userid=$2",[gemCount,uId]);
        var newGemCount=await this.getGemCount(uId);
        return newGemCount;   
    }

    static async addGems(uId,gemsCountToAdd){
        var gemCount =await this.getGemCount(uId);
        gemCount=await (gemCount+gemsCountToAdd);
        await db.query("UPDATE data SET gemcount = $1 WHERE userid=$2",[gemCount,uId]);
        var newGemCount=await this.getGemCount(uId);
        return newGemCount;           
    }

    static async addViaClaimButton(uId){
        var gemCount =await this.getGemCount(uId);
        if(gemCount<100){
            gemCount = await 100;
        }
        else if(gemCount>=1000 && gemCount<=1100){
            gemCount = await 1100;
        }
        else if(gemCount>=6000 && gemCount<=6100){
            gemCount = await 6100;
        }
        else if(gemCount>=13000 && gemCount<=13100){
            gemCount = await 13100;
        }else if(gemCount>=25000 && gemCount<=25100){
            gemCount = await 2100;
        }else{
            gemCount =await 100;
        }
        await db.query("UPDATE data SET gemcount = $1 WHERE userid=$2",[gemCount,uId]);
        var newGemCount=await this.getGemCount(uId);
        return newGemCount;           
    }



}

export default gemService;