const express = require("express");
const http = require("http");
const bobyParser = require("body-parser");
const session = require("express-session");
const MemoryStore = require('memorystore')(session)
const cookieParser = require("cookie-parser");
var svgCaptcha = require('svg-captcha');

// server
var app = express();
var server = http.createServer(app);
server.listen(process.env.PORT || 5050);

app.use(express.static("public"));
app.use(bobyParser.urlencoded({
    extended: false
}));

// session 
app.use(session({
    secret: 'sessiontest',
    resave: false,
    saveUninitialized: true,
    store: new MemoryStore({
      checkPeriod: 86400000 // prune expired entries every 24h
    }),
}));

//captcha
svgCaptcha.options.width = 108,
    svgCaptcha.options.height = 40;

app.get('/captcha.svg', function (req, res) {
    var captcha = svgCaptcha.create();
    req.session.captcha = captcha.text;

    res.type('svg');
    res.status(200).send(captcha.data);
});

// router
const routerProduct = require('./product');
const routerUser = require('./user');
const routerCart = require('./cart');
const routerSearch = require('./search');
const routerIndex = require('./index');
app.use('/product', routerProduct);
app.use('/user', routerUser);
app.use('/cart', routerCart);
app.use('/search', routerSearch);
app.use('/index', routerIndex);

app.use((err, req, res, next) => {
    console.error('error in the server: \n', err);
    res.status(500).send(err.message || 'error in the server');
})

module.exports = app;