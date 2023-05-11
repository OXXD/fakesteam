const mysql = require("mysql");

// aws
// const pool = mysql.createPool({
//     host: process.env.RDS_HOSTNAME,
//     user: process.env.RDS_USERNAME,
//     password: process.env.RDS_PASSWORD,
//     database: 'steam',
//     port: process.env.RDS_PORT,
//     connectionLimit: 25
// });

// module.exports = pool;

// sinacloud
// const pool = mysql.createPool({
//     host: process.env.MYSQL_HOST,
//     user: process.env.ACCESSKEY,
//     password: process.env.SECRETKEY,
//     database: 'app_' + process.env.APPNAME,
//     port: process.env.MYSQL_PORT,
//     connectionLimit: 25
// });

// module.exports = pool;

// loaclhost
// const pool = mysql.createPool({
//     host: '127.0.0.1',
//     user: 'root',
//     password: '',
//     database: 'steam',
//     port: 3306,
//     connectionLimit: 25
// });

// heroku and jaws mysql
const pool = mysql.createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.ACCESSKEY,
    password: process.env.SECRETKEY,
    database: process.env.APPNAME,
    port: process.env.MYSQL_PORT,
    connectionLimit: 25,
    ssl: {
        rejectUnauthorized: true
    }
});

module.exports = pool;
