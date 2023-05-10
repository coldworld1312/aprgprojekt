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
    aufgabe TEXT NOT NULL UNIQUE,
    lösung INTEGER,
    python BOOL,
    kopfrechnen BOOL,
    
);

INSERT INTO users (username, userpassword) VALUES ("lion","lion");

INSERT INTO aufgaben (kapitel,aufgabe.lösong,python,kopfrechnen)
VALUES(1,"")