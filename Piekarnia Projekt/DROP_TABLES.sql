-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-05-08 12:49:17.091

-- foreign keys
ALTER TABLE PiekarniaWyrob
    DROP CONSTRAINT PiekarniaWyrob_Piekarnia;

ALTER TABLE PiekarniaWyrob
    DROP CONSTRAINT PiekarniaWyrob_Wyrob;

ALTER TABLE Pracownik
    DROP CONSTRAINT Pracownik_Osoba;

ALTER TABLE Pracownik
    DROP CONSTRAINT Pracownik_Piekarnia;

ALTER TABLE WyrobSkladnik
    DROP CONSTRAINT WyrobSkladnik_Skladnik;

ALTER TABLE WyrobSkladnik
    DROP CONSTRAINT WyrobSkladnik_Wyrob;

ALTER TABLE Wyrob
    DROP CONSTRAINT Wyrob_Typ;

ALTER TABLE ZamowienieWyrob
    DROP CONSTRAINT ZamowienieWyrob_Wyrob;

ALTER TABLE ZamowienieWyrob
    DROP CONSTRAINT ZamowienieWyrob_Zamowienie;

ALTER TABLE Zamowienie
    DROP CONSTRAINT Zamowienie_Osoba;

ALTER TABLE Zamowienie
    DROP CONSTRAINT Zamowienie_Piekarnia;

-- tables
DROP TABLE Osoba;

DROP TABLE Piekarnia;

DROP TABLE PiekarniaWyrob;

DROP TABLE Pracownik;

DROP TABLE Skladnik;

DROP TABLE Typ;

DROP TABLE Wyrob;

DROP TABLE WyrobSkladnik;

DROP TABLE Zamowienie;

DROP TABLE ZamowienieWyrob;

-- End of file.

