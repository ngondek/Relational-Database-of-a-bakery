-- Wypisanie adrsow piekarni, które znjaduja sie w Warszawie
SELECT adres
FROM PIEKARNIA
WHERE miasto = 'WARSZAWA' ;

--Wypisanie nazwy i ceny wyrobow,ktorych cena jest wieksza od 7 i mniejsza od 50, w kolejnosci od najdrozszego do najtanszego
SELECT nazwa, cena
FROM WYROB
WHERE cena > 7 AND cena < 50 
ORDER BY cena DESC ;

--Wypisanie, w kolejnosci alfabetycznej, nazwisk i imion wszystkich osob, ktorych nazwisko zaczyna siê na litere 'W'
SELECT nazwisko, imie
FROM OSOBA
WHERE nazwisko LIKE 'W%'
ORDER BY nazwisko ;

--Wypisanie nazw wszystkich wyrobow, ktorych typem sa DROBNE WYPIEKI
SELECT wyrob.nazwa
FROM wyrob
INNER JOIN typ ON wyrob.id_typ = typ.id_typ
WHERE typ.nazwa = 'DROBNE WYPIEKI' ;

--Wypisanie alfabetycznie imion i nazwisk wszytskich pracownikow, ktorzy zostali zatrudnieni w piekarni w POZNANIU w 2019 roku
SELECT imie, nazwisko
FROM PRACOWNIK
INNER JOIN osoba ON osoba.id_osoba = pracownik.id_pracownik
INNER JOIN piekarnia ON piekarnia.id_piekarnia = pracownik.id_piekarnia
WHERE piekarnia.miasto = 'POZNAN' AND  EXTRACT(YEAR FROM data_zatrudnienia) = '2019' 
ORDER BY imie ;

-- Wypisanie alfabetycznie nazwisk i imion wszystkich osob kupujacych w piekarniach, ktorzy nie sa pracownikami zadnej piekarni
SELECT nazwisko, imie
FROM OSOBA
LEFT OUTER JOIN pracownik ON pracownik.id_pracownik = osoba.id_osoba
WHERE id_pracownik IS NULL
ORDER BY nazwisko ;

-- Wypisanie liczby produktow dla poszcegolnych typow
SELECT typ.nazwa, COUNT(*) liczba_produktow
FROM wyrob
INNER JOIN typ ON typ.id_typ = wyrob.id_typ
GROUP BY typ.nazwa ;

-- Wypisanie liczby zatrudnioncyh osob na poszczegolnym stanowisku w piekarni w KRAKOWIE
SELECT stanowisko, COUNT(*) liczba_pracownikow
FROM pracownik
INNER JOIN piekarnia ON piekarnia.id_piekarnia = pracownik.id_piekarnia
WHERE piekarnia.miasto = 'KRAKOW'
GROUP BY stanowisko ;

-- Wypisanie dla kazdej osoby liczby zamowien zlozonych w maju 2020, w kolejnosci od najwiekszej liczby zamowien na poczatku
SELECT imie, nazwisko, COUNT(*) liczba_zamowien
FROM OSOBA
INNER JOIN zamowienie ON zamowienie.id_osoba = osoba.id_osoba
WHERE EXTRACT(MONTH FROM zamowienie.data_zamowienia) = '05' AND EXTRACT(YEAR FROM zamowienie.data_zamowienia) = '2020' 
GROUP BY imie, nazwisko
ORDER BY liczba_zamowien DESC ;

--Wypisanie imion i nazwisk osob, ktore zlozyly conajmniej 2 zamowienia w ktorejkolwiek piekarni
SELECT imie, nazwisko
FROM osoba
WHERE osoba.id_osoba IN (
    SELECT id_osoba FROM zamowienie GROUP BY id_osoba HAVING COUNT(*) >=2 ) ;

--Wypisanie imeinia, nazwiska, pensji, stanowiska i daty zatrudnienia pracownikow ze wszytskich piekarni, ktorzy najwiecej zarabiaja
SELECT imie, nazwisko, pensja, stanowisko, data_zatrudnienia
FROM pracownik
INNER JOIN osoba ON osoba.id_osoba = pracownik.id_pracownik
WHERE 2>= (SELECT COUNT(*) FROM pracownik p WHERE p.pensja > pracownik.pensja) ;

--Wypisanie nazwy i ceny ciast, ktore nie zawiraja w sobie czekolady
SELECT wyrob.nazwa, cena
FROM wyrob
INNER JOIN typ ON typ.id_typ = wyrob.id_typ
WHERE typ.nazwa = 'CIASTO' AND wyrob.id_wyrob NOT IN ( 
    SELECT id_wyrob FROM wyrobskladnik WHERE id_skladnik = ( 
        SELECT id_skladnik FROM skladnik WHERE nazwa = 'CZEKOLADA' ) ) ;









