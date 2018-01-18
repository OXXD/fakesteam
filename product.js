const pool = require('./pool');
const express = require('express');

var router = express.Router();

// loadProductByAppid
router.get('/', (req, res) => {
    var appid = req.query.appid;
    if (!appid) {
        res.json({ code: -1, msg: 'appid required' });
        return;
    }

    var sql = "SELECT * FROM steam_apps WHERE appid = ?";
    var output = {};
    pool.getConnection((err, conn) => {
        if (err) throw err;
        conn.query(sql, [appid], (err, result) => {
            if (err) throw err;
            output.data = result[0];
            sql = "SELECT * FROM steam_apps_pic WHERE appid = ?";
            conn.query(sql, [appid], (err, result) => {
                if (err) throw err;
                output.imgs = result;
                res.json(output);
            });
        });
    });
});

// loadProductImgs

module.exports = router;