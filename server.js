//init webserver
const express = require('express'); 
const app = express();

//init ejs
app.engine("ejs",require("ejs").__express);
app.set("view engine","ejs");

//bcrypt
const bcrypt = require('bcrypt');

//init body-parser
const bodyParser= require('body-parser'); 
app.use(bodyParser.urlencoded({extended: true}));

//init cookies
const cookieParser = require('cookie-parser'); 
app.use(cookieParser());

//init datenbank
const DATABASE = "math.db"; // Pfad der Datenbankdatei
const db = require("better-sqlite3")(DATABASE);

//init sessions
const session = require('express-session'); 
app.use(session({
    secret: 'example', resave: false, saveUninitialized: true
}));


//serverstart
app.listen(666,function(){
    console.log("listenin on 666");
});

//home
app.get("/home",function(req,res){
    res.render("home");
})

//login
app.post("/login",function(req,res){
    res.render("login");
});

//logintry
app.post("/logintry",function(req,res){
    const username = req.body["userName"];
    const userpassword=req.body["userPassword"];
    
    const rows = db.prepare('SELECT userpassword FROM users WHERE username = ?').all(username);
if (rows.length === 0) {
    res.render("login")
} 
else {
  const hash = rows[0].userpassword;
  const check = bcrypt.compareSync(userpassword,hash)
  if(check==true){
    //res.cookie('counter' , counter + 1, {'maxAge': maxAge});
    req.session['sessionValue'] = Math.floor(Math.random(100)*100);

    res.render("userHome")
  } 
  if(check==false){
    res.render("loginFail")
  }
}
       
});

//select
app.post("/select",function(req,res){
    res.render("select");
});

//stats
app.post("/stats",function(req,res){
    res.render("stats");
});

//adduser
app.post("/addUser",function(req,res){
    res.render("addUser");
});

//add new user
app.post("/newUser",function(req,res){
    
    const username = req.body["username"];
    const userpassword=req.body["userpassword"];
    const repeatedPassword=req.body["repeatedPassword"];
    const right=0;
    const wrong=0;
    const rightAnswers=0;
    const wrongAnswers=0;
    
    console.log(username,userpassword,repeatedPassword,right,wrong,rightAnswers,wrongAnswers)

   if(userpassword==repeatedPassword){
    const saltRounds = 10;
    bcrypt.hash(userpassword, saltRounds, function(err, hash) {
      const info = db.prepare(`INSERT INTO users(username,userpassword,right,wrong,rightAnswers,wrongAnswers)
      VALUES (?,?,?,?,?,?)`).run(username,hash,right,wrong,rightAnswers,wrongAnswers);
    
      res.render("home");  
    }); 
    }
    else{
        res.render("userFail")
    }
    
});

//zurück zu home
app.post("/home",function(req,res){
    res.render("home")
})

