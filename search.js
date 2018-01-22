const pool = require("./pool");
const express = require("express");

var router = express.Router();

router.get('/', (req, res) => {
    var output = {
        totalRecord: 0,
        data: [],
        pno: 1,
        pageSize: 10,
        pageCount: 0
    };

    var pno = parseInt(req.query.pno) || 1,
        pageSize = parseInt(req.query.pageSize) || 15;

    if (req.query.kw) {
        var kw = req.query.kw;
    }

    pool.getConnection((err, conn) => {
        if (err) throw err;
        var sql = "SELECT count(*) as count FROM steam_apps";
        if (kw) sql = `SELECT count(*) as count FROM steam_apps WHERE name LIKE '%${kw}%'`;
        conn.query(sql, (err, result) => {
            if (err) throw err;
            output.totalRecord = result[0].count;
            output.pageCount = Math.ceil(output.totalRecord / pageSize);
            var offset = (pno - 1) * pageSize;
            sql = "SELECT *, (SELECT sm FROM steam_apps_pic p WHERE sm LIKE '%sm_120%' AND p.appid = a.appid) AS sm FROM steam_apps a LIMIT ?,?";
            if (kw) sql = `SELECT *, (SELECT sm FROM steam_apps_pic p WHERE sm LIKE '%sm_120%' AND p.appid = a.appid) AS sm FROM steam_apps a WHERE a.name LIKE '%${kw}%' LIMIT ?,?`
            conn.query(sql, [offset, pageSize], (err, result) => {
                if (err) throw err;
                output.data = result;
                output.pno = pno, output.pageSize = pageSize;
                res.json(output);
                conn.release();
            });
        });
    });
});

module.exports = router;