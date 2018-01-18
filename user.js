const pool = require("./pool");
const express = require("express");
const bodyParser = require("body-parser");

var router = express.Router();

router.post("/login", (req, res) => {
    var uname = req.body.uname,
        upwd = req.body.upwd;
    if (!uname) {
        res.json({ code: -1, msg: 'uname required' });
        return;
    }
    if (!upwd) {
        res.json({ code: -2, msg: 'upwd required' });
        return;
    }
    var sql = 'SELECT uid, uname FROM steam_user WHERE uname = ? AND upwd = ?';
    pool.getConnection((err, conn) => {
        if (err) throw err;
        conn.query(sql, [uname, upwd], (err, result) => {
            if (err) throw err;
            // console.log(result);
            if (result.length > 0) {
                req.session.user = result[0];
                res.json({ code: 1, msg: '登录成功' });
            } else {
                res.json({ code: -3, msg: '用户名或密码错误' });
            }
        });
    });
});

router.get('/islogin', function(req, res, next) {
    if (req.session.user) {
        res.json({ code: 1, msg: 'user logined', user: req.session.user });
    } else {
        res.json({ code: -1, msg: 'user not login' });
    }
});

router.get('/logout', (req, res) => {
    req.session.user = null;
    res.send('登出成功');
});



module.exports = router;