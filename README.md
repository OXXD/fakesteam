# project_steam
A fake Steam Store website built with jQuery and Node.js for learing purpose

## Config Port and MySQL connection

In app.js

``` javascript
server.listen(process.env.PORT || 80);
```

In pool.js 

``` javascript
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
```

## Run Project

``` bash
npm install
npm start
```

Open http://localhost:80

## Deploy

[**Sinacloud**](http://oxxd.github.io/nodejs-sinacloud/)  
[**AWS**](http://oxxd.github.io/nodejs-aws/)
