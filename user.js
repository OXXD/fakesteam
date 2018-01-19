const pool = require("./pool");
const express = require("express");
const bodyParser = require("body-parser");

var router = express.Router();

// 登录功能
router.post("/login", (req, res) => {
    var uname = req.body.uname,
        upwd = req.body.upwd,
        ucaptcha = req.body.ucaptcha;

    if (ucaptcha != req.session.captcha.toLowerCase()) {
        res.json({ code: -4, msg: '验证码错误' });
        return;
    }
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
            conn.release();
        });
    });
});

//  判断用户是否登录
router.get('/islogin', function(req, res, next) {
    if (req.session.user) {
        res.json({ code: 1, msg: 'user logined', user: req.session.user });
    } else {
        res.json({ code: -1, msg: 'user not login' });
    }
});

// 用户登出
router.get('/logout', (req, res) => {
    req.session.user = null;
    res.send('登出成功');
});

// 用户注册
router.get('/register', (req, res) => {
    //uname=123&upwd=123&cpwd=123&email=312%40we.sa&cemail=312%40we.sa
    var uname = req.query.uname,
        upwd = req.query.upwd,
        email = req.query.email,
        ucaptcha = req.query.ucaptcha;

    if (ucaptcha != req.session.captcha.toLowerCase()) {
        res.json({ code: -3, msg: '验证码错误' });
        return;
    }
    if (!uname) {
        res.json({ code: -1, msg: 'uname required' });
        return;
    }
    if (!upwd) {
        res.json({ code: -1, msg: 'upwd required' });
        return;
    }
    if (!email) {
        res.json({ code: -1, msg: 'email required' });
        return;
    }

    pool.getConnection((err, conn) => {
        var sql = 'SELECT count(*) as count FROM steam_user WHERE uname=?';
        if (err) throw err;
        conn.query(sql, [uname], (err, result) => {
            if (err) throw err;
            if (result[0].count > 0) {
                res.json({ code: -2, msg: '用户名已存在' });
                conn.release();
                return;
            }

            sql = "INSERT INTO steam_user VALUES(null, ?, ?, ?, null, 'img/avatar/default.png', null, 0)";
            conn.query(sql, [uname, upwd, email], (err, result) => {
                if (err) throw err;
                if (result.affectedRows) {
                    res.json({ code: 1, msg: '注册成功，跳转至登录页面...' });
                } else {
                    res.json({ code: -4, msg: '注册失败' });
                }
                conn.release();
            });

        });
    });
});


module.exports = router;