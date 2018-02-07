const mysql = require("mysql");

const pool = mysql.createPool({
    host: 'w.rdc.sae.sina.com.cn',
    user: 'mkk3nj0w1n',
    password: 'z3y2hmx35iklh1i3xjjx2z3x4j145xx0w10i1iim',
    database: 'app_fakesteam',
    port: 3306,
    connectionLimit: 25
});

module.exports = pool;

// const mysql = require("mysql");

// const pool = mysql.createPool({
//     host: '127.0.0.1',
//     user: 'root',
//     password: '',
//     database: 'steam',
//     port: 3306,
//     connectionLimit: 25
// });

// module.exports = pool;