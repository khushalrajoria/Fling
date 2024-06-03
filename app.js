import pg from "pg";


const db=new pg.Client({
    user:"postgres",
    host:"localhost",
    database:"klick",
    password:"123456",
    port:5432
});
db.connect();

export default db;