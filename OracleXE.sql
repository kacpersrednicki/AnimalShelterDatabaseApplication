/*
Created: 24.11.2023
Modified: 27.11.2023
Project: Schronisko dla zwierz�t
Model: Model logiczny
Company: EITI
Author: Maciej Lipski, Kacper �rednicki
Database: Oracle 19c
*/

-- Create sequences section -------------------------------------------------
CREATE SEQUENCE Sequence_Nr_placowki
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/
CREATE SEQUENCE Sequence_Nr_boksu
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/
CREATE SEQUENCE Sequence_Nr_karmienia
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/
CREATE SEQUENCE Sequence_Nr_zwierzecia
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/
CREATE SEQUENCE Sequence_Nr_przypisania
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/
CREATE SEQUENCE Sequence_Nr_gatunek_rasa
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/
CREATE SEQUENCE Sequence_Nr_adoptujacego
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/
CREATE SEQUENCE Sequence_Nr_lekarstwa
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/
CREATE SEQUENCE Sequence_Nr_adresu
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/
CREATE SEQUENCE Sequence_Nr_stanowiska
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/
CREATE SEQUENCE Sequence_Nr_pracownika
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/
CREATE SEQUENCE Sequence_Nr_typu_wyposazenia
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/
CREATE SEQUENCE Sequence_Nr_otwarcia
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/
CREATE SEQUENCE Sequence_Nr_zajmowania_stanowisk
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/
CREATE SEQUENCE Sequence_Nr_posiadania_lekarstwa
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/
CREATE SEQUENCE Sequence_Nr_czasu_otwarcia
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/
CREATE SEQUENCE Sequence_Nr_poczty
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/
CREATE SEQUENCE Sequence_Nr_opiekowania
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/
CREATE SEQUENCE Sequence_Nr_przyjmowania
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/
CREATE SEQUENCE Sequence_Nr_wyposazenia
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/
CREATE SEQUENCE Sequence_Nr_posiadania_karmy
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/
CREATE SEQUENCE Sequence_Nr_wymiarow
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/
CREATE SEQUENCE Sequence_Nr_zamieszkiwania
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/
CREATE SEQUENCE Sequence_Nr_producenta
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/
CREATE SEQUENCE Sequence_Nr_karmy
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

-- Create tables section -------------------------------------------------

-- Table Placowki
CREATE TABLE Placowki(
  Nr_placowki Integer NOT NULL,
  Nazwa_placowki Varchar2(30 ) NOT NULL,
  Nr_telefonu Varchar2(12 ) NOT NULL,
  Adres_email Varchar2(20 ),
  Maks_liczba_zwierzat Integer NOT NULL,
  Nr_adresu Integer NOT NULL
)
/
-- Create indexes for table Placowki
CREATE INDEX IX_Relationship12 ON Placowki (Nr_adresu)
/
-- Add keys for table Placowki
ALTER TABLE Placowki ADD CONSTRAINT Unique_Identifier1 PRIMARY KEY (Nr_placowki)
/
-- Create triggers for table Placowki
CREATE TRIGGER Trigger1
  BEFORE
  ON Placowki
  BEGIN
    /*trigger_body*/
END;
/

-- Table Zwierzeta
CREATE TABLE Zwierzeta(
  Nr_zwierzecia Integer NOT NULL,
  Wiek Integer,
  Masa Integer NOT NULL,
  Data_przyjecia Date NOT NULL,
  Data_opuszczenia Date,
  Czy_szczepiony Char(1 ) NOT NULL,
  Czy_kastrowany Char(1 ) NOT NULL,
  Plec Varchar2(10 ) NOT NULL
        CHECK (Plec IN ('Samiec','Samica')),
  Opis Varchar2(1000 ),
  Imie Varchar2(20 ),
  Nr_adoptujacego Integer,
  Nr_gatunek_rasa Integer NOT NULL
)
/
-- Create indexes for table Zwierzeta
CREATE INDEX IX_Adoptuje ON Zwierzeta (Nr_adoptujacego)
/
CREATE INDEX IX_Relationship13 ON Zwierzeta (Nr_gatunek_rasa)
/
-- Add keys for table Zwierzeta
ALTER TABLE Zwierzeta ADD CONSTRAINT Unique_Identifier2 PRIMARY KEY (Nr_zwierzecia)
/

-- Table Boksy
CREATE TABLE Boksy(
  Nr_boksu Integer NOT NULL,
  Maks_liczba_zwierzat Integer NOT NULL,
  Nr_placowki Integer NOT NULL,
  Nr_wymiarow Integer NOT NULL
)
/
-- Create indexes for table Boksy
CREATE INDEX IX_Posiada ON Boksy (Nr_placowki)
/
CREATE INDEX IX_Relationship5 ON Boksy (Nr_wymiarow)
/
-- Add keys for table Boksy
ALTER TABLE Boksy ADD CONSTRAINT Unique_Identifier3 PRIMARY KEY (Nr_boksu)
/

-- Table Adoptujacy
CREATE TABLE Adoptujacy(
  Nr_adoptujacego Integer NOT NULL,
  Imie Varchar2(20 ) NOT NULL,
  Nazwisko Varchar2(30 ) NOT NULL,
  Nr_dokumentu Varchar2(10 ) NOT NULL,
  Pesel Char(11 ),
  Nr_telefonu Varchar2(12 ) NOT NULL,
  Adres_email Varchar2(20 ),
  Plec Char(1 ) NOT NULL
        CHECK (Plec IN ('M','K')),
  Nr_adresu Integer NOT NULL
)
/
-- Create indexes for table Adoptujacy
CREATE INDEX IX_Relationship15 ON Adoptujacy (Nr_adresu)
/
-- Add keys for table Adoptujacy
ALTER TABLE Adoptujacy ADD CONSTRAINT Unique_Identifier4 PRIMARY KEY (Nr_adoptujacego)
/
-- Table Lekarstwa
CREATE TABLE Lekarstwa(
  Nr_lekarstwa Integer NOT NULL,
  Nazwa Varchar2(20 ) NOT NULL,
  Dawka Varchar2(10 ) NOT NULL,
  Przeciwskazania Varchar2(200 ),
  Nr_producenta Integer NOT NULL
)
/
-- Create indexes for table Lekarstwa
CREATE INDEX IX_Relationship8 ON Lekarstwa (Nr_producenta)
/
-- Add keys for table Lekarstwa
ALTER TABLE Lekarstwa ADD CONSTRAINT Unique_Identifier6 PRIMARY KEY (Nr_lekarstwa)
/

-- Table Karmy
CREATE TABLE Karmy(
  Nr_karmy Integer NOT NULL,
  Nazwa Varchar2(20 ) NOT NULL,
  Data_waznosci Date NOT NULL,
  Nr_producenta Integer NOT NULL
)
/
-- Create indexes for table Karmy
CREATE INDEX IX_Relationship6 ON Karmy (Nr_producenta)
/
-- Add keys for table Karmy
ALTER TABLE Karmy ADD CONSTRAINT Unique_Identifier9 PRIMARY KEY (Nr_karmy)
/

-- Table Wyposazenia_egzemplarze
CREATE TABLE Wyposazenia_egzemplarze(
  Nr_wyposazenia Integer NOT NULL,
  Nr_placowki Integer NOT NULL,
  Nr_boksu Integer,
  Nr_typu_wyposazenia Integer NOT NULL
)
/
-- Create indexes for table Wyposazenia_egzemplarze
CREATE INDEX IX_Ma_na_stanie ON Wyposazenia_egzemplarze (Nr_placowki)
/
CREATE INDEX IX_Ma_na_stanie_wyposazenie ON Wyposazenia_egzemplarze (Nr_boksu)
/
CREATE INDEX IX_Relationship21 ON Wyposazenia_egzemplarze (Nr_typu_wyposazenia)
/
-- Add keys for table Wyposazenia_egzemplarze
ALTER TABLE Wyposazenia_egzemplarze ADD CONSTRAINT Unique_Identifier10 PRIMARY KEY (Nr_wyposazenia)
/

-- Table Pracownicy
CREATE TABLE Pracownicy(
  Nr_pracownika Integer NOT NULL,
  Imie Varchar2(20 ) NOT NULL,
  Nazwisko Varchar2(30 ) NOT NULL,
  Nr_dokumentu Varchar2(10 ) NOT NULL,
  Pesel Char(11 ),
  Nr_telefonu Varchar2(12 ) NOT NULL,
  Adres_email Varchar2(20 ),
  Plec Char(1 ) NOT NULL
        CHECK (Plec IN ('M','K')),
  Pensja Number(10,2),
  Czy_wolontariusz Char(1 ) NOT NULL,
  Nr_adresu Integer NOT NULL
)
/
-- Create indexes for table Pracownicy
CREATE INDEX IX_Relationship16 ON Pracownicy (Nr_adresu)
/
-- Add keys for table Pracownicy
ALTER TABLE Pracownicy ADD CONSTRAINT Unique_Identifier11 PRIMARY KEY (Nr_pracownika)
/

-- Table Zamieszkiwania
CREATE TABLE Zamieszkiwania(
  Nr_boksu Integer NOT NULL,
  Nr_zwierzecia Integer NOT NULL,
  Nr_zamieszkiwania Integer NOT NULL,
  Data_rozpoczecia Date NOT NULL,
  Data_zakonczenia Date
)
/

-- Table Przypisania_pracownikow
CREATE TABLE Przypisania_pracownikow(
  Nr_placowki Integer NOT NULL,
  Nr_pracownika Integer NOT NULL,
  Nr_przypisania Integer NOT NULL,
  Poczatek_przypisania Date NOT NULL,
  Koniec_przypisania Date
)
/
-- Table Posiadania_lekarstw
CREATE TABLE Posiadania_lekarstw(
  Nr_placowki Integer NOT NULL,
  Nr_lekarstwa Integer NOT NULL,
  Nr_posiadania_lekarstwa Integer NOT NULL,
  Ilosc_na_stanie Integer NOT NULL
)
/

-- Table Przyjmowania_lekarstw
CREATE TABLE Przyjmowania_lekarstw(
  Nr_zwierzecia Integer NOT NULL,
  Nr_lekarstwa Integer NOT NULL,
  Nr_przymowania Integer NOT NULL,
  Poczatek_przyjmowania Date NOT NULL,
  Koniec_przyjmowania Date
)
/

-- Table Posiadania_karm
CREATE TABLE Posiadania_karm(
  Nr_placowki Integer NOT NULL,
  Nr_karmy Integer NOT NULL,
  Nr_posiadania_karmy Integer NOT NULL,
  Ilosc_na_stanie Integer NOT NULL
)
/

-- Table Opiekowania

CREATE TABLE Opiekowania(
  Nr_pracownika Integer NOT NULL,
  Nr_zwierzecia Integer NOT NULL,
  Nr_opiekowania Integer NOT NULL,
  Poczatek_opiekowania Date NOT NULL,
  Koniec_opiekowania Date
)
/

-- Table Karmienia
CREATE TABLE Karmienia(
  Nr_karmy Integer NOT NULL,
  Nr_zwierzecia Integer NOT NULL,
  Nr_karmienia Integer NOT NULL,
  Data_rozpoczecia Date NOT NULL,
  Data_zakonczenia Date,
  Czestotliwosc Integer NOT NULL
)
/

-- Table and Columns comments section
COMMENT ON COLUMN Karmienia.Czestotliwosc IS 'Co ile godzin dostaje karm�'
/

-- Table Adresy
CREATE TABLE Adresy(
  Nr_adresu Integer NOT NULL,
  Ulica Varchar2(30 ) NOT NULL,
  Nr_budynku Varchar2(5 ) NOT NULL,
  Nr_mieszkania Varchar2(5 ),
  Nr_poczty Integer NOT NULL,
  Miasto Varchar2(30 ) NOT NULL
)
/
-- Create indexes for table Adresy
CREATE INDEX IX_Relationship9 ON Adresy (Nr_poczty)
/
-- Add keys for table Adresy
ALTER TABLE Adresy ADD CONSTRAINT PK_Adresy PRIMARY KEY (Nr_adresu)
/

-- Table Poczty
CREATE TABLE Poczty(
  Nr_poczty Integer NOT NULL,
  Kod_pocztowy Char(6 ) NOT NULL,
  Miasto Varchar2(30 ) NOT NULL
)
/
-- Add keys for table Poczty
ALTER TABLE Poczty ADD CONSTRAINT PK_Poczty PRIMARY KEY (Nr_poczty)
/
-- Table and Columns comments section
COMMENT ON COLUMN Poczty.Kod_pocztowy IS 'Format XX-XXX'
/

-- Table Czasy_otwarcia
CREATE TABLE Czasy_otwarcia(
  Nr_czasu_otwarcia Integer NOT NULL,
  Godzina_otwarcia Char(5 ) NOT NULL,
  Godzina_zamkniecia Char(5 ) NOT NULL,
  Dzien Varchar2(5 ) NOT NULL
        CHECK (Dzien IN ('PON','WT','SR','CZW','PT','SOB','NIEDZ'))
)
/
-- Add keys for table Czasy_otwarcia
ALTER TABLE Czasy_otwarcia ADD CONSTRAINT PK_Czasy_otwarcia PRIMARY KEY (Nr_czasu_otwarcia)
/
-- Table and Columns comments section
COMMENT ON COLUMN Czasy_otwarcia.Godzina_otwarcia IS 'Format XX:XX'
/
COMMENT ON COLUMN Czasy_otwarcia.Godzina_zamkniecia IS 'Format XX:XX'
/

-- Table Otwarcia
CREATE TABLE Otwarcia(
  Nr_otwarcia Integer NOT NULL,
  Nr_placowki Integer NOT NULL,
  Nr_czasu_otwarcia Integer NOT NULL
)
/
-- Create indexes for table Otwarcia
CREATE INDEX IX_Relationship1 ON Otwarcia (Nr_placowki)
/
CREATE INDEX IX_Relationship2 ON Otwarcia (Nr_czasu_otwarcia)
/
-- Add keys for table Otwarcia
ALTER TABLE Otwarcia ADD CONSTRAINT PK_Otwarcia PRIMARY KEY (Nr_otwarcia)
/

-- Table Wymiary
CREATE TABLE Wymiary(
  Nr_wymiarow Integer NOT NULL,
  Szerokosc Integer NOT NULL,
  Wysokosc Integer NOT NULL,
  Glebokosc Integer NOT NULL
)
/
-- Add keys for table Wymiary
ALTER TABLE Wymiary ADD CONSTRAINT PK_Wymiary PRIMARY KEY (Nr_wymiarow)
/
-- Table and Columns comments section
COMMENT ON COLUMN Wymiary.Szerokosc IS 'Warto�� w centymetrach'
/
COMMENT ON COLUMN Wymiary.Wysokosc IS 'Warto�� w centymetrach'
/
COMMENT ON COLUMN Wymiary.Glebokosc IS 'Warto�� w centymetrach'
/

-- Table Producenci
CREATE TABLE Producenci(
  Nr_producenta Integer NOT NULL,
  Nazwa Varchar2(20 ) NOT NULL
)
/
-- Add keys for table Producenci
ALTER TABLE Producenci ADD CONSTRAINT PK_Producenci PRIMARY KEY (Nr_producenta)
/

-- Table Gatunki_rasy
CREATE TABLE Gatunki_rasy(
  Nr_gatunek_rasa Integer NOT NULL,
  Gatunek Varchar2(30 ) NOT NULL
        CHECK (Gatunek IN ('Pies','Kot')),
  Rasa Varchar2(30 )
)
/
-- Add keys for table Gatunki_rasy
ALTER TABLE Gatunki_rasy ADD CONSTRAINT PK_Gatunki_rasy PRIMARY KEY (Nr_gatunek_rasa)
/

-- Table Stanowiska
CREATE TABLE Stanowiska(
  Nr_stanowiska Integer NOT NULL,
  Nazwa Varchar2(20 ) NOT NULL
)
/
-- Add keys for table Stanowiska
ALTER TABLE Stanowiska ADD CONSTRAINT PK_Stanowiska PRIMARY KEY (Nr_stanowiska)
/

-- Table Zajmowania_stanowisk
CREATE TABLE Zajmowania_stanowisk(
  Nr_zajmowania_stanowisk Integer NOT NULL,
  Data_rozpoczecia Date NOT NULL,
  Data_zakonczenia Date,
  Nr_stanowiska Integer NOT NULL,
  Nr_pracownika Integer NOT NULL
)
/
-- Create indexes for table Zajmowania_stanowisk
CREATE INDEX IX_Relationship17 ON Zajmowania_stanowisk (Nr_stanowiska)
/
CREATE INDEX IX_Relationship18 ON Zajmowania_stanowisk (Nr_pracownika)
/

-- Add keys for table Zajmowania_stanowisk
ALTER TABLE Zajmowania_stanowisk ADD CONSTRAINT PK_Zajmowania_stanowisk PRIMARY KEY (Nr_zajmowania_stanowisk)
/

-- Table Typy_wyposazenia
CREATE TABLE Typy_wyposazenia(
  Nr_typu_wyposazenia Integer NOT NULL,
  Nazwa_typu Varchar2(20 ) NOT NULL,
  Model Varchar2(30 ),
  Nr_producenta Integer NOT NULL
)
/
-- Create indexes for table Typy_wyposazenia
CREATE INDEX IX_Relationship20 ON Typy_wyposazenia (Nr_producenta)
/
-- Add keys for table Typy_wyposazenia
ALTER TABLE Typy_wyposazenia ADD CONSTRAINT PK_Typy_wyposazenia PRIMARY KEY (Nr_typu_wyposazenia)
/

-- Trigger for sequence Sequence_Nr_placowki for column Nr_placowki in table Placowki ---------
CREATE OR REPLACE TRIGGER ts_Placowki_Sequence_Nr_placowki BEFORE INSERT
ON Placowki FOR EACH ROW
BEGIN
  :new.Nr_placowki := Sequence_Nr_placowki.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Placowki_Sequence_Nr_placowki AFTER UPDATE OF Nr_placowki
ON Placowki FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_placowki in table Placowki as it uses sequence.');
END;
/
-- Trigger for sequence Sequence_Nr_zwierzecia for column Nr_zwierzecia in table Zwierzeta ---------
CREATE OR REPLACE TRIGGER ts_Zwierzeta_Sequence_Nr_zwierzecia BEFORE INSERT
ON Zwierzeta FOR EACH ROW
BEGIN
  :new.Nr_zwierzecia := Sequence_Nr_zwierzecia.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Zwierzeta_Sequence_Nr_zwierzecia AFTER UPDATE OF Nr_zwierzecia
ON Zwierzeta FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_zwierzecia in table Zwierzeta as it uses sequence.');
END;
/
-- Trigger for sequence Sequence_Nr_boksu for column Nr_boksu in table Boksy ---------
CREATE OR REPLACE TRIGGER ts_Boksy_Sequence_Nr_boksu BEFORE INSERT
ON Boksy FOR EACH ROW
BEGIN
  :new.Nr_boksu := Sequence_Nr_boksu.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Boksy_Sequence_Nr_boksu AFTER UPDATE OF Nr_boksu
ON Boksy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_boksu in table Boksy as it uses sequence.');
END;
/
-- Trigger for sequence Sequence_Nr_adoptujacego for column Nr_adoptujacego in table Adoptujacy ---------
CREATE OR REPLACE TRIGGER ts_Adoptujacy_Sequence_Nr_adoptujacego BEFORE INSERT
ON Adoptujacy FOR EACH ROW
BEGIN
  :new.Nr_adoptujacego := Sequence_Nr_adoptujacego.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Adoptujacy_Sequence_Nr_adoptujacego AFTER UPDATE OF Nr_adoptujacego
ON Adoptujacy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_adoptujacego in table Adoptujacy as it uses sequence.');
END;
/
-- Trigger for sequence Sequence_Nr_lekarstwa for column Nr_lekarstwa in table Lekarstwa ---------
CREATE OR REPLACE TRIGGER ts_Lekarstwa_Sequence_Nr_lekarstwa BEFORE INSERT
ON Lekarstwa FOR EACH ROW
BEGIN
  :new.Nr_lekarstwa := Sequence_Nr_lekarstwa.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Lekarstwa_Sequence_Nr_lekarstwa AFTER UPDATE OF Nr_lekarstwa
ON Lekarstwa FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_lekarstwa in table Lekarstwa as it uses sequence.');
END;
/
-- Trigger for sequence Sequence_Nr_karmy for column Nr_karmy in table Karmy ---------
CREATE OR REPLACE TRIGGER ts_Karmy_Sequence_Nr_karmy BEFORE INSERT
ON Karmy FOR EACH ROW
BEGIN
  :new.Nr_karmy := Sequence_Nr_karmy.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Karmy_Sequence_Nr_karmy AFTER UPDATE OF Nr_karmy
ON Karmy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_karmy in table Karmy as it uses sequence.');
END;
/
-- Trigger for sequence Sequence_Nr_wyposazenia for column Nr_wyposazenia in table Wyposazenia_egzemplarze ---------
CREATE OR REPLACE TRIGGER ts_Wyposazenia_egzemplarze_Sequence_Nr_wyposazenia BEFORE INSERT
ON Wyposazenia_egzemplarze FOR EACH ROW
BEGIN
  :new.Nr_wyposazenia := Sequence_Nr_wyposazenia.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Wyposazenia_egzemplarze_Sequence_Nr_wyposazenia AFTER UPDATE OF Nr_wyposazenia
ON Wyposazenia_egzemplarze FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_wyposazenia in table Wyposazenia_egzemplarze as it uses sequence.');
END;
/
-- Trigger for sequence Sequence_Nr_pracownika for column Nr_pracownika in table Pracownicy ---------
CREATE OR REPLACE TRIGGER ts_Pracownicy_Sequence_Nr_pracownika BEFORE INSERT
ON Pracownicy FOR EACH ROW
BEGIN
  :new.Nr_pracownika := Sequence_Nr_pracownika.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Pracownicy_Sequence_Nr_pracownika AFTER UPDATE OF Nr_pracownika
ON Pracownicy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_pracownika in table Pracownicy as it uses sequence.');
END;
/
-- Trigger for sequence Sequence_Nr_zamieszkiwania for column Nr_zamieszkiwania in table Zamieszkiwania ---------
CREATE OR REPLACE TRIGGER ts_Zamieszkiwania_Sequence_Nr_zamieszkiwania BEFORE INSERT
ON Zamieszkiwania FOR EACH ROW
BEGIN
  :new.Nr_zamieszkiwania := Sequence_Nr_zamieszkiwania.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Zamieszkiwania_Sequence_Nr_zamieszkiwania AFTER UPDATE OF Nr_zamieszkiwania
ON Zamieszkiwania FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_zamieszkiwania in table Zamieszkiwania as it uses sequence.');
END;
/
-- Trigger for sequence Sequence_Nr_przypisania for column Nr_przypisania in table Przypisania_pracownikow ---------
CREATE OR REPLACE TRIGGER ts_Przypisania_pracownikow_Sequence_Nr_przypisania BEFORE INSERT
ON Przypisania_pracownikow FOR EACH ROW
BEGIN
  :new.Nr_przypisania := Sequence_Nr_przypisania.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Przypisania_pracownikow_Sequence_Nr_przypisania AFTER UPDATE OF Nr_przypisania
ON Przypisania_pracownikow FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_przypisania in table Przypisania_pracownikow as it uses sequence.');
END;
/
-- Trigger for sequence Sequence_Nr_posiadania_lekarstwa for column Nr_posiadania_lekarstwa in table Posiadania_lekarstw ---------
CREATE OR REPLACE TRIGGER ts_Posiadania_lekarstw_Sequence_Nr_posiadania_lekarstwa BEFORE INSERT
ON Posiadania_lekarstw FOR EACH ROW
BEGIN
  :new.Nr_posiadania_lekarstwa := Sequence_Nr_posiadania_lekarstwa.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Posiadania_lekarstw_Sequence_Nr_posiadania_lekarstwa AFTER UPDATE OF Nr_posiadania_lekarstwa
ON Posiadania_lekarstw FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_posiadania_lekarstwa in table Posiadania_lekarstw as it uses sequence.');
END;
/
-- Trigger for sequence Sequence_Nr_przyjmowania for column Nr_przymowania in table Przyjmowania_lekarstw ---------
CREATE OR REPLACE TRIGGER ts_Przyjmowania_lekarstw_Sequence_Nr_przyjmowania BEFORE INSERT
ON Przyjmowania_lekarstw FOR EACH ROW
BEGIN
  :new.Nr_przymowania := Sequence_Nr_przyjmowania.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Przyjmowania_lekarstw_Sequence_Nr_przyjmowania AFTER UPDATE OF Nr_przymowania
ON Przyjmowania_lekarstw FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_przymowania in table Przyjmowania_lekarstw as it uses sequence.');
END;
/
-- Trigger for sequence Sequence_Nr_posiadania_karmy for column Nr_posiadania_karmy in table Posiadania_karm ---------
CREATE OR REPLACE TRIGGER ts_Posiadania_karm_Sequence_Nr_posiadania_karmy BEFORE INSERT
ON Posiadania_karm FOR EACH ROW
BEGIN
  :new.Nr_posiadania_karmy := Sequence_Nr_posiadania_karmy.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Posiadania_karm_Sequence_Nr_posiadania_karmy AFTER UPDATE OF Nr_posiadania_karmy
ON Posiadania_karm FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_posiadania_karmy in table Posiadania_karm as it uses sequence.');
END;
/
-- Trigger for sequence Sequence_Nr_opiekowania for column Nr_opiekowania in table Opiekowania ---------
CREATE OR REPLACE TRIGGER ts_Opiekowania_Sequence_Nr_opiekowania BEFORE INSERT
ON Opiekowania FOR EACH ROW
BEGIN
  :new.Nr_opiekowania := Sequence_Nr_opiekowania.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Opiekowania_Sequence_Nr_opiekowania AFTER UPDATE OF Nr_opiekowania
ON Opiekowania FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_opiekowania in table Opiekowania as it uses sequence.');
END;
/
-- Trigger for sequence Sequence_Nr_karmienia for column Nr_karmienia in table Karmienia ---------
CREATE OR REPLACE TRIGGER ts_Karmienia_Sequence_Nr_karmienia BEFORE INSERT
ON Karmienia FOR EACH ROW
BEGIN
  :new.Nr_karmienia := Sequence_Nr_karmienia.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Karmienia_Sequence_Nr_karmienia AFTER UPDATE OF Nr_karmienia
ON Karmienia FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_karmienia in table Karmienia as it uses sequence.');
END;
/
-- Trigger for sequence Sequence_Nr_adresu for column Nr_adresu in table Adresy ---------
CREATE OR REPLACE TRIGGER ts_Adresy_Sequence_Nr_adresu BEFORE INSERT
ON Adresy FOR EACH ROW
BEGIN
  :new.Nr_adresu := Sequence_Nr_adresu.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Adresy_Sequence_Nr_adresu AFTER UPDATE OF Nr_adresu
ON Adresy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_adresu in table Adresy as it uses sequence.');
END;
/
-- Trigger for sequence Sequence_Nr_poczty for column Nr_poczty in table Poczty ---------
CREATE OR REPLACE TRIGGER ts_Poczty_Sequence_Nr_poczty BEFORE INSERT
ON Poczty FOR EACH ROW
BEGIN
  :new.Nr_poczty := Sequence_Nr_poczty.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Poczty_Sequence_Nr_poczty AFTER UPDATE OF Nr_poczty
ON Poczty FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_poczty in table Poczty as it uses sequence.');
END;
/
-- Trigger for sequence Sequence_Nr_czasu_otwarcia for column Nr_czasu_otwarcia in table Czasy_otwarcia ---------
CREATE OR REPLACE TRIGGER ts_Czasy_otwarcia_Sequence_Nr_czasu_otwarcia BEFORE INSERT
ON Czasy_otwarcia FOR EACH ROW
BEGIN
  :new.Nr_czasu_otwarcia := Sequence_Nr_czasu_otwarcia.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Czasy_otwarcia_Sequence_Nr_czasu_otwarcia AFTER UPDATE OF Nr_czasu_otwarcia
ON Czasy_otwarcia FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_czasu_otwarcia in table Czasy_otwarcia as it uses sequence.');
END;
/
-- Trigger for sequence Sequence_Nr_otwarcia for column Nr_otwarcia in table Otwarcia ---------
CREATE OR REPLACE TRIGGER ts_Otwarcia_Sequence_Nr_otwarcia BEFORE INSERT
ON Otwarcia FOR EACH ROW
BEGIN
  :new.Nr_otwarcia := Sequence_Nr_otwarcia.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Otwarcia_Sequence_Nr_otwarcia AFTER UPDATE OF Nr_otwarcia
ON Otwarcia FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_otwarcia in table Otwarcia as it uses sequence.');
END;
/
-- Trigger for sequence Sequence_Nr_wymiarow for column Nr_wymiarow in table Wymiary ---------
CREATE OR REPLACE TRIGGER ts_Wymiary_Sequence_Nr_wymiarow BEFORE INSERT
ON Wymiary FOR EACH ROW
BEGIN
  :new.Nr_wymiarow := Sequence_Nr_wymiarow.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Wymiary_Sequence_Nr_wymiarow AFTER UPDATE OF Nr_wymiarow
ON Wymiary FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_wymiarow in table Wymiary as it uses sequence.');
END;
/
-- Trigger for sequence Sequence_Nr_producenta for column Nr_producenta in table Producenci ---------
CREATE OR REPLACE TRIGGER ts_Producenci_Sequence_Nr_producenta BEFORE INSERT
ON Producenci FOR EACH ROW
BEGIN
  :new.Nr_producenta := Sequence_Nr_producenta.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Producenci_Sequence_Nr_producenta AFTER UPDATE OF Nr_producenta
ON Producenci FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_producenta in table Producenci as it uses sequence.');
END;
/
-- Trigger for sequence Sequence_Nr_gatunek_rasa for column Nr_gatunek_rasa in table Gatunki_rasy ---------
CREATE OR REPLACE TRIGGER ts_Gatunki_rasy_Sequence_Nr_gatunek_rasa BEFORE INSERT
ON Gatunki_rasy FOR EACH ROW
BEGIN
  :new.Nr_gatunek_rasa := Sequence_Nr_gatunek_rasa.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Gatunki_rasy_Sequence_Nr_gatunek_rasa AFTER UPDATE OF Nr_gatunek_rasa
ON Gatunki_rasy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_gatunek_rasa in table Gatunki_rasy as it uses sequence.');
END;
/
-- Trigger for sequence Sequence_Nr_stanowiska for column Nr_stanowiska in table Stanowiska ---------
CREATE OR REPLACE TRIGGER ts_Stanowiska_Sequence_Nr_stanowiska BEFORE INSERT
ON Stanowiska FOR EACH ROW
BEGIN
  :new.Nr_stanowiska := Sequence_Nr_stanowiska.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Stanowiska_Sequence_Nr_stanowiska AFTER UPDATE OF Nr_stanowiska
ON Stanowiska FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_stanowiska in table Stanowiska as it uses sequence.');
END;
/
-- Trigger for sequence Sequence_Nr_zajmowania_stanowisk for column Nr_zajmowania_stanowisk in table Zajmowania_stanowisk ---------
CREATE OR REPLACE TRIGGER ts_Zajmowania_stanowisk_Sequence_Nr_zajmowania_stanowisk BEFORE INSERT
ON Zajmowania_stanowisk FOR EACH ROW
BEGIN
  :new.Nr_zajmowania_stanowisk := Sequence_Nr_zajmowania_stanowisk.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Zajmowania_stanowisk_Sequence_Nr_zajmowania_stanowisk AFTER UPDATE OF Nr_zajmowania_stanowisk
ON Zajmowania_stanowisk FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_zajmowania_stanowisk in table Zajmowania_stanowisk as it uses sequence.');
END;
/
-- Trigger for sequence Sequence_Nr_typu_wyposazenia for column Nr_typu_wyposazenia in table Typy_wyposazenia ---------
CREATE OR REPLACE TRIGGER ts_Typy_wyposazenia_Sequence_Nr_typu_wyposazenia BEFORE INSERT
ON Typy_wyposazenia FOR EACH ROW
BEGIN
  :new.Nr_typu_wyposazenia := Sequence_Nr_typu_wyposazenia.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Typy_wyposazenia_Sequence_Nr_typu_wyposazenia AFTER UPDATE OF Nr_typu_wyposazenia
ON Typy_wyposazenia FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_typu_wyposazenia in table Typy_wyposazenia as it uses sequence.');
END;
/

-- Create foreign keys (relationships) section ------------------------------------------------- 
ALTER TABLE Boksy ADD CONSTRAINT Posiada FOREIGN KEY (Nr_placowki) REFERENCES Placowki (Nr_placowki)
/

ALTER TABLE Wyposazenia_egzemplarze ADD CONSTRAINT Ma_na_stanie FOREIGN KEY (Nr_placowki) REFERENCES Placowki (Nr_placowki)
/

ALTER TABLE Zwierzeta ADD CONSTRAINT Adoptuje FOREIGN KEY (Nr_adoptujacego) REFERENCES Adoptujacy (Nr_adoptujacego)
/

ALTER TABLE Wyposazenia_egzemplarze ADD CONSTRAINT Ma_na_stanie_wyposazenie FOREIGN KEY (Nr_boksu) REFERENCES Boksy (Nr_boksu)
/

ALTER TABLE Otwarcia ADD CONSTRAINT Jest_otwarta FOREIGN KEY (Nr_placowki) REFERENCES Placowki (Nr_placowki)
/

ALTER TABLE Otwarcia ADD CONSTRAINT Otwarcia_czasy_otwarcia FOREIGN KEY (Nr_czasu_otwarcia) REFERENCES Czasy_otwarcia (Nr_czasu_otwarcia)
/

ALTER TABLE Boksy ADD CONSTRAINT Boks_ma_wymiary FOREIGN KEY (Nr_wymiarow) REFERENCES Wymiary (Nr_wymiarow)
/

ALTER TABLE Karmy ADD CONSTRAINT Producenci_karmy FOREIGN KEY (Nr_producenta) REFERENCES Producenci (Nr_producenta)
/

ALTER TABLE Lekarstwa ADD CONSTRAINT Producenci_lekarstwa FOREIGN KEY (Nr_producenta) REFERENCES Producenci (Nr_producenta)
/

ALTER TABLE Adresy ADD CONSTRAINT Poczty_adresy FOREIGN KEY (Nr_poczty) REFERENCES Poczty (Nr_poczty)
/

ALTER TABLE Placowki ADD CONSTRAINT Adresy_placowki FOREIGN KEY (Nr_adresu) REFERENCES Adresy (Nr_adresu)
/

ALTER TABLE Zwierzeta ADD CONSTRAINT Zwierzeta_gatunki_rasy FOREIGN KEY (Nr_gatunek_rasa) REFERENCES Gatunki_rasy (Nr_gatunek_rasa)
/

ALTER TABLE Adoptujacy ADD CONSTRAINT Adoptujacy_adresy FOREIGN KEY (Nr_adresu) REFERENCES Adresy (Nr_adresu)
/

ALTER TABLE Pracownicy ADD CONSTRAINT Pracownicy_adresy FOREIGN KEY (Nr_adresu) REFERENCES Adresy (Nr_adresu)
/

ALTER TABLE Zajmowania_stanowisk ADD CONSTRAINT Stanowiska_zajmowanie_stanowisk FOREIGN KEY (Nr_stanowiska) REFERENCES Stanowiska (Nr_stanowiska)
/

ALTER TABLE Zajmowania_stanowisk ADD CONSTRAINT Pracownicy_zajmowania_stanowisk FOREIGN KEY (Nr_pracownika) REFERENCES Pracownicy (Nr_pracownika)
/

ALTER TABLE Typy_wyposazenia ADD CONSTRAINT Typy_wyposazenia_producenci FOREIGN KEY (Nr_producenta) REFERENCES Producenci (Nr_producenta)
/

ALTER TABLE Wyposazenia_egzemplarze ADD CONSTRAINT Typy_wyposazenia_egzemplarze FOREIGN KEY (Nr_typu_wyposazenia) REFERENCES Typy_wyposazenia (Nr_typu_wyposazenia)


INSERT ALL
    INTO Poczty(Kod_pocztowy, Miasto) VALUES('23-456', 'Wroc�aw')
    INTO Poczty(Kod_pocztowy, Miasto) VALUES('56-789', 'Szczecin')
    INTO Poczty(Kod_pocztowy, Miasto) VALUES('78-901', 'Katowice')
    INTO Poczty(Kod_pocztowy, Miasto) VALUES('34-567', 'Gdynia')
    INTO Poczty(Kod_pocztowy, Miasto) VALUES('90-123', 'Bia�ystok')
    INTO Poczty(Kod_pocztowy, Miasto) VALUES('45-678', 'Bydgoszcz')
    INTO Poczty(Kod_pocztowy, Miasto) VALUES('67-890', 'Cz�stochowa')
    INTO Poczty(Kod_pocztowy, Miasto) VALUES('23-456', 'Radom')
    INTO Poczty(Kod_pocztowy, Miasto) VALUES('56-789', 'Sosnowiec')
    INTO Poczty(Kod_pocztowy, Miasto) VALUES('78-901', 'Toru�')
    INTO Poczty(Kod_pocztowy, Miasto) VALUES('34-567', 'Kielce')
    INTO Poczty(Kod_pocztowy, Miasto) VALUES('90-123', 'Rzesz�w')
    INTO Poczty(Kod_pocztowy, Miasto) VALUES('45-678', 'Olsztyn')
    INTO Poczty(Kod_pocztowy, Miasto) VALUES('67-890', 'Bielsko-Bia�a')
    INTO Poczty(Kod_pocztowy, Miasto) VALUES('23-456', 'Opole')
SELECT 1 FROM DUAL;
/
INSERT ALL
    INTO Stanowiska(Nazwa) VALUES('Opiekun zwierzat')
    INTO Stanowiska(Nazwa) VALUES('Pracownik medyczny')
    INTO Stanowiska(Nazwa) VALUES('Kierownik')
    INTO Stanowiska(Nazwa) VALUES('Pracownik biurowy')
    INTO Stanowiska(Nazwa) VALUES('Sprzatajacy')
SELECT 1 FROM DUAL;
/
INSERT ALL
    INTO Adresy(Ulica, Nr_budynku, Nr_mieszkania, Nr_poczty, Miasto) VALUES('Brzozowa', '2', '3', 1, 'Wroc�aw')
    INTO Adresy(Ulica, Nr_budynku, Nr_mieszkania, Nr_poczty, Miasto) VALUES('Bukowa', '4', '5', 2, 'Szczecin')
    INTO Adresy(Ulica, Nr_budynku, Nr_mieszkania, Nr_poczty, Miasto) VALUES('Jasna', '6', NULL, 3, 'Katowice')
    INTO Adresy(Ulica, Nr_budynku, Nr_mieszkania, Nr_poczty, Miasto) VALUES('Cicha', '7', '9', 4, 'Gdynia')
    INTO Adresy(Ulica, Nr_budynku, Nr_mieszkania, Nr_poczty, Miasto) VALUES('Szkolna', '10', '15', 5, 'Bia�ystok')
    INTO Adresy(Ulica, Nr_budynku, Nr_mieszkania, Nr_poczty, Miasto) VALUES('Le�na', '11', NULL, 6, 'Bydgoszcz')
    INTO Adresy(Ulica, Nr_budynku, Nr_mieszkania, Nr_poczty, Miasto) VALUES('Akacjowa', '13', '17', 7, 'Cz�stochowa')
    INTO Adresy(Ulica, Nr_budynku, Nr_mieszkania, Nr_poczty, Miasto) VALUES('Szkolna', '14', NULL, 8, 'Radom')
    INTO Adresy(Ulica, Nr_budynku, Nr_mieszkania, Nr_poczty, Miasto) VALUES('Polna', '15', '19', 9, 'Sosnowiec')
    INTO Adresy(Ulica, Nr_budynku, Nr_mieszkania, Nr_poczty, Miasto) VALUES('Sosnowa', '16', NULL, 10, 'Toru�')
SELECT 1 FROM DUAL;
/
INSERT ALL
    INTO Placowki(Nazwa_placowki, Nr_telefonu, Adres_email, Maks_liczba_zwierzat, Nr_adresu) VALUES('S�oneczko', '222379065', 'sloneczko@bada.pl', 57, 5)
    INTO Placowki(Nazwa_placowki, Nr_telefonu, Adres_email, Maks_liczba_zwierzat, Nr_adresu) VALUES('Promyk', '167350872', 'promyk@bada.pl', 112, 10)
SELECT 1 FROM DUAL;
/
INSERT ALL
    INTO Wymiary(Szerokosc, Wysokosc, Glebokosc) VALUES(500, 200, 300)
    INTO Wymiary(Szerokosc, Wysokosc, Glebokosc) VALUES(700, 180, 400)
    INTO Wymiary(Szerokosc, Wysokosc, Glebokosc) VALUES(300, 200, 200)
SELECT 1 FROM DUAL;
/
INSERT ALL
    INTO Boksy(Maks_liczba_zwierzat, Nr_placowki, Nr_wymiarow) VALUES(3, 1, 3)
    INTO Boksy(Maks_liczba_zwierzat, Nr_placowki, Nr_wymiarow) VALUES(4, 2, 2)
    INTO Boksy(Maks_liczba_zwierzat, Nr_placowki, Nr_wymiarow) VALUES(2, 2, 1)
SELECT 1 FROM DUAL;
/
INSERT ALL
    INTO Czasy_otwarcia(Godzina_otwarcia, Godzina_zamkniecia, Dzien) VALUES('10:00', '16:00', 'PON')
    INTO Czasy_otwarcia(Godzina_otwarcia, Godzina_zamkniecia, Dzien) VALUES('12:00', '16:00', 'PT')
    INTO Czasy_otwarcia(Godzina_otwarcia, Godzina_zamkniecia, Dzien) VALUES('12:00', '14:00', 'SOB')
SELECT 1 FROM DUAL;
/
INSERT ALL
    INTO Otwarcia(Nr_placowki, Nr_czasu_otwarcia) VALUES(1, 1)
    INTO Otwarcia(Nr_placowki, Nr_czasu_otwarcia) VALUES(2, 2)
    INTO Otwarcia(Nr_placowki, Nr_czasu_otwarcia) VALUES(1, 3)
SELECT 1 FROM DUAL;
/
INSERT ALL
    INTO Producenci(Nazwa) VALUES('Bayer')
    INTO Producenci(Nazwa) VALUES('Pedigree')
    INTO Producenci(Nazwa) VALUES('Gryzu�')
SELECT 1 FROM DUAL;
/
INSERT ALL
    INTO Lekarstwa(Nazwa, Dawka, Nr_producenta) VALUES('Bravecto', '2mg', 1)
SELECT 1 FROM DUAL;
/
INSERT ALL
    INTO Typy_wyposazenia(Nazwa_typu, Nr_producenta) VALUES('Smycz', 3)
    INTO Typy_wyposazenia(Nazwa_typu, Nr_producenta, Model) VALUES('Obroza', 3, '12A')
SELECT 1 FROM DUAL;
/
INSERT ALL
    INTO Karmy(Nazwa, Data_waznosci, Nr_producenta) VALUES('Diet Senior', TO_DATE('2023-12-27', 'YYYY-MM-DD'), 2)
SELECT 1 FROM DUAL;
/
INSERT ALL
    INTO Pracownicy(Imie, Nazwisko, Nr_dokumentu, Pesel, Nr_telefonu, Plec, Czy_wolontariusz, Nr_adresu) VALUES('Andrzej', 'Arbuz', 'MGR12345', '03123298566', '509187144', 'M', 'T', 1)
    INTO Pracownicy(Imie, Nazwisko, Nr_dokumentu, Pesel, Nr_telefonu, Plec, Czy_wolontariusz, Pensja, Nr_adresu) VALUES('Kamil', 'Paterek', 'LIC98765', '92567398003', '639254087', 'M', 'N', 10000, 3)
    INTO Pracownicy(Imie, Nazwisko, Nr_dokumentu, Pesel, Nr_telefonu, Plec, Czy_wolontariusz, Pensja, Adres_email, Nr_adresu) VALUES('Jacek', 'Pilarczyk', 'TWI72545', '72509849805', '964382670', 'M', 'N', 5700, 'kasztan@op.pl', 7)
SELECT 1 FROM DUAL;
/
INSERT ALL
    INTO Przypisania_pracownikow(Nr_placowki, Nr_pracownika, Poczatek_przypisania) VALUES(1, 1, TO_DATE('2022-12-27', 'YYYY-MM-DD'))
    INTO Przypisania_pracownikow(Nr_placowki, Nr_pracownika, Poczatek_przypisania) VALUES(2, 2, TO_DATE('2020-06-20', 'YYYY-MM-DD'))
SELECT 1 FROM DUAL;
/
INSERT ALL
    INTO Zajmowania_stanowisk(Data_rozpoczecia, Nr_pracownika, Nr_stanowiska) VALUES(TO_DATE('2022-12-27', 'YYYY-MM-DD'), 1, 1)
    INTO Zajmowania_stanowisk(Data_rozpoczecia, Nr_pracownika, Nr_stanowiska) VALUES(TO_DATE('2020-06-20', 'YYYY-MM-DD'), 2, 5)
    INTO Zajmowania_stanowisk(Data_rozpoczecia, Nr_pracownika, Nr_stanowiska) VALUES(TO_DATE('2017-11-26', 'YYYY-MM-DD'), 3, 1)
SELECT 1 FROM DUAL;
/
INSERT ALL
    INTO Posiadania_lekarstw(Nr_lekarstwa, Nr_placowki, Ilosc_na_stanie) VALUES(1, 1, 100)
SELECT 1 FROM DUAL;
/
INSERT ALL
    INTO Wyposazenia_egzemplarze(Nr_placowki, Nr_boksu, Nr_typu_wyposazenia) VALUES(1, 1, 1)
    INTO Wyposazenia_egzemplarze(Nr_placowki, Nr_boksu, Nr_typu_wyposazenia) VALUES(1, 1, 2)
    INTO Wyposazenia_egzemplarze(Nr_placowki, Nr_boksu, Nr_typu_wyposazenia) VALUES(2, 2, 2)
SELECT 1 FROM DUAL;
/
INSERT ALL
    INTO Posiadania_karm(Nr_placowki, Nr_karmy, Ilosc_na_stanie) VALUES(1, 1, 30)
    INTO Posiadania_karm(Nr_placowki, Nr_karmy, Ilosc_na_stanie) VALUES(2, 1, 37)
SELECT 1 FROM DUAL;
/
INSERT ALL
    INTO Gatunki_rasy(Gatunek, Rasa) VALUES('Pies', 'Malta�czyk')
    INTO Gatunki_rasy(Gatunek, Rasa) VALUES('Pies', 'Entlebucher')
    INTO Gatunki_rasy(Gatunek) VALUES('Pies')
    INTO Gatunki_rasy(Gatunek) VALUES('Kot')
    INTO Gatunki_rasy(Gatunek, Rasa) VALUES('Kot', 'Brytyjski')
SELECT 1 FROM DUAL;
/
INSERT ALL
    INTO Zwierzeta(Wiek, Masa, Data_przyjecia, Czy_szczepiony, Czy_kastrowany, Plec, Nr_gatunek_rasa, Imie) VALUES(3, 4, TO_DATE('2021-07-10', 'YYYY-MM-DD'), 'T', 'T', 'Samica', 1, 'Bella')
    INTO Zwierzeta(Wiek, Masa, Data_przyjecia, Czy_szczepiony, Czy_kastrowany, Plec, Nr_gatunek_rasa, Imie) VALUES(7, 23, TO_DATE('2016-02-19', 'YYYY-MM-DD'), 'T', 'T', 'Samica', 2, 'Luna')
    INTO Zwierzeta(Wiek, Masa, Data_przyjecia, Czy_szczepiony, Czy_kastrowany, Plec, Nr_gatunek_rasa, Imie) VALUES(5, 5, TO_DATE('2020-04-10', 'YYYY-MM-DD'), 'T', 'N', 'Samiec', 4, 'Tobiasz')
    INTO Zwierzeta(Wiek, Masa, Data_przyjecia, Czy_szczepiony, Czy_kastrowany, Plec, Nr_gatunek_rasa, Imie) VALUES(10, 40, TO_DATE('2017-07-29', 'YYYY-MM-DD'), 'T', 'T', 'Samiec', 3, 'Hektor')
SELECT 1 FROM DUAL;
/
INSERT ALL
    INTO Zamieszkiwania(Nr_boksu, Nr_zwierzecia, Data_rozpoczecia) VALUES(2, 1, TO_DATE('2021-07-10', 'YYYY-MM-DD'))
    INTO Zamieszkiwania(Nr_boksu, Nr_zwierzecia, Data_rozpoczecia) VALUES(3, 2, TO_DATE('2019-03-11', 'YYYY-MM-DD'))
    INTO Zamieszkiwania(Nr_boksu, Nr_zwierzecia, Data_rozpoczecia) VALUES(2, 3, TO_DATE('2021-04-10', 'YYYY-MM-DD'))
    INTO Zamieszkiwania(Nr_boksu, Nr_zwierzecia, Data_rozpoczecia) VALUES(3, 4, TO_DATE('2017-07-29', 'YYYY-MM-DD'))
SELECT 1 FROM DUAL;
/
INSERT ALL
    INTO Karmienia(Nr_karmy, Data_rozpoczecia, Nr_zwierzecia, Czestotliwosc) VALUES(1, TO_DATE('2022-04-10', 'YYYY-MM-DD'), 1, 3)
SELECT 1 FROM DUAL;
/
INSERT ALL
    INTO Przyjmowania_lekarstw(Nr_lekarstwa, Poczatek_przyjmowania, Nr_zwierzecia) VALUES(1, TO_DATE('2023-10-19', 'YYYY-MM-DD'), 1)
    INTO Przyjmowania_lekarstw(Nr_lekarstwa, Poczatek_przyjmowania, Nr_zwierzecia, Koniec_przyjmowania) VALUES(1, TO_DATE('2023-07-03', 'YYYY-MM-DD'), 4, TO_DATE('2023-10-03'))
SELECT 1 FROM DUAL;
/
INSERT ALL
    INTO Opiekowania(Nr_pracownika, Poczatek_opiekowania, Nr_zwierzecia) VALUES(1, TO_DATE('2023-11-07', 'YYYY-MM-DD'), 4)
SELECT 1 FROM DUAL;
/
INSERT ALL
    INTO Adoptujacy(Imie, Nazwisko, Nr_dokumentu, Pesel, Nr_telefonu, Plec, Nr_adresu) VALUES('Maciej', 'Lipski', 'INZ12345', '03675008672', '733804956', 'M', 9)
SELECT 1 FROM DUAL;