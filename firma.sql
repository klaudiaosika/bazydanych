CREATE SCHEMA ksiegowosc;

CREATE TABLE ksiegowosc.pracownicy(ID_Pracownika VARCHAR(3) PRIMARY KEY NOT NULL, Imie VARCHAR(20), Nazwisko VARCHAR(20), Adres VARCHAR(100), Telefon VARCHAR(12));
CREATE TABLE ksiegowosc.godziny(ID_Godziny VARCHAR(3) PRIMARY KEY NOT NULL, Data DATE, Liczba_Godzin INT, ID_Pracownika VARCHAR(3) REFERENCES ksiegowosc.pracownicy(ID_Pracownika));
CREATE TABLE ksiegowosc.pensja(ID_Pensji VARCHAR(3) PRIMARY KEY NOT NULL, Stanowisko VARCHAR(30), Kwota INT);
CREATE TABLE ksiegowosc.premia(ID_Premii VARCHAR(4) PRIMARY KEY NOT NULL, Rodzaj VARCHAR(40), Kwota INT);
CREATE TABLE ksiegowosc.wynagrodzenie(ID_Wynagrodzenia VARCHAR(3) PRIMARY KEY NOT NULL, Data DATE, ID_Pracownika VARCHAR(3) REFERENCES ksiegowosc.pracownicy(ID_Pracownika), ID_Godziny VARCHAR(3) REFERENCES ksiegowosc.godziny(ID_Godziny), ID_Pensji VARCHAR(3) REFERENCES ksiegowosc.pensja(ID_Pensji), ID_Premii VARCHAR(4) REFERENCES ksiegowosc.premia(ID_Premii));

COMMENT ON TABLE ksiegowosc.pracownicy IS 'Tabela zawierająca dane wszystkich pracowników firmy.'
COMMENT ON TABLE ksiegowosc.godziny IS 'Tabela zawierająca godziny pracy wszystkich pracowników firmy. Nadgodziny - powyżej 160h.'
COMMENT ON TABLE ksiegowosc.pensja IS 'Tabela zawierająca pensję oraz stanowiska wszystkich pracowników firmy.'
COMMENT ON TABLE ksiegowosc.premia IS 'Tabela zawierająca kwotę oraz rodzaj premii wszystkich pracowników firmy.'
COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'Tabela zawierająca wynagrodzenia wszystkich pracowników firmy.'

INSERT INTO ksiegowosc.pracownicy VALUES(1, 'Adam', 'Nowak', 'Krakowska 20', '783927483');
INSERT INTO ksiegowosc.pracownicy VALUES(2, 'Jan', 'Kowalski', 'Brzozowa 25', '927384987');
INSERT INTO ksiegowosc.pracownicy VALUES(3, 'Monika', 'Nowakowska', 'Lipowa 200', '687898123');
INSERT INTO ksiegowosc.pracownicy VALUES(4, 'Julia', 'Adamska', 'Słoneczna 44', '576879870');
INSERT INTO ksiegowosc.pracownicy VALUES(5, 'Maria', 'Konarska', 'Deszczowa 3', '567234534');
INSERT INTO ksiegowosc.pracownicy VALUES(6, 'Andrzej', 'Mazur', 'Szkolna 339', '510029370');
INSERT INTO ksiegowosc.pracownicy VALUES(7, 'Paweł', 'Grabowski', 'Akacjowa 14', '989172830');
INSERT INTO ksiegowosc.pracownicy VALUES(8, 'Anna', 'Pawłowska', 'Cicha 30', '718239283');
INSERT INTO ksiegowosc.pracownicy VALUES(9, 'Karol', 'Kozłowski', 'Szeroka 67', '627384978');
INSERT INTO ksiegowosc.pracownicy VALUES(10, 'Patrycja', 'Kaczmarek', 'Wysoka 50', '593821600');

INSERT INTO ksiegowosc.godziny VALUES('G1', '15.05.2020', 154, 1);
INSERT INTO ksiegowosc.godziny VALUES('G2', '16.05.2020', 139, 3);
INSERT INTO ksiegowosc.godziny VALUES('G3', '17.05.2020', 145, 6);
INSERT INTO ksiegowosc.godziny VALUES('G4', '25.05.2020', 85, 8);
INSERT INTO ksiegowosc.godziny VALUES('G5', '20.05.2020', 92, 2);
INSERT INTO ksiegowosc.godziny VALUES('G6', '14.05.2020', 74, 4);
INSERT INTO ksiegowosc.godziny VALUES('G7', '18.05.2020', 121, 5);
INSERT INTO ksiegowosc.godziny VALUES('G8', '19.05.2020', 161, 9);
INSERT INTO ksiegowosc.godziny VALUES('G9', '15.05.2020', 168, 7);
INSERT INTO ksiegowosc.godziny VALUES('G10', '24.05.2020', 110, 10);

INSERT INTO ksiegowosc.pensja VALUES('P1', 'Księgowy', 2800.00);
INSERT INTO ksiegowosc.pensja VALUES('P2', 'Dyrektor generalny', 8500.00);
INSERT INTO ksiegowosc.pensja VALUES('P3', 'Administrator baz danych', 4500.00);
INSERT INTO ksiegowosc.pensja VALUES('P4', 'Recepcjonistka', 2500.00);
INSERT INTO ksiegowosc.pensja VALUES('P5', 'Księgowy', 3000.00);
INSERT INTO ksiegowosc.pensja VALUES('P6', 'Kierownik działu marketingu', 3800.00);
INSERT INTO ksiegowosc.pensja VALUES('P7', 'Księgowy', 2900.00);
INSERT INTO ksiegowosc.pensja VALUES('P8', 'Sprzątaczka', 900.00);
INSERT INTO ksiegowosc.pensja VALUES('P9', 'Konsultant call center', 2700.00);
INSERT INTO ksiegowosc.pensja VALUES('P10', 'Sekretarka', 2800.00);

INSERT INTO ksiegowosc.premia VALUES('PR1', 'Premia indywidualna', 500.00);
INSERT INTO ksiegowosc.premia VALUES('PR2', 'Premia zadaniowa', 700.00);
INSERT INTO ksiegowosc.premia VALUES('PR3', 'Premia uznaniowa', 600.00);
INSERT INTO ksiegowosc.premia VALUES('PR4', 'Premia świąteczna', 350.00);
INSERT INTO ksiegowosc.premia VALUES('PR5', 'Premia motywacyjna', 400.00);
INSERT INTO ksiegowosc.premia VALUES('PR6', 'Premia regulaminowa', 500.00);
INSERT INTO ksiegowosc.premia VALUES('PR7', 'Premia dla najlepszego pracownika', 900.00);
INSERT INTO ksiegowosc.premia VALUES('PR8', 'Premia kwartalna', 500.00);
INSERT INTO ksiegowosc.premia VALUES('PR9', 'Premia zespołowa', 300.00);
INSERT INTO ksiegowosc.premia VALUES('PR10', NULL, 0);

INSERT INTO ksiegowosc.wynagrodzenie VALUES('W1', '28.05.2020', 1, 'G1', 'P1', 'PR1');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('W2', '28.05.2020', 6, 'G3', 'P4', 'PR6');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('W3', '28.05.2020', 2, 'G5', 'P2', 'PR7');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('W4', '27.05.2020', 7, 'G9', 'P9', 'PR10');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('W5', '28.05.2020', 10, 'G10', 'P10', 'PR9');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('W6', '27.05.2020', 3, 'G2', 'P7', 'PR3');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('W7', '26.05.2020', 8, 'G4', 'P8', 'PR2');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('W8', '28.05.2020', 9, 'G8', 'P3', 'PR4');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('W9', '28.05.2020', 4, 'G6', 'P5', 'PR5');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('W10', '27.05.2020', 5, 'G7', 'P6', 'PR8');

SELECT * FROM ksiegowosc.pracownicy;
SELECT * FROM ksiegowosc.godziny;
SELECT * FROM ksiegowosc.pensja;
SELECT * FROM ksiegowosc.premia;
SELECT * FROM ksiegowosc.wynagrodzenie;

--a
SELECT ID_Pracownika, Nazwisko FROM ksiegowosc.pracownicy;

-- b
SELECT ID_Pracownika, kwota FROM ksiegowosc.wynagrodzenie, ksiegowosc.pensja 
WHERE ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji 
AND ksiegowosc.pensja.kwota > 1000

-- c
SELECT ID_Pracownika FROM ksiegowosc.wynagrodzenie, ksiegowosc.pensja, ksiegowosc.premia 
WHERE ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii 
AND ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji 
AND ksiegowosc.premia.kwota = 0 AND ksiegowosc.pensja.kwota > 2000;

-- d
SELECT * FROM ksiegowosc.pracownicy WHERE Imie LIKE 'J%';

-- e
SELECT * FROM ksiegowosc.pracownicy WHERE Nazwisko LIKE '%n%' 
OR Nazwisko LIKE '%n' OR Nazwisko LIKE 'N%' AND Imie LIKE '%a';

-- f
SELECT Imie, Nazwisko, (liczba_godzin - 160) AS nadgodziny FROM ksiegowosc.pracownicy, ksiegowosc.godziny 
WHERE ksiegowosc.pracownicy.id_pracownika = ksiegowosc.godziny.id_pracownika 
AND ksiegowosc.godziny.liczba_godzin > 160;

-- g
SELECT Imie, Nazwisko FROM ksiegowosc.pracownicy, ksiegowosc.wynagrodzenie, ksiegowosc.pensja 
WHERE ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika 
AND ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji 
AND ksiegowosc.pensja.kwota > 1500 AND ksiegowosc.pensja.kwota < 3000;

-- h
SELECT imie, nazwisko FROM ksiegowosc.wynagrodzenie, ksiegowosc.pracownicy, ksiegowosc.godziny, ksiegowosc.premia
WHERE ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
AND ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii  
AND ksiegowosc.wynagrodzenie.id_godziny = ksiegowosc.godziny.id_godziny
AND ksiegowosc.premia.kwota = 0 AND ksiegowosc.godziny.liczba_godzin > 160;

-- i
SELECT imie, nazwisko, ksiegowosc.pensja.kwota FROM ksiegowosc.pracownicy, ksiegowosc.wynagrodzenie, ksiegowosc.pensja
WHERE ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji 
AND ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika ORDER BY Kwota DESC

-- j
SELECT imie, nazwisko, ksiegowosc.pensja.kwota AS pensja, ksiegowosc.premia.kwota AS premia
FROM ksiegowosc.pracownicy, ksiegowosc.wynagrodzenie, ksiegowosc.pensja, ksiegowosc.premia 
WHERE ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji 
AND ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii 
AND ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
ORDER BY ksiegowosc.pensja.kwota DESC, ksiegowosc.premia.kwota DESC;

-- k
SELECT COUNT(Stanowisko) AS Liczba_Pracownikow, Stanowisko FROM ksiegowosc.pensja GROUP BY Stanowisko;

-- l
SELECT AVG(Kwota) AS Srednia_Płaca, MIN(Kwota), MAX(Kwota) FROM ksiegowosc.pensja 
WHERE Stanowisko LIKE 'Księgowy';

-- m
SELECT SUM(pensja.kwota) + SUM(premia.kwota) AS Suma_Wynagrodzeń FROM ksiegowosc.pensja, ksiegowosc.premia;

-- n
SELECT Stanowisko, SUM(pensja.kwota) + SUM(premia.kwota) AS wynagrodzenie 
FROM ksiegowosc.wynagrodzenie, ksiegowosc.pensja, ksiegowosc.premia
WHERE ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii
AND ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
GROUP BY Stanowisko;

-- o
SELECT COUNT(Rodzaj) AS Liczba_Premii, Stanowisko
FROM ksiegowosc.premia, ksiegowosc.wynagrodzenie, ksiegowosc.pensja
WHERE wynagrodzenie.id_premii = premia.id_premii 
AND wynagrodzenie.id_pensji = pensja.id_pensji GROUP BY Stanowisko

-- p
DELETE FROM ksiegowosc.wynagrodzenie USING ksiegowosc.pensja 
WHERE ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji 
AND ksiegowosc.pensja.kwota < 1200;
