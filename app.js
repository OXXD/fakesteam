const express = require("express");
const http = require("http");
const bobyParser = require("body-parser");
const session = require("express-session");
const cookieParser = require("cookie-parser");

// server
var app = express();
var server = http.createServer(app);
server.listen(3500);

app.use(express.static("public"));
app.use(bobyParser.urlencoded({ extended: false }));

// session 
app.use(session({
    secret: 'sessiontest',
    resave: false,
    saveUninitialized: true
}))

// router
const routerProduct = require('./product');
const routerUser = require('./user');
app.use('/product', routerProduct);
app.use('/user', routerUser);