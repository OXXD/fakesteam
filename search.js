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
        pageSize = parseInt(req.query.pageSize) || 15,
        sortby = parseInt(req.query.sortby) || 0;

    if (req.query.kw) {
        var kw = req.query.kw;
    }

    if (req.query.tags) {
        var tags = req.query.tags.split(',');
    }

    pool.getConnection((err, conn) => {
        if (err) throw err;
        var sql = "SELECT count(*) as count FROM steam_apps ";
        if (kw)
            sql += ` WHERE name LIKE '%${kw}%' `;

        if (tags) {
            if (kw) {
                sql += ' AND ';
            } else {
                sql += ' WHERE';
            }
            // console.log(tags);
            for (let i = 0; i < tags.length; i++) {
                var tag = tags[i];
                sql += ` tag_list LIKE '%${tag}%' `;
                if (tags.length > 1)
                    sql += ' AND';
            }
            if (tags.length > 1)
                sql = sql.slice(0, -3); // 
        }

        if (sortby > 0)
            switch (sortby) {
                case 1:
                    sql += ' ORDER BY release_date';
                    break;
                case 2:
                    sql += ' ORDER BY name';
                    break;
                case 3:
                    sql += ' ORDER BY price ASC';
                    break;
                case 4:
                    sql += ' ORDER BY price DESC';
                    break;
                default:
                    break;
            }

        // console.log(sql);

        conn.query(sql, (err, result) => {
            if (err) throw err;
            output.totalRecord = result[0].count;
            output.pageCount = Math.ceil(output.totalRecord / pageSize);
            var offset = (pno - 1) * pageSize;

            sql = "SELECT *, (SELECT sm FROM steam_apps_pic p WHERE sm LIKE '%sm_120%' AND p.appid = a.appid) AS sm FROM steam_apps a ";
            if (kw)
                sql += ` WHERE a.name LIKE '%${kw}%' `;

            if (tags) {
                if (kw) {
                    sql += ' AND ';
                } else {
                    sql += ' WHERE';
                }
                for (let i = 0; i < tags.length; i++) {
                    var tag = tags[i];
                    sql += ` tag_list LIKE '%${tag}%' `;
                    if (tags.length > 1)
                        sql += ' AND';
                }
                if (tags.length > 1)
                    sql = sql.slice(0, -3);
            }

            if (sortby > 0)
                switch (sortby) {
                    case 1:
                        sql += ' ORDER BY a.release_date';
                        break;
                    case 2:
                        sql += ' ORDER BY a.name';
                        break;
                    case 3:
                        sql += ' ORDER BY a.price ASC';
                        break;
                    case 4:
                        sql += ' ORDER BY a.price DESC';
                        break;
                    default:
                        break;
                }

            sql += ` LIMIT ?,?`;

            // console.log(sql);

            conn.query(sql, [offset, pageSize], (err, result) => {
                if (err) throw err;
                output.data = result,
                    output.pno = pno,
                    output.pageSize = pageSize;
                res.json(output);
                conn.release();
            });
        });
    });
});

router.get('/autocomplete', (req, res) => {
    var kw = req.query.kw;
    if (!kw) {
        res.json({ code: -1, msg: "kw required" });
        return;
    }

    var sql = "SELECT name, appid FROM steam_apps WHERE name LIKE ? LIMIT 5";
    pool.getConnection((err, conn) => {
        if (err) throw err;
        conn.query(sql, [`%${kw}%`], (err, result) => {
            if (err) throw err;
            res.json(result);
            conn.release();
        });
    });
});

module.exports = router;