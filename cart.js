const pool = require("./pool");
const express = require("express");
const bodyParser = require("body-parser");

var router = express.Router();

// loadCart
router.get('/', (req, res) => {
    if (!req.session.user) {
        res.json({ code: -1, msg: '用户未登录' });
        return;
    }
    var uid = req.session.user.uid;

    pool.getConnection((err, conn) => {
        if (err) throw err;
        var sql = "SELECT *, (SELECT sm FROM steam_apps_pic as p WHERE p.appid = c.appid AND  p.sm LIKE '%capsule_sm_120%' LIMIT 1) as sm, (SELECT price  FROM steam_apps a WHERE a.appid = c.appid) as price, (SELECT name  FROM steam_apps a WHERE a.appid = c.appid) as name FROM steam_shoppingcart as c WHERE uid = ?";
        conn.query(sql, [uid], (err, result) => {
            if (err) throw err;
            res.json(result);
            conn.release();
        });

    });
});

// cartcount
router.get('/count', (req, res) => {
    if (!req.session.user) {
        res.json({ code: -1, msg: '用户未登录' });
        return;
    }
    var uid = req.session.user.uid;

    pool.getConnection((err, conn) => {
        if (err) throw err;
        var sql = "SELECT count(*) as count FROM steam_shoppingcart WHERE uid = ?";
        conn.query(sql, [uid], (err, result) => {
            if (err) throw err;
            res.json(result[0]);
            conn.release();
        });
    });
});

module.exports = router;