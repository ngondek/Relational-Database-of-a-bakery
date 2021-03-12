-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-05-08 12:49:17.091

-- tables
-- Table: Osoba
CREATE TABLE Osoba (
    id_osoba number(8,0)  NOT NULL,
    Imie varchar2(20)  NOT NULL,
    Nazwisko varchar2(20)  NOT NULL,
    CONSTRAINT Osoba_pk PRIMARY KEY (id_osoba)
) ;

-- Table: Piekarnia
CREATE TABLE Piekarnia (
    id_piekarnia number(4,0)  NOT NULL,
    adres varchar2(20)  NOT NULL,
    miasto varchar2(10)  NOT NULL,
    CONSTRAINT Piekarnia_pk PRIMARY KEY (id_piekarnia)
) ;

-- Table: PiekarniaWyrob
CREATE TABLE PiekarniaWyrob (
    id_piekarnia number(4,0)  NOT NULL,
    id_wyrob number(4,0)  NOT NULL,
    pozostala_ilosc number(8,0)  NOT NULL,
    CONSTRAINT PiekarniaWyrob_pk PRIMARY KEY (id_piekarnia,id_wyrob)
) ;

-- Table: Pracownik
CREATE TABLE Pracownik (
    id_pracownik number(8,0)  NOT NULL,
    stanowisko varchar2(20)  NOT NULL,
    pensja number(8,2)  NOT NULL,
    data_zatrudnienia date  NOT NULL,
    id_piekarnia number(4,0)  NOT NULL,
    CONSTRAINT Pracownik_pk PRIMARY KEY (id_pracownik)
) ;

-- Table: Skladnik
CREATE TABLE Skladnik (
    id_skladnik number(4,0)  NOT NULL,
    nazwa varchar2(20)  NOT NULL,
    CONSTRAINT Skladnik_pk PRIMARY KEY (id_skladnik)
) ;

-- Table: Typ
CREATE TABLE Typ (
    id_typ number(4,0)  NOT NULL,
    nazwa varchar2(20)  NOT NULL,
    CONSTRAINT Typ_pk PRIMARY KEY (id_typ)
) ;

-- Table: Wyrob
CREATE TABLE Wyrob (
    id_wyrob number(4,0)  NOT NULL,
    nazwa varchar2(10)  NOT NULL,
    cena number(4,2)  NOT NULL,
    id_typ number(4,0)  NOT NULL,
    CONSTRAINT Wyrob_pk PRIMARY KEY (id_wyrob)
) ;

-- Table: WyrobSkladnik
CREATE TABLE WyrobSkladnik (
    id_wyrob number(4,0)  NOT NULL,
    id_skladnik number(4,0)  NOT NULL,
    CONSTRAINT WyrobSkladnik_pk PRIMARY KEY (id_wyrob,id_skladnik)
) ;

-- Table: Zamowienie
CREATE TABLE Zamowienie (
    id_zamowienie number(8,0)  NOT NULL,
    data_zamowienia date  NOT NULL,
    id_piekarnia number(4,0)  NOT NULL,
    id_osoba number(8,0)  NOT NULL,
    CONSTRAINT Zamowienie_pk PRIMARY KEY (id_zamowienie)
) ;

-- Table: ZamowienieWyrob
CREATE TABLE ZamowienieWyrob (
    id_zamowienie number(8,0)  NOT NULL,
    id_wyrob number(4,0)  NOT NULL,
    ilosc_wyrobu number(3,0)  NOT NULL,
    CONSTRAINT ZamowienieWyrob_pk PRIMARY KEY (id_zamowienie,id_wyrob)
) ;

-- foreign keys
-- Reference: PiekarniaWyrob_Piekarnia (table: PiekarniaWyrob)
ALTER TABLE PiekarniaWyrob ADD CONSTRAINT PiekarniaWyrob_Piekarnia
    FOREIGN KEY (id_piekarnia)
    REFERENCES Piekarnia (id_piekarnia);

-- Reference: PiekarniaWyrob_Wyrob (table: PiekarniaWyrob)
ALTER TABLE PiekarniaWyrob ADD CONSTRAINT PiekarniaWyrob_Wyrob
    FOREIGN KEY (id_wyrob)
    REFERENCES Wyrob (id_wyrob);

-- Reference: Pracownik_Osoba (table: Pracownik)
ALTER TABLE Pracownik ADD CONSTRAINT Pracownik_Osoba
    FOREIGN KEY (id_pracownik)
    REFERENCES Osoba (id_osoba);

-- Reference: Pracownik_Piekarnia (table: Pracownik)
ALTER TABLE Pracownik ADD CONSTRAINT Pracownik_Piekarnia
    FOREIGN KEY (id_piekarnia)
    REFERENCES Piekarnia (id_piekarnia);

-- Reference: WyrobSkladnik_Skladnik (table: WyrobSkladnik)
ALTER TABLE WyrobSkladnik ADD CONSTRAINT WyrobSkladnik_Skladnik
    FOREIGN KEY (id_skladnik)
    REFERENCES Skladnik (id_skladnik);

-- Reference: WyrobSkladnik_Wyrob (table: WyrobSkladnik)
ALTER TABLE WyrobSkladnik ADD CONSTRAINT WyrobSkladnik_Wyrob
    FOREIGN KEY (id_wyrob)
    REFERENCES Wyrob (id_wyrob);

-- Reference: Wyrob_Typ (table: Wyrob)
ALTER TABLE Wyrob ADD CONSTRAINT Wyrob_Typ
    FOREIGN KEY (id_typ)
    REFERENCES Typ (id_typ);

-- Reference: ZamowienieWyrob_Wyrob (table: ZamowienieWyrob)
ALTER TABLE ZamowienieWyrob ADD CONSTRAINT ZamowienieWyrob_Wyrob
    FOREIGN KEY (id_wyrob)
    REFERENCES Wyrob (id_wyrob);

-- Reference: ZamowienieWyrob_Zamowienie (table: ZamowienieWyrob)
ALTER TABLE ZamowienieWyrob ADD CONSTRAINT ZamowienieWyrob_Zamowienie
    FOREIGN KEY (id_zamowienie)
    REFERENCES Zamowienie (id_zamowienie);

-- Reference: Zamowienie_Osoba (table: Zamowienie)
ALTER TABLE Zamowienie ADD CONSTRAINT Zamowienie_Osoba
    FOREIGN KEY (id_osoba)
    REFERENCES Osoba (id_osoba);

-- Reference: Zamowienie_Piekarnia (table: Zamowienie)
ALTER TABLE Zamowienie ADD CONSTRAINT Zamowienie_Piekarnia
    FOREIGN KEY (id_piekarnia)
    REFERENCES Piekarnia (id_piekarnia);

-- End of file.

