const pool = require('./pool');
const express = require('express');

var router = express.Router();

router.get('/', (req, res) => {
    var sql = "SELECT *, (SELECT sm FROM steam_apps_pic p WHERE p.sm LIKE '%184x69%' AND p.appid = a.appid LIMIT 1) as sm FROM steam_apps a LIMIT 10";
    pool.getConnection((err, conn) => {
        if (err) throw err;
        conn.query(sql, (err, result) => {
            if (err) throw err;
            res.json(result);
            conn.release();
        });
    });
});

module.exports = router;