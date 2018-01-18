const mysql = require("mysql");

const pool = mysql.createPool({
    host: '127.0.0.1',
    user: 'root',
    password: '',
    database: 'steam',
    port: 3306,
    connectionLimit: 25
});

module.exports = pool;