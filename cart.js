const pool = require("./pool");
const express = require("express");
const bodyParser = require("body-parser");

var router = express.Router();

// loadCart
router.get("/", (req, res) => {
    if (!req.session.user) {
        res.json({ code: -1, msg: "用户未登录" });
        return;
    }
    var uid = req.session.user.uid;

    pool.getConnection((err, conn) => {
        if (err) throw err;
        var sql =
            "SELECT *, (SELECT sm FROM steam_apps_pic as p WHERE p.appid = c.appid AND  p.sm LIKE '%capsule_sm_120%' LIMIT 1) as sm, (SELECT price  FROM steam_apps a WHERE a.appid = c.appid LIMIT 1) as price, (SELECT name  FROM steam_apps a WHERE a.appid = c.appid LIMIT 1) as name FROM steam_shoppingcart as c WHERE c.uid = ?";
        conn.query(sql, [uid], (err, result) => {
            if (err) throw err;
            res.json(result);
            conn.release();
        });
    });
});

// cartcount
router.get("/count", (req, res) => {
    if (!req.session.user) {
        res.json({ code: -1, msg: "用户未登录" });
        return;
    }
    var uid = req.session.user.uid;

    pool.getConnection((err, conn) => {
        if (err) throw err;
        var sql =
            "SELECT count(*) as count FROM steam_shoppingcart WHERE uid = ? AND expired != '1'";
        conn.query(sql, [uid], (err, result) => {
            if (err) throw err;
            res.json(result[0]);
            conn.release();
        });
    });
});

// selectOne
router.get("/selectOne", (req, res) => {
    var iid = req.query.iid,
        checked = req.query.checked;

    if (!iid) {
        res.json({ code: -1, msg: "iid required" });
        return;
    }
    if (!checked) {
        res.json({ code: -1, msg: "checked required" });
        return;
    }

    var sql = "UPDATE steam_shoppingcart SET is_checked = ? WHERE iid = ?";
    pool.getConnection((err, conn) => {
        if (err) throw err;
        conn.query(sql, [checked, iid], (err, result) => {
            if (err) throw err;
            if (result.affectedRows) {
                res.json({ code: 1, msg: "update success" });
            } else {
                res.json({ code: -3, msg: "update failed" });
            }
            conn.release();
        });
    });
});

// selectAll
router.get("/selectAll", (req, res) => {
    var checked = req.query.checked;

    if (!req.session.user) {
        res.json({ code: -2, msg: "user not login" });
        return;
    }
    if (!checked) {
        res.json({ code: -1, msg: "checked required" });
        return;
    }

    var uid = req.session.user.uid;

    var sql = "UPDATE steam_shoppingcart SET is_checked = ? WHERE uid = ?";
    pool.getConnection((err, conn) => {
        if (err) throw err;
        conn.query(sql, [checked, uid], (err, result) => {
            if (err) throw err;
            if (result.affectedRows) {
                res.json({ code: 1, msg: "update all success" });
            } else {
                console.log(sql);
                res.json({ code: -3, msg: "update all failed" });
            }
            conn.release();
        });
    });
});

// updateCart
router.get("/updateCart", (req, res) => {
    var count = req.query.count,
        iid = req.query.iid;

    if (!count) {
        res.json({ code: -1, msg: "count required" });
        return;
    }
    if (!iid) {
        res.json({ code: -1, msg: "iid required" });
        return;
    }

    var sql = "UPDATE steam_shoppingcart SET count = ? WHERE iid = ?";
    pool.getConnection((err, conn) => {
        if (err) throw err;
        conn.query(sql, [count, iid], (err, result) => {
            if (err) throw err;
            if (result.affectedRows) {
                res.json({ code: 1, msg: "update count success" });
            } else {
                console.log(sql);
                res.json({ code: -3, msg: "update coutn failed" });
            }
            conn.release();
        });
    });
});

// deleteAll
router.get("/deleteAll", (req, res) => {
    if (!req.session.user) {
        res.json({ code: -2, msg: "user not login" });
        return;
    }
    var uid = req.session.user.uid;
    var sql = "UPDATE steam_shoppingcart SET expired = '1', count=0 WHERE uid = ? ";
    pool.getConnection((err, conn) => {
        if (err) throw err;
        conn.query(sql, [uid], (err, result) => {
            if (err) throw err;
            if (result.affectedRows)
                res.json({ code: 1, msg: "delete all success" });
            else res.json({ code: -3, msg: "delete all failed" });
            conn.release();
        });
    });
});

// delete
router.get("/delete", (req, res) => {
    if (!req.query.iid && !req.query.iids) {
        res.json({ code: -1, msg: "iid or iids required" });
        return;
    }
    var sql = "";

    pool.getConnection((err, conn) => {
        if (err) throw err;
        if (req.query.iid) {
            var iid = req.query.iid;
            sql = "UPDATE steam_shoppingcart SET expired = '1', count=0 WHERE iid = ?";
            conn.query(sql, [iid], (err, result) => {
                if (err) throw err;
                if (result.affectedRows) {
                    res.json({ code: 1, msg: "delete item success" });
                } else {
                    console.log(sql);
                    res.json({ code: -3, msg: "delete item failed" });
                }
                conn.release();
            });
        } else if (req.query.iids) {
            var iids = req.query.iids.split(","),
                isFinished = 0;
            for (var iid of iids) {
                sql =
                    "UPDATE steam_shoppingcart SET expired = '1' WHERE iid = ?";
                conn.query(sql, [iid], (err, result) => {
                    if (err) throw err;
                    isFinished++;
                    if (isFinished >= iids.length) {
                        if (result.affectedRows) {
                            res.json({ code: 1, msg: "delete items success" });
                        } else {
                            console.log(sql);
                            res.json({ code: -3, msg: "delete items failed" });
                        }
                        conn.release();
                    }
                });
            }
        }
    });
});

// addCart
router.get("/addCart", (req, res) => {
    if (!req.session.user) {
        res.json({ code: -2, msg: "user not login" });
        return;
    }
    if (!req.query.appid) {
        res.json({ code: -1, msg: "appid required" });
        return;
    }
    var uid = req.session.user.uid,
        appid = req.query.appid;

    var sql = "SELECT * FROM steam_shoppingcart WHERE uid = ? AND appid = ?";
    pool.getConnection((err, conn) => {
        if (err) throw err;
        conn.query(sql, [uid, appid], (err, result) => {
            if (err) throw err;
            if (result.length) {
                sql =
                    "UPDATE steam_shoppingcart SET count=count+1, expired='0', is_checked = 1 WHERE uid = ? AND appid = ?";
            } else {
                sql =
                    "INSERT INTO steam_shoppingcart VALUES(null, ?, ?, 1, 1, '0')";
            }
            conn.query(sql, [uid, appid], (err, result) => {
                if (err) throw err;
                if (result.affectedRows) {
                    res.json({ code: 1, msg: "insert into cart success" });
                } else {
                    console.log(sql);
                    res.json({ code: -3, msg: "insert into cart failed" });
                }
                conn.release();
            });
        });
    });
});

module.exports = router;