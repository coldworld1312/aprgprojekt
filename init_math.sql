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
    python INTEGER,
    kopfrechnen INTEGER
);

INSERT INTO users (username, userpassword) VALUES ('lion', 'lion');

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (1, 'Geben sie die Summe der ersten 100 ungeraden Zahlen an.', 10000, 1, 1);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (1, 'geben sie die Summe der ersten 50 natürlichen Zahlen an, die größer als 200 sind.', 11526, 1, 1);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (2, 'Konvertieren sie die Zahl 1234567 in das Siebenersystem', 13331215, 1, 1);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (2, 'Geben sie die Summe der ersten 100 natürlichen Zahlen an, die durch 7 teilbar sind', 34650, 1, 1);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (3, 'Berechnen sie in Z/17Z den wert 7*7+10*7', 0, 0, 1);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (3, 'Geben sie von der Binärdarstellung von (100**14000)+3 die letzten beiden Bits an', 11, 0, 1);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (5, 'Der Größte gemeinsame Teiler von 18 und 11 ist 1. Geben sie Zwei ganze Zahlen a und b an, so dass 1=18a+11b gilt.', 123456, 0, 1);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (5, 'Geben sie den Größten gemeinsamen Teiler von 471 694 074 821, 471 776 128 373 und 471 757 130 107 an.', 471, 1, 0);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (6, 'Geben sie Zwei Zahlen aus Z/27Z an deren Produkt verschwindet obwohl beide Zahlen nicht Null sind.', 123456, 0, 1);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (6, 'Für wieviele Zahlen a aus Z/42Z ist die Gleichung 5x=a in Z/42Z nicht lösbar', 42, 1, 1);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (7, 'Die aufgaben aus kapitel sieben sind schwer als einfacher text darzustellen', 666, 0, 0);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (7, 'Die aufgaben aus kapitel sieben sind schwer als einfacher text darzustellen', 666, 0, 0);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (8, 'Geben sie die 42te Primzahl an', 181, 1, 1);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (8, 'Um wieviel Prozent weicht die Schätzung des Primzahlsatzes vom richtigen wert π(420 000 000) ab? Geben sie eine grundete ganze Prozentzahl an.', 5, 1, 0);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (9, 'p=2 760 727 302 517 ist eine Primzahl. Geben sie den Kehrwert von 853 662 459 626 in Zp an.', 123456, 1, 0);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (10, 'Geben sie die Dezimalzahl 0.472727272727272..... als gekürzten Bruch an', 2655, 0, 1);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (10, 'Kapitel 10 hat zu wenig passende Aufgaben', 123456, 0, 0);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (11, 'Kap.11 hat keine Aufgaben', 123456, 0, 0);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (11, 'kap.11 hat keine Aufgaben', 123456, 0, 0);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (12, 'Kap.12 hat auch keine Aufgaben', 0, 0, 0);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (12, 'Kap.12 hat auch keine Aufgaben', 0, 0, 0);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (13, 'Geben sie die Binärzahl 0.1011 dezimal als Bruch an', 1116, 0, 1);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (13, 'gebens ei die Binärzahl 0.001010101010101.... dezimal als gekürzten Bruch an', 424, 0, 1);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (14, 'Geben sie einen Bruch an, der sich von (Wurzel3) um weniger als 10**-14 unterscheidet.', 173206100000, 1, 0);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (14, 'Geben sie einen Bruch q an der die folgenden drei Bedingungen erfüllt: 1) q ist Grösser als (Wurzel5), 2) q-(Wurzel5)is kleiner als 10**-4, 3) Der Nenner von q ist positiv und kleiner als 100 000', 16172, 1, 0);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (15, 'Geben sie die Zahl an, die unter den Elementen der Menge {z/n : z,n}', NULL, NULL, NULL);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (15, 'ich hab kein bock mehr', 123456, 1, 1);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (16, 'sei A={1,2,3} und B={2,3,4} geben sie ein geordnetes paar an, das Element von A**2\\B**2, aber NICHT Element von (A\\B)**2 ist', 123456, 1, 1);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (16, 'Sei A die menge der ersten 23 Primzahlen und B die Menge {ggT(m,n): m,n € A}. Geben sie die Mächtigkeit von B an', 24, 1, 1);

INSERT INTO aufgaben (kapitel, aufgabe, lösung, python, kopfrechnen)
VALUES (17, 'Wieviele Teilmengen von {5,6,7,8,9,10,11,12,13,14,15,16,17} gibt es die Mindestens eine Primzahl beinhalten?', 123456, 1, 1);
