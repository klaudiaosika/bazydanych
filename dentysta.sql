CREATE TABLE wizyta(ID_Wizyty varchar(2) PRIMARY KEY NOT NULL, ID_Pracownika varchar(5) NOT NULL, ID_Pacjenta varchar(4) NOT NULL, ID_Zabiegu varchar(4) NOT NULL, Data_Wizyty date, Godzina_Wizyty varchar(5));
CREATE TABLE pracownicy(ID_Pracownika varchar(5) PRIMARY KEY NOT NULL, Imie_Lekarza varchar(10) NOT NULL, Nazwisko_Lekarza varchar(15) NOT NULL);
CREATE TABLE pacjenci(ID_Pacjenta varchar(4) PRIMARY KEY NOT NULL, Imie_Pacjenta varchar(10) NOT NULL, Nazwisko_Pacjenta varchar(15) NOT NULL);
CREATE TABLE zabieg(ID_Zabiegu varchar(4) PRIMARY KEY NOT NULL, Nazwa_Zabiegu varchar(20) NOT NULL);

ALTER TABLE wizyta ADD FOREIGN KEY (ID_Pracownika) REFERENCES pracownicy(ID_Pracownika);
ALTER TABLE wizyta ADD FOREIGN KEY (ID_Pacjenta) REFERENCES pacjenci(ID_Pacjenta);
ALTER TABLE wizyta ADD FOREIGN KEY (ID_Zabiegu) REFERENCES zabieg(ID_Zabiegu);

INSERT INTO pracownicy VALUES('S1011', 'Maria', 'Nowak');
INSERT INTO pracownicy VALUES('S1024', 'Jan', 'Kowalski');
INSERT INTO pracownicy VALUES('S1045', 'Anna', 'Jabłońska');
INSERT INTO pracownicy VALUES('S1034', 'Marek', 'Potocki');

INSERT INTO pacjenci VALUES('P100', 'Anna', 'Jeleń');
INSERT INTO pacjenci VALUES('P105', 'Jarosław', 'Nicpoń');
INSERT INTO pacjenci VALUES('P108', 'Joanna', 'Nosek');
INSERT INTO pacjenci VALUES('P120', 'Jan', 'Kałuża');
INSERT INTO pacjenci VALUES('P130', 'Jerzy', 'Lis');
INSERT INTO pacjenci VALUES('P123', 'Olga', 'Nowacka');

INSERT INTO zabieg VALUES('Z500', 'Borowanie');
INSERT INTO zabieg VALUES('Z496', 'Lakowanie');
INSERT INTO zabieg VALUES('Z503', 'Usuwanie kamienia');

INSERT INTO wizyta VALUES('W1', 'S1011', 'P100', 'Z500', '12.03.2020', '10:00');
INSERT INTO wizyta VALUES('W2', 'S1011', 'P105', 'Z496', '12.03.2020', '13.00');
INSERT INTO wizyta VALUES('W3', 'S1011', 'P108', 'Z500', '14.03.2020', '10.00');
INSERT INTO wizyta VALUES('W4', 'S1024', 'P108', 'Z503', '16.03.2020', '17.00');
INSERT INTO wizyta VALUES('W5', 'S1045', 'P120', 'Z500', '18.03.2020', '09.00');
INSERT INTO wizyta VALUES('W6', 'S1034', 'P130', 'Z496', '20.03.2020', '08.00');
INSERT INTO wizyta VALUES('W7', 'S1034', 'P123', 'Z503', '12.03.2020', '15.00');