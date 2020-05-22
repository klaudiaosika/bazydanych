--a
UPDATE ksiegowosc.pracownicy SET Telefon =  '(+48)' || Telefon;

--b
UPDATE ksiegowosc.pracownicy SET Telefon = SUBSTRING(ksiegowosc.pracownicy.telefon, 1, 8) || '-' || SUBSTRING(ksiegowosc.pracownicy.telefon, 9, 3) || '-' || SUBSTRING(ksiegowosc.pracownicy.telefon, 12, 3);

--c
SELECT ID_Pracownika, Imie, UPPER(Nazwisko) AS Nazwisko, Adres, Telefon 
FROM ksiegowosc.pracownicy ORDER BY LENGTH(Nazwisko) DESC LIMIT 1;

--d
ALTER TABLE ksiegowosc.pensja ALTER COLUMN kwota TYPE VARCHAR(10);
SELECT ksiegowosc.pracownicy.*, MD5(ksiegowosc.pensja.kwota) AS pensja_md5 FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika 
JOIN ksiegowosc.pensja ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji;

--f
SELECT ksiegowosc.pracownicy.*, pensja.kwota AS pensja, premia.kwota AS premia 
FROM ksiegowosc.pracownicy LEFT JOIN ksiegowosc.wynagrodzenie 
ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika 
LEFT JOIN ksiegowosc.pensja ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji 
LEFT JOIN ksiegowosc.premia ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii;

--g
ALTER TABLE ksiegowosc.pensja ALTER COLUMN kwota TYPE INT USING kwota::integer;
SELECT CONCAT('Pracownik ', ksiegowosc.pracownicy.imie, ' ', ksiegowosc.pracownicy.nazwisko,
', w dniu ', ksiegowosc.godziny.data, ' otrzymał pensję całkowitą na kwotę ',
(ksiegowosc.pensja.kwota + ksiegowosc.premia.kwota), 'zł, gdzie wynagrodzenie zasadnicze wynosilo: ',
ksiegowosc.pensja.kwota, 'zł, premia:', ksiegowosc.premia.kwota, 'zł, nadgodziny: ',(ksiegowosc.godziny.liczba_godzin - 160)) AS raport
FROM ksiegowosc.pracownicy, ksiegowosc.godziny, ksiegowosc.pensja, ksiegowosc.premia, ksiegowosc.wynagrodzenie
WHERE ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
AND ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji
AND ksiegowosc.premia.id_premii = ksiegowosc.wynagrodzenie.id_premii
AND ksiegowosc.godziny.id_godziny = ksiegowosc.wynagrodzenie.id_godziny;