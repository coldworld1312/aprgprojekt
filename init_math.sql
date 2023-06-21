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
    loesung INTEGER,
    python BOOL,
    kopfrechnen BOOL
);

INSERT INTO users (username, userpassword) VALUES ("lion","lion");

INSERT INTO aufgaben (kapitel, aufgabe, loesung, python, kopfrechnen)
VALUES (1, 'Geben Sie die Summe der ersten 100 ungeraden Zahlen an.', 10000, 1, 0);

INSERT INTO aufgaben (kapitel, aufgabe, loesung, python, kopfrechnen)
VALUES (1, 'Geben Sie die Summe der ersten 50 natürlichen Zahlen an, die größer als 200 sind.', 11526, 1, 0);

INSERT INTO aufgaben (kapitel, aufgabe, loesung, python, kopfrechnen)
VALUES (1, 'Konvertieren Sie die Zahl 1234567 in das Siebenersystem', 13331215, 0, 1);

INSERT INTO aufgaben (kapitel, aufgabe, loesung, python, kopfrechnen)
VALUES (1, 'Geben Sie die Summe der ersten 100 natürlichen Zahlen an, die durch 7 teilbar sind', 34650, 0, 1);

INSERT INTO aufgaben (kapitel, aufgabe, loesung, python, kopfrechnen)
VALUES (2, 'Berechnen Sie in Z/17Z den wert 7*7+10*7', 0, 1, 0);

INSERT INTO aufgaben (kapitel, aufgabe, loesung, python, kopfrechnen)
VALUES (2, 'Geben Sie von der Binärdarstellung von (100**14000)+3 die letzten beiden Bits an', 11, 1, 0);

INSERT INTO aufgaben (kapitel, aufgabe, loesung, python, kopfrechnen)
VALUES (2, 'Der Größte gemeinsame Teiler von 18 und 11 ist 1. Geben Sie Zwei ganze Zahlen a und b an, so dass 1=18a+11b gilt.', 123456, 0, 1);

INSERT INTO aufgaben (kapitel, aufgabe, loesung, python, kopfrechnen)
VALUES (2, 'Geben Sie den Größten gemeinsamen Teiler von 471 694 074 821, 471 776 128 373 und 471 757 130 107 an.', 471, 0, 1);

INSERT INTO aufgaben (kapitel, aufgabe, loesung, python, kopfrechnen)
VALUES (3, 'Geben Sie Zwei Zahlen aus Z/27Z an deren Produkt verschwindet obwohl beide Zahlen nicht Null sind.', 123456, 1, 0);

INSERT INTO aufgaben (kapitel, aufgabe, loesung, python, kopfrechnen)
VALUES (3, 'Für wieviele Zahlen a aus Z/42Z ist die Gleichung 5x=a in Z/42Z nicht lösbar', 42, 1, 0);

INSERT INTO aufgaben (kapitel, aufgabe, loesung, python, kopfrechnen)
VALUES (3, 'Was berechnet man in Python mit (a//b)*b, wenn a und b natürliche Zahlen sind?', 666, 0, 1);

INSERT INTO aufgaben (kapitel, aufgabe, loesung, python, kopfrechnen)
VALUES (3, 'Was passiert mit der Bina ̈rdarstellung, wenn man eine Zahl quadriert?', 666, 0, 1);

INSERT INTO aufgaben (kapitel, aufgabe, loesung, python, kopfrechnen)
VALUES (4, 'Geben Sie die 42te Primzahl an', 181, 1, 0);

INSERT INTO aufgaben (kapitel, aufgabe, loesung, python, kopfrechnen)
VALUES (4, 'Um wieviel Prozent weicht die Schätzung des Primzahlsatzes vom richtigen wert π(420 000 000) ab? Geben Sie eine grundete ganze Prozentzahl an.', 5, 1, 0);

INSERT INTO aufgaben (kapitel, aufgabe, loesung, python, kopfrechnen)
VALUES (4, 'p=2 760 727 302 517 ist eine Primzahl. Geben Sie den Kehrwert von 853 662 459 626 in Zp an.', 123456, 0, 1);

INSERT INTO aufgaben (kapitel, aufgabe, loesung, python, kopfrechnen)
VALUES (4, 'Geben Sie die Dezimalzahl 0.472727272727272..... als gekürzten Bruch an', 2655, 0, 1);

