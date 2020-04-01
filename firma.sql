-- TABELA PRACOWNICY --
CREATE TABLE pracownicy(
Id_pracownika serial unique PRIMARY KEY NOT NULL, 
Nazwisko VARCHAR(50),
Imie VARCHAR(50),
Adres VARCHAR(100),
Telefon VARCHAR(12)
);

-- TABELA GODZINY --
CREATE TABLE godziny(
id_godziny serial unique PRIMARY KEY NOT NULL,
Data DATE,
Liczba_godzin INT,
Id_pracownika serial unique NOT NULL
);

-- TABELA PENSJE --
CREATE TABLE pensje(
Id_pensji serial unique PRIMARY KEY NOT NULL,
Stanowisko VARCHAR(40), 
Kwota INT, 
Id_premii serial unique NOT NULL
);

-- TABELA PREMIE --
CREATE TABLE premie(
Id_premii serial unique PRIMARY KEY NOT NULL,
Rodzaj VARCHAR(35),
Kwota INT
);

ALTER TABLE premie
ADD FOREIGN KEY (Id_premii) REFERENCES pensje(Id_premii);

ALTER TABLE godziny
ADD FOREIGN KEY(Id_pracownika) REFERENCES pracownicy(Id_pracownika);



INSERT INTO pracownicy VALUES(1, 'Jan', 'Kowalski', 'Krakowska 9', '746392837');
INSERT INTO pracownicy VALUES(2, 'Adam', 'Nowak', 'Długa 21', '928374989');
INSERT INTO pracownicy VALUES(3, 'Anna', 'Nowakowska', 'Brzozowa 57', '628987598');
INSERT INTO pracownicy VALUES(4, 'Danuta', 'Grabowska', 'Polna 32', '627878342');
INSERT INTO pracownicy VALUES(5, 'Paweł', 'Lewandowski', 'Słoneczna 64', '712324261');
INSERT INTO pracownicy VALUES(6, 'Ignacy', 'Wojciechowski', 'Lipowa 15', '726354798');
INSERT INTO pracownicy VALUES(7, 'Maria', 'Mazur', 'Kwiatowa 83', '527367821');
INSERT INTO pracownicy VALUES(8, 'Monika', 'Michalska', 'Krótka 45', '545652936');
INSERT INTO pracownicy VALUES(9, 'Andrzej', 'Kaczmarek', 'Szkolna 123', '627387898');
INSERT INTO pracownicy VALUES(10, 'Małgorzata', 'Pawłowska', 'Akacjowa 14', '523437956');


INSERT INTO godziny VALUES(1, '2020-03-25', 4, 2);
INSERT INTO godziny VALUES(2, '2020-03-25', 8, 7);
INSERT INTO godziny VALUES(3, '2020-03-25', 8, 4);
INSERT INTO godziny VALUES(4, '2020-03-25', 7, 5);
INSERT INTO godziny VALUES(5, '2020-03-25', 9, 1);
INSERT INTO godziny VALUES(6, '2020-03-25', 8, 8);
INSERT INTO godziny VALUES(7, '2020-03-25', 8, 3);
INSERT INTO godziny VALUES(8, '2020-03-25', 10, 6);
INSERT INTO godziny VALUES(9, '2020-03-25', 9, 10);
INSERT INTO godziny VALUES(10, '2020-03-25', 7, 9);


INSERT INTO pensje VALUES(1, 'Księgowy', 2900.00, 2);
INSERT INTO pensje VALUES(2, 'Dyrektor generalny', 8500.00, 3);
INSERT INTO pensje VALUES(3, 'Sekretarka', 2800.00, 7);
INSERT INTO pensje VALUES(4, 'Programista', 4800.00, 1);
INSERT INTO pensje VALUES(5, 'Administrator baz danych', 4500.00, 5);
INSERT INTO pensje VALUES(6, 'Recepcjonistka', 2500.00, 8);
INSERT INTO pensje VALUES(7, 'Konsultant call center', 2800.00, 4);
INSERT INTO pensje VALUES(8, 'Specjalista ds. szkoleń', 3000.00, 6);
INSERT INTO pensje VALUES(9, 'Kierownik działu marketingu', 3800.00, 9);
INSERT INTO pensje VALUES(10, 'Asystent w dziale marketingu', 2400.00, 10);


INSERT INTO premie VALUES(1, 'Premia indywidualna', 500.00);
INSERT INTO premie VALUES(2, 'Premia zadaniowa', 700.00);
INSERT INTO premie VALUES(3, 'Premia uznaniowa', 600.00);
INSERT INTO premie VALUES(4, 'Premia świąteczna', 350.00);
INSERT INTO premie VALUES(5, 'Premia motywacyjna', 400.00);
INSERT INTO premie VALUES(6, 'Premia regulaminowa', 500.00);
INSERT INTO premie VALUES(7, 'Premia uznaniowa', 600.00);
INSERT INTO premie VALUES(8, 'Premia dla najlepszego pracownika', 900.00);
INSERT INTO premie VALUES(9, 'Premia wynikowa', 500.00);
INSERT INTO premie VALUES(10, 'Premia zespołowa', 300.00);