import db from "../app.js";

class SwipeService {
    static async leftSwipeUser(uIdWhoDid, uIdWhoGot) {
        await db.query("INSERT INTO leftSwipeUsers(userwhoswiped,userwhogotswiped) VALUES ($1,$2)",
            [uIdWhoDid, uIdWhoGot]);

    };
    static async rightSwipeUser(uIdWhoDid, uIdWhoGot) {
        await db.query("INSERT INTO rightSwipeUsers(userwhoswiped,userwhogotswiped) VALUES ($1,$2)",
            [uIdWhoDid, uIdWhoGot]);
    }
    static async removeFromLeftSwipe(uIdWhoDid,uIdWhoGot) {
        try {
            await db.query("DELETE FROM leftSwipeUsers where userwhoswiped=$1 AND userWhoGotSwiped=$2", 
            [uIdWhoDid,uIdWhoGot]);
        }
        catch (err) {
            console.log(`Error in removing from Left Swipes: ${err}`);
        }
    }
    static async removeFromRightSwipe(uIdWhoDid,uIdWhoGot) {
        try {
            await db.query("DELETE FROM rightSwipeUsers where (userwhoswiped=$1 AND userWhoGotSwiped=$2) OR (userwhoswiped=$2 AND userWhoGotSwiped=$1)",
                [uIdWhoDid,uIdWhoGot]);
        }
        catch (err) {
            console.log(`Error in removing from the right swipe: ${err}`);
        }
    }

};

export default SwipeService;