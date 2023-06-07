/*tabelle erzeugen*/
CREATE TABLE users(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL UNIQUE,
    userpassword TEXT,
    right INTEGER,
    wrong INTEGER,
    rightAnswers TEXT,
    wrongAnswers TEXT
);
CREATE TABLE aufgaben(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    kapitel INTEGER,
    aufgabe TEXT,
    lösung INTEGER,
    python BOOL,
    kopfrechnen BOOL
);

INSERT INTO users (username, userpassword) VALUES ("lion","lion");

INSERT INTO aufgaben (kapitel,aufgabe,lösung,python,kopfrechnen)
VALUES(1,"Geben sie die Summe der ersten 100 ungeraden Zahlen an.",10000,true,false);

INSERT INTO aufgaben (kapitel,aufgabe,lösung,python,kopfrechnen)
VALUES(1,"geben sie die Summe der ersten 50 natürlichen Zahlen an, die größer als 200 sind.",11526,false,true);

INSERT INTO aufgaben (kapitel,aufgabe,lösung,python,kopfrechnen)
VALUES(1,"Konvertieren sie die Zahl 1234567 in das Siebenersystem",13331215,true, true);

INSERT INTO aufgaben (kapitel,aufgabe,lösung,python,kopfrechnen)
VALUES(1,"Konvertieren sie die Zahl 1234567 in das Siebenersystem",13331215,true, true);

INSERT INTO aufgaben (kapitel,aufgabe,lösung,python,kopfrechnen)
VALUES(1,"Konvertieren sie die Zahl 1234567 in das Siebenersystem",13331215,true, true);


INSERT INTO aufgaben (kapitel,aufgabe,lösung,python,kopfrechnen)
VALUES(2,"Konvertieren sie die Zahl 1234567 in das Siebenersystem",13331215,true, true);

INSERT INTO aufgaben (kapitel,aufgabe,lösung,python,kopfrechnen)
VALUES(3,"Konvertieren sie die Zahl 1234567 in das Siebenersystem",13331215,true, true);

INSERT INTO aufgaben (kapitel,aufgabe,lösung,python,kopfrechnen)
VALUES(4,"Konvertieren sie die Zahl 1234567 in das Siebenersystem",13331215,true, true);

INSERT INTO aufgaben (kapitel,aufgabe,lösung,python,kopfrechnen)
VALUES(3,"Konvertieren sie die Zahl 1234567 in das Siebenersystem",13331215,true, true);



