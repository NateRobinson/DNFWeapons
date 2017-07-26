/**
 * Created by ROG STRIX S5 on 2017/7/9.
 */
var express = require('express');
var app = express();
var bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true})); // for parsing application/x-www-form-urlencoded

var mysql = require('mysql');

var connection = mysql.createPool({
    host: 'localhost',
    port: '3306',
    user: 'root',
    password: '',
    database: 'dnf_sql'
});


//设置跨域访问
app.all('*', function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");
    res.header("X-Powered-By", ' 3.2.1')
    res.header("Content-Type", "application/json;charset=utf-8");
    next();
});

app.get('/', function (req, res) {
    res.send('Hello World');
});

/**
 * admin系统相关
 */
//登录接口
app.post('/admin/login', function (req, res) {
    console.log(req.body);
    if (!req.body) {
        res.json({
            code: -1,
            msg: '登录参数异常111',
            data: {}
        });
        return;
    }
    var userName = req.body.username;
    var password = req.body.password;
    if (!userName || !password) {
        res.json({
            code: -1,
            msg: '登录参数异常2222',
            data: {}
        });
        return;
    }
    connection.query('SELECT * FROM `t_admin` WHERE `name` = ? AND `password` = ?', [userName, password], function (err, rows) {
        if (err) {
            res.json({
                code: -1,
                msg: '登录失败',
                data: false
            });
        } else {
            if (rows && rows.length > 0) {
                res.json({
                    code: 1,
                    msg: '登录成功',
                    data: true
                });
            } else {
                res.json({
                    code: -1,
                    msg: '用户不存在',
                    data: false
                });
            }
        }
    })
});

/**
 * admin系统相关
 */
//登录接口
app.post('/admin/login', function (req, res) {
    console.log(req.body);
    if (!req.body) {
        res.json({
            code: -1,
            msg: '登录参数异常111',
            data: {}
        });
        return;
    }
    var userName = req.body.username;
    var password = req.body.password;
    if (!userName || !password) {
        res.json({
            code: -1,
            msg: '登录参数异常2222',
            data: {}
        });
        return;
    }
    connection.query('SELECT * FROM `t_admin` WHERE `name` = ? AND `password` = ?', [userName, password], function (err, rows) {
        if (err) {
            res.json({
                code: -1,
                msg: '登录失败',
                data: false
            });
        } else {
            if (rows && rows.length > 0) {
                res.json({
                    code: 1,
                    msg: '登录成功',
                    data: true
                });
            } else {
                res.json({
                    code: -1,
                    msg: '用户不存在',
                    data: false
                });
            }
        }
    })
});

//添加职业
app.post('/admin/addcategory', function (req, res) {
    var categoryname = req.body.categoryname;
    var categorylogo = req.body.categorylogo;
    var categoryupdated = new Date();
    var categorydesc = req.body.categorydesc;
    connection.query('INSERT INTO `t_category` (`category_name`, `category_logo`, `category_updated`, `categorydesc`) VALUES  (?,?,?,?)',
        [categoryname, categorylogo, categoryupdated, categorydesc]
        , function (err, rows) {
            if (!err) {
                res.json({
                    code: 1,
                    msg: '插入成功',
                    data: true
                });
            } else {
                res.json({
                    code: -1,
                    msg: '执行失败',
                    data: true
                });
            }
        });
});

//删除职业
app.get('/admin/deletecategory', function (req, res) {
    //查询这个职业下的武器数目，如果大于0，不能删除
    var categoryid = req.query.categoryid;
    connection.query('select * from t_weapon  where `weapon_cagory_id` = ? and `is_delete`= ?', [categoryid, 0], function (err, rows) {
        if (!err && rows.length === 0) {
            connection.query('UPDATE `t_category` SET `is_delete`=? WHERE `id`=?',
                [1, categoryid], function (err, rows) {
                    if (!err) {
                        res.json({
                            code: 1,
                            msg: '删除成功',
                            data: rows
                        });
                    } else {
                        res.json({
                            code: -1,
                            msg: '删除失败',
                            data: rows
                        });
                    }
                })
        } else {
            res.json({
                code: -1,
                msg: '删除失败',
                data: rows
            });
        }
    });
});

//修改职业
app.post('/admin/updatecategory', function (req, res) {
    var categoryid = req.body.categoryid;
    var categoryname = req.body.categoryname;
    var categorylogo = req.body.categorylogo;
    var categoryupdated = new Date();
    var categorydesc = req.body.categorydesc;
    connection.query('UPDATE `t_category` SET `category_name`=?, `category_logo`=?, `category_updated`=?, `categorydesc`=? WHERE `id`=?',
        [categoryname, categorylogo, categoryupdated, categorydesc, categoryid]
        , function (err, rows) {
            if (!err) {
                res.json({
                    code: 1,
                    msg: '更新成功',
                    data: true
                });
            } else {
                res.json({
                    code: -1,
                    msg: '执行失败',
                    data: true
                });
            }
        });
});

//职业查询接口
app.get('/admin/querycategories', function (req, res) {
    connection.query('SELECT * FROM `t_category` where `is_delete` = ? ORDER BY category_updated desc', [0], function (err, rows) {
        if (!err) {
            res.json({
                code: 1,
                msg: '查询成功',
                data: rows
            });
        } else {
            res.json({
                code: -1,
                msg: '执行失败',
                data: {}
            });
        }
    });
});

//查询某一个职业
app.get('/admin/querycategorybyid', function (req, res) {
    var categoryid = req.query.categoryid;
    connection.query('SELECT * FROM `t_category` where `id` = ?', [categoryid], function (err, rows) {
        if (!err) {
            res.json({
                code: 1,
                msg: '查询成功',
                data: rows[0]
            });
        } else {
            res.json({
                code: -1,
                msg: '执行失败',
                data: {}
            });
        }
    });
});


//添加武器接口
app.post('/admin/addweapons', function (req, res) {
    var weaponname = req.body.weaponname;
    var weaponcategoryid = req.body.weaponcategoryid;
    var weaponavatar = req.body.weaponavatar;
    var weaponupdated = new Date();
    var weapondesc = req.body.weapondesc;

    connection.query('INSERT INTO `t_weapon` (`weapon_name`, `weapon_cagory_id`, `weapon_logo`, `weapon_desc`, `weapon_updated`) VALUES  (?,?,?,?,?)',
        [weaponname, weaponcategoryid, weaponavatar, weapondesc, weaponupdated]
        , function (err, rows) {
            if (!err) {
                res.json({
                    code: 1,
                    msg: '插入成功',
                    data: true
                });
            } else {
                res.json({
                    code: -1,
                    msg: '执行失败',
                    data: true
                });
            }
        });
});

//删除武器接口
app.get('/admin/deleteweapons', function (req, res) {
    var weaponid = req.query.weaponid;
    connection.query('UPDATE `t_weapon` SET `is_delete`=? WHERE `id`=?',
        [1, weaponid], function (err, rows) {
            if (!err) {
                res.json({
                    code: 1,
                    msg: '删除成功',
                    data: rows
                });
            } else {
                res.json({
                    code: -1,
                    msg: '删除失败',
                    data: rows
                });
            }
        })
});

//更新武器接口
app.post('/admin/updateweapon', function (req, res) {
    var weaponid = req.body.weaponid;
    var weaponname = req.body.weaponname;
    var weaponcategoryid = req.body.weaponcategoryid;
    var weaponavatar = req.body.weaponavatar;
    var weaponupdated = new Date();
    var weapondesc = req.body.weapondesc;
    connection.query('UPDATE `t_weapon` SET `weapon_name`=?, `weapon_cagory_id`=?, `weapon_logo`=?, `weapon_desc`=?, `weapon_updated`=? WHERE `id` =?',
        [weaponname, weaponcategoryid, weaponavatar, weapondesc, weaponupdated, weaponid]
        , function (err, rows) {
            if (!err) {
                res.json({
                    code: 1,
                    msg: '更新成功',
                    data: true
                });
            } else {
                res.json({
                    code: -1,
                    msg: '执行失败',
                    data: true
                });
            }
        });
});

//查询武器接口
app.get('/admin/queryweapons', function (req, res) {
    connection.query('select weapon.*, category.category_name from t_weapon weapon left join t_category category on weapon.weapon_cagory_id = category.id where weapon.is_delete = ? ORDER BY weapon_updated desc', [0], function (err, rows) {
        if (!err) {
            res.json({
                code: 1,
                msg: '查询成功',
                data: rows
            });
        } else {
            res.json({
                code: -1,
                msg: '执行失败',
                data: {}
            });
        }
    });
});

//查询武器接口--根据categoryid
app.get('/admin/queryweaponsbycategoryid', function (req, res) {
    var categoryid = req.query.categoryid;
    connection.query('select * from t_weapon  where `weapon_cagory_id` = ?', [categoryid], function (err, rows) {
        if (!err) {
            res.json({
                code: 1,
                msg: '查询成功',
                data: rows
            });
        } else {
            res.json({
                code: -1,
                msg: '执行失败',
                data: {}
            });
        }
    });
});

/**
 * client系统相关
 */
//登录接口
app.post('/client/login', function (req, res) {
    console.log(req.body);
    if (!req.body) {
        res.json({
            code: -1,
            msg: '登录参数异常111',
            data: {}
        });
        return;
    }
    var userName = req.body.username;
    var password = req.body.password;
    if (!userName || !password) {
        res.json({
            code: -1,
            msg: '登录参数异常2222',
            data: {}
        });
        return;
    }
    connection.query('SELECT * FROM `t_user` WHERE `username` = ? AND `password` = ?', [userName, password], function (err, rows) {
        if (err) {
            res.json({
                code: -1,
                msg: '登录失败',
                data: false
            });
        } else {
            if (rows && rows.length > 0) {
                res.json({
                    code: 1,
                    msg: '登录成功',
                    data: true
                });
            } else {
                res.json({
                    code: -1,
                    msg: '用户不存在',
                    data: false
                });
            }
        }
    })
});

app.listen(3000);