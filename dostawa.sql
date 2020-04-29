CREATE TABLE produkt(ID_Produktu varchar(6) PRIMARY KEY NOT NULL, Nazwa_Produktu varchar(15), Cena_Netto varchar(6), Cena_Brutto varchar(6));
CREATE TABLE dostawca(ID_Dostawcy varchar(7) PRIMARY KEY NOT NULL, Dostawca varchar(25), Ulica varchar(20), Numer_Mieszkanie varchar(7), Kod_Pocztowy varchar(6) NOT NULL);
CREATE TABLE kod(Kod_Pocztowy varchar(6) PRIMARY KEY NOT NULL, Miasto varchar(10));
CREATE TABLE zamówienia(ID_Zamowienia INT PRIMARY KEY NOT NULL, ID_Produktu varchar(6) NOT NULL, ID_Dostawcy varchar(7) NOT NULL);

ALTER TABLE zamówienia ADD FOREIGN KEY (ID_Produktu) REFERENCES produkt(ID_Produktu);
ALTER TABLE zamówienia ADD FOREIGN KEY (ID_Dostawcy) REFERENCES dostawca(ID_Dostawcy);
ALTER TABLE dostawca ADD FOREIGN KEY (Kod_Pocztowy) REFERENCES kod(Kod_Pocztowy);

INSERT INTO produkt VALUES('MakNit', 'Makaron Nitki', '130 zł', '150 zł');
INSERT INTO produkt VALUES('KecPik', 'Keczup Pikantny', '200 zł', '220 zł');
INSERT INTO produkt VALUES('SosPom', 'Sos Pomidorowy', '89 zł', '110 zł');

INSERT INTO kod VALUES('31-435', 'Kraków');
INSERT INTO kod VALUES('31-342', 'Kraków');
INSERT INTO kod VALUES('04-242', 'Lublin');
INSERT INTO kod VALUES('30-243', 'Tarnów');
INSERT INTO kod VALUES('35-434', 'Nowy Targ');

INSERT INTO dostawca VALUES('MakPol', 'Makarony Polskie', 'Turystyczna', '40', '31-435');
INSERT INTO dostawca VALUES('PolPrze', 'Polskie Przetwory', 'Wojska Polskiego', '44a', '31-342');
INSERT INTO dostawca VALUES('LubMak', 'Lubelski Makaron', 'Piłsudskiego', '332a', '04-242');
INSERT INTO dostawca VALUES('PrzePom', 'Przetwory Pomidorowe', 'Rolnicza', '22/4', '30-243');
INSERT INTO dostawca VALUES('MałSma', 'Małopolskie Smaki', 'Mickiewicza', '223/77', '35-434');

INSERT INTO zamówienia VALUES( 1, 'MakNit', 'MakPol');
INSERT INTO zamówienia VALUES( 2, 'KecPik', 'PolPrze');
INSERT INTO zamówienia VALUES( 3, 'SosPom', 'PolPrze');
INSERT INTO zamówienia VALUES( 4, 'MakNit', 'LubMak');
INSERT INTO zamówienia VALUES( 5, 'KecPik', 'PrzePom');
INSERT INTO zamówienia VALUES( 6, 'SosPom', 'MałSma');