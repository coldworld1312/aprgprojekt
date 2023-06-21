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
const DATABASE = "math.db"; 
const db = require("better-sqlite3")(DATABASE);

//init sessions
const session = require('express-session'); 
app.use(session({
    secret: 'example', 
    resave: false, 
    saveUninitialized: true
}));


//serverstart
app.listen(666,function(){
    console.log("listenin on 666");
});


// Statisches Dateiverzeichnis einrichten
app.use(express.static('images'));
app.use(express.static('style'));
app.use(express.static('views'));
app.use(express.static(__dirname + "/images"));

//home
app.get("/home",function(req,res){
    let counter = parseInt(req.cookies['counter']) || 0;
    const maxAge = 3600*1000; // one hour 
    res.cookie('counter' , counter + 1, {'maxAge': maxAge});
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
    const sessionName = req.body["userName"]

if (rows.length === 0) {
    res.render("loginFail")
} 
else {
  const hash = rows[0].userpassword;
  const check = bcrypt.compareSync(userpassword,hash)
  if(check==true){
    req.session.sessionValue = sessionName;
   
    //session lesen
    if (!req.session.sessionValue){
        //session nicht gesetzt
        res.render("sessionFail")
    }
    else{
        //sesion gesetzt
        console.log(req.session)
        res.render("userHome")
    }
  
  } 
  if(check==false){
    
    res.render("loginFail")
  }
}     
});


//select
app.post("/select",function(req,res){
     //session lesen
     if (!req.session.sessionValue){
        //session nicht gesetzt
        res.render("sessionFail")
    }
    else{
        //sesion gesetzt
        res.render("select");
    }   
});
app.post("/userHome", function(req,res){
    if (!req.session.sessionValue){
    //session nicht gesetzt
    res.render("sessionFail")
}

else{
    res.render("userHome");
}
}
);

app.get("/userHome", function(req,res){
    if (!req.session.sessionValue){
    //session nicht gesetzt
    res.render("sessionFail")
}

else{
    res.render("userHome");
}}
);

//learn
app.post("/learn",function(req,res){
    
    const listeKapitel = req.body["kapitel"];
    const aufgabenart = req.body["aufgabenart"];
    const anzahlAufgaben = req.body["anzahlAufgaben"]
   

    if(listeKapitel != null && aufgabenart != null){
        let listeKapitelInt = []
        for (let i = 0; i<listeKapitel.length; i++)
        {
            listeKapitelInt.push(Number(listeKapitel[i]));
        }

        //session lesen
        if (!req.session.sessionValue){
        //session nicht gesetzt
        res.render("sessionFail")
        }
    
        else{
        let liste = listeKapitelInt.toString();
        
        let rows = null;
        //Auswahl aller Aufgaben, die den ausgewählten Kriterien entsprechen
        
        
                if(aufgabenart.includes("python") && aufgabenart.includes("kopfrechnen"))  
                {
                        rows = db.prepare('SELECT * FROM aufgaben WHERE kapitel in (' + liste + ")").all();  
                }
                else if(aufgabenart.includes("python") && !(aufgabenart.includes("kopfrechnen")))
                {
                        rows = db.prepare('SELECT * FROM aufgaben WHERE kapitel in (' + liste + ') AND python == True').all();
                }
                else
                {
                        rows = db.prepare('SELECT * FROM aufgaben WHERE kapitel in (' + liste + ') AND kopfrechnen == True').all();  
                }

                let finalRows = []
                
                //zufällige Auswahl aus möglichen Aufgaben
                for(let i = 0; i < anzahlAufgaben; i++){
                    
                        let rand = Math.floor(Math.random()*rows.length);
                        
                        finalRows.push(rows[rand])
                        rows.splice(rand,1)
                }
                
                res.render("learn", {aufgaben : finalRows});
            }
        }
        else{
            res.send("Ungültige Eingabe. Bitte wählen Sie Kapitel und gewünschte Aufgabenart aus.")
        }   
    }
);

app.post("/auswertung",function(req,res){
    //session lesen
    if (!req.session.sessionValue){
       //session nicht gesetzt
       res.render("sessionFail")
   }
   else{
       //session gesetzt
       
       const anzahlAufgaben = req.body["anzahlAufgaben"]
       const aufgabenListe = []
       const benutzerAntwortenListe = []
       const loesungenListe = []
       const richtigListe = []

       for(let i = 0; i < anzahlAufgaben; i++){
        //Auswahl der Aufgaben anhand Aufgaben ID aus math.db
            const aufgaben_id = req.body["aufgabe_id_"+i]
            
            const aufgabenzeile = db.prepare('select * from aufgaben where id='+aufgaben_id).all()[0]

            if(aufgabenzeile == null){
                console.log("unexpected error, aufgabe id does not exist")
                continue
            }
            //Abgleich der eingegeben Antworten mit richtigen Antworten aus Datenbank
            const benutzerAntwort = req.body["benutzerAntwort_"+i]
            aufgabenListe.push(aufgabenzeile.aufgabe)
            benutzerAntwortenListe .push(benutzerAntwort)
            
            loesungenListe.push(aufgabenzeile.loesung)

            if(aufgabenzeile.loesung == benutzerAntwort)
            {
                
                richtigListe.push("Richtig.")
            }
            else{
                
                richtigListe.push("Falsch.")
            }
            
       }
       //übergabe der aufgabe, der richtigen loesung, der benutzerantwort und ob richtig oder falsch
       res.render("auswertung", {aufgaben : aufgabenListe, loesungen : loesungenListe, benutzerAntworten : benutzerAntwortenListe, richtig : richtigListe});
   }
});

//adduser
app.post("/addUser",function(req,res){
    res.render("addUser");
});

//add new user
//add new user
app.post("/newUser", function(req, res) {
  const username = req.body["username"];
  const userpassword = req.body["userpassword"];
  const repeatedPassword = req.body["repeatedPassword"];
  const right = 0;
  const wrong = 0;
  const rightAnswers = 0;
  const wrongAnswers = 0;

  console.log(username, userpassword, repeatedPassword, right, wrong, rightAnswers, wrongAnswers);

  // Überprüfung, ob der Benutzername bereits in der Datenbank existiert
  
  const params = [username];

    const row = db.prepare('SELECT * FROM users WHERE username = ?').all(username);
    console.log("ROW", row)
    
      if (row.length > 0) {
        res.render("userFail");
      } else {
        if (userpassword === repeatedPassword) {
          const saltRounds = 10;
          bcrypt.hash(userpassword, saltRounds, function(err, hash) {
            const info = db.prepare(`INSERT INTO users(username, userpassword, right, wrong, rightAnswers, wrongAnswers)
              VALUES (?,?,?,?,?,?)`).run(username, hash, right, wrong, rightAnswers, wrongAnswers);

            res.render("home");
          });
        } else {
          res.render("passwortFail");
        }
      }
    
  });


//Logout
app.post("/logout",function(req,res){
    
    req.session.destroy();
    
    res.redirect("/home");
});

//zurück zu home
app.post("/home",function(req,res){
    console.log(req.session)
    res.render("home")
})



