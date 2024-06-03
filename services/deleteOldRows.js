import exp from "constants";
import db from "../app.js";

class deleteOldRows{
    static async deleteOldRows(){
        try{
        await db.query("DELETE FROM leftSwipeUsers WHERE timestamped < NOW() - INTERVAL '2 days'");
        }
        catch(err){
            console.log(`Error in deleting old rows: ${err}`);
        }
    }
}

export default deleteOldRows;