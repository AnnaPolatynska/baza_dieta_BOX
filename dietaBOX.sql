create database dieta_box;
use dieta_box;


#tabela punkty odbioru - możliwość wyboru dogodnej lokalizacji dla klienta
CREATE TABLE punkty_odbioru (
    id_o INT,
    miasto VARCHAR(15),
    nazwa_punktu VARCHAR(50),
    adres_punktu VARCHAR(50),
    PRIMARY KEY (id_o)
    
);
	INSERT INTO punkty_odbioru
	(id_o, miasto, nazwa_punktu, adres_punktu )
VALUES
	(1, 'Warszawa', 'Klub Sportowy S4', 'ul. Bony 6'),
	(2, 'Piastów', 'Szkoła tańca FEN', 'ul. Warszawska 92' ),
    (3, 'Piastów', 'Klub Sportowy S4', 'ul. Prusa 16' ),
    (4, 'Warszawa', 'Oxygen Fitness', 'ul. Gierdziejowskiego 17'),
    (5, 'Warszawa', 'Cross Klub Ursus', 'ul. Warszawska 58'),
    (6, 'Piastów', 'Fight Klub Pitbul', 'ul. Konopnickiej 12');




#tabela klienci
CREATE TABLE klient (
    id_k INT,
    nazwisko VARCHAR(15),
    imię VARCHAR(10),
    telefon VARCHAR(27),
    miasto VARCHAR(15),
    id_o INT,
    PRIMARY KEY (id_k),
    FOREIGN KEY (id_o)
        REFERENCES punkty_odbioru (id_o)
);
insert into klient (id_k, nazwisko, imię, telefon, miasto, id_o) 
VALUES 
(1, 'Banak',	'Anna', '611-655-788', 'Piastów', 2),
(2, 'Jędrysek', 'Helena', '511-235-697',  'Piastów', 2),
(3, 'Dobrowolski', 'Krzysztof', '620-14-08', 'Piastów', 6),
(4, 'Kowalski',	'Jan', '511-676-333', 'Warszawa', 5),
(5, 'Józefowicz',	'Anna', '669-0216-698', 'Warszawa', 4),
(6, 'Bućko',	'Jerzy', '615-418-922', 'Warszawa', 4),
(7, 'Barszcz',	'Czesław', '609-656-873', 'Piastów', 3),
(8, 'Bojanowska',	'Urszula', '602-912-586', 'Piastów', 6),
(9, 'Dzida', 'Andrzej', '911-353-961', 'Warszawa', 1);




#tabela produkty
CREATE TABLE diety(
    id_d int,
    dieta VARCHAR(50),
    cena_netto INT,
    opis VARCHAR(155),
    primary key (id_d)
);
	INSERT INTO diety
	(id_d, dieta, cena_netto, opis)
VALUES
	(1 , 'odchudzająca egzotyczne smaki', 1520, 'Dzięki diecie odchudzającej szybko i smacznie schudniesz. Specjalnie dla wielbicieli egzotycznych smaków.'),
    (2 , 'odchudzająca', 1400, 'Dzięki diecie odchudzającej szybko i smacznie schudniesz.'),
    (3 , 'zdrowotna wzmocnij serce', 1570, 'Pyszna dieta 2500 Kcal, zapewniająca wszelkie wartości odżywcze. W pełni zbilansowana. Dieta jest suplementowana z myślą o Twoim sercu.'),
    (4 , 'zdrowotna',  1600, 'Pyszna dieta 2500 Kcal, zapewniająca wszelkie wartości odżywcze. W pełni zbilansowana.'),
    (5 , 'sportowa - wytrzymałość', 1750, 'Dieta dla sportowców, zapewniająca wytrzymałość i sprawność podczas treningów. Przetestuj podczas intensywnego treningu'),
    (6 , 'sportowa - siła', 1800, 'Dieta dla osób uprawiających sporty siłowe, dzięki odpowiedniemu bilansowi białka zapewnia siłę i sprawność podczas treningów.');



#tabela zamówienie łączą klienta z zamówieniem
CREATE TABLE zamówienia (
    id_z INT,
    id_k INT,
    id_d INT,
    opłacono VARCHAR(10),
    od_kiedy DATE,
    PRIMARY KEY (id_z),
    FOREIGN KEY (id_k)
        REFERENCES klient (id_k),
    FOREIGN KEY (id_d)
        REFERENCES diety (id_d)
);
	INSERT INTO zamówienia
	(id_z, id_k, id_d, opłacono, od_kiedy) 
VALUES
	(1, 1, 1, 'TAK', '2017-07-31'),
	(2, 1, 5, 'TAK','2017-08-07'),
    (3, 3, 1, 'TAK','2017-08-15'),
	(4, 8, 4, 'NIE','2017-10-01'),
    (5, 4, 2, 'TAK','2017-08-12'),
    (6, 5, 2, 'TAK','2017-08-10'),
	(7, 6, 4, 'TAK','2017-08-01');



# tabela uprawnień użytkowników
CREATE TABLE uprawnienia (
    ID INT,
    id_k INT,
    Imię VARCHAR(20),
    Nazwisko VARCHAR(50),
    uprawnienia VARCHAR(20),
    e_mail VARCHAR(25),
    login VARCHAR(20),
    haslo VARCHAR(20),
    PRIMARY KEY (ID),
    FOREIGN KEY (id_k)
        REFERENCES klient (id_k)
);
insert into uprawnienia (ID, id_k, Imię, Nazwisko, uprawnienia, e_mail, login, haslo) values (1, 1, 'Anna', 'Banak', 'klient','a_Banak@wp.pl' , 'a_baniak', 'Bania1!'),
(2, 3, 'Krzysztof', 'Dobrowolski', 'klient', 'k_dobrowolski@o2.pl', 'k_dobrowolski', 'Dobro1!'),
(5, 8, 'Urszula', 'Bojanowska', 'klient','u_boja@wp.pl' , 'a_bojanowska', 'Boja1!'),
(6, 4, 'Jan', 'Kowalski', 'klient','J.kowal@wp.pl' , 'j_kowalski', 'Kowal1!'),
(7, 5, 'Anna', 'Józefowicz',  'klient', 'pysia@o2.pl', 'a_jozefowicz', 'Jozef1!'),
(8, 6, 'Jerzy', 'Bućko', 'klient', 'Jerzyk@o2.pl', 'j_bucko', 'Bucko1!'),
(9, 7,'Czesław', 'Barszcz', 'klient', 'Bar@wp.pl', 'c_barsz', 'Barsz1!'),
(10, 2, 'Helena', 'Jędrysek', 'klient', 'h_jedr@wp.pl', 'h_jedry', 'Jedry1!'),
(11, 9, 'Andrzej', 'Dzida', 'klient', 'a_dzida@onet.pl', 'a_dzida', 'Dzida1!');




CREATE TABLE uprawnienia_prac (
    id INT,
    Imię VARCHAR(20),
    Nazwisko VARCHAR(50),
    uprawnienia VARCHAR(20),
    e_mail VARCHAR(25),
    login VARCHAR(20),
    haslo VARCHAR(20)
);
insert into uprawnienia_prac (id, Imię, Nazwisko, uprawnienia, e_mail, login, haslo) values 
(1, 'Marzena', 'Królewska', 'pracownik','m_królewska@box.pl' , 'm_królewska', 'Krole1!'),
(2, 'Helena', 'Bielarz', 'pracownik', 'h_bielarz@box.pl', 'h_bielarz', 'Biela1!'),
(3, 'Jolanta', 'Stolarek', 'pracownik','j_stolarek@box.pl' , 'j_stolarek', 'Stola1!'),
(4, 'Wojciech', 'Kępiński', 'pracownik','w_kepinski@box.pl' , 'w_kepinski', 'Kepin1!');




#dla klientów:
# 1. co oferujemy - jakie typy boxów

SELECT 
    id_d, dieta, opis, cena_netto, cena_netto * 1.23 AS 'cena_brutto'
FROM
    diety;

SELECT dieta, cena_netto, cena_netto * 1.23 AS 'cena_brutto' FROM diety WHERE id_d=1;




CREATE VIEW diety_opis as SELECT dieta, opis, cena_netto, cena_netto * 1.23 AS 'cena_brutto' FROM diety;
alter view diety_opis as SELECT dieta, opis, cena_netto, cena_netto * 1.23 AS 'cena_brutto' FROM diety;
select * from diety_opis;




# 2. ceny boxów od najniższych
SELECT * FROM diety order by cena_netto;

# 3.  gdzie odebrać zamówione boxy
SELECT 
    id_o, nazwa_punktu, adres_punktu, miasto
FROM
    punkty_odbioru
ORDER BY miasto;

SELECT nazwa_punktu, adres_punktu, miasto FROM punkty_odbioru WHERE id_o=1 ;


CREATE VIEW punkty_opis as SELECT nazwa_punktu, adres_punktu, miasto FROM punkty_odbioru ORDER BY miasto;
alter view punkty_opis as SELECT nazwa_punktu, adres_punktu, miasto FROM punkty_odbioru ORDER BY miasto;
select * from punkty_opis;





# dla pracowników
# którzy klienci z jakiej miejscowości
SELECT imię, nazwisko, telefon, miasto FROM klient WHERE miasto='Warszawa';
SELECT imię, nazwisko, telefon, miasto FROM klient WHERE miasto='Piastów';
# lista meilingowa
SELECT 
   id_k, imię, nazwisko, telefon, miasto, e_mail
FROM
    klient
        NATURAL LEFT JOIN
    uprawnienia;



CREATE VIEW klienci_opis as SELECT   id_k, imię, nazwisko, telefon, miasto, e_mail FROM klient NATURAL LEFT JOIN uprawnienia;
alter view klienci_opis as SELECT   id_k, imię, nazwisko, telefon, miasto, e_mail FROM klient NATURAL LEFT JOIN uprawnienia;
select * from klienci_opis;

# administrator dane dot loginów i haseł startowych klietnów
SELECT 
   id_k, imię, nazwisko, telefon, miasto, e_mail, login, haslo
FROM
    klient
        NATURAL LEFT JOIN
    uprawnienia
ORDER BY nazwisko;

SELECT 
   id_k, login
FROM
    klient
        NATURAL LEFT JOIN
    uprawnienia;



# czy dieta opłacona i który klient kupił 
SELECT 
    opłacono,
    dieta,
    cena_netto,
    cena_netto * 1.23 AS 'cena_brutto',
    imię,
    nazwisko,
    telefon,
    miasto,
    od_kiedy
FROM
    diety
        NATURAL LEFT JOIN
    zamówienia
        NATURAL LEFT JOIN
    klient
WHERE
    opłacono IS NOT NULL
ORDER BY opłacono;



# która dieta nie została sprzedana
SELECT 
    dieta, cena_netto
FROM
    diety
        NATURAL LEFT JOIN
    zamówienia
        NATURAL LEFT JOIN
    klient
WHERE
    opłacono IS NULL;



# daty realizacji zamówień dla poszczególnych klientów, czy opłacone i gdzie klient chce odbrać
SELECT 
    opłacono,
    id_d,
    dieta,
    od_kiedy,
    DATE_ADD(od_kiedy, INTERVAL 1 MONTH) AS do_kiedy,
    id_k,
    imię,
    nazwisko,
    telefon,
    miasto,
    id_o,
    nazwa_punktu,
    adres_punktu
FROM
    diety
        NATURAL LEFT JOIN
    zamówienia
        NATURAL LEFT JOIN
    klient
        NATURAL LEFT JOIN
    punkty_odbioru
WHERE
    opłacono IS NOT NULL
ORDER BY od_kiedy;


# dla kuchni jakie diety od kiedy i dla dostawców gdzie dostarczyć
SELECT 
   dieta,
   od_kiedy,
    DATE_ADD(od_kiedy, INTERVAL 1 MONTH) AS do_kiedy,
    nazwa_punktu,
    adres_punktu
FROM
    zamówienia
        NATURAL LEFT JOIN
    klient
        NATURAL LEFT JOIN
    diety
        NATURAL LEFT JOIN
    punkty_odbioru
WHERE
    id_z IS NOT NULL
ORDER BY dieta;



#zamówienia poszczególnych klientów
SELECT 
    id_z, id_k, imię, nazwisko, id_d, dieta, id_o, opłacono, od_kiedy
FROM
    diety
        NATURAL LEFT JOIN
    zamówienia
        NATURAL LEFT JOIN
    klient
    WHERE
    id_z IS NOT NULL
ORDER BY id_k;





#widok daty realizacji zamówień 
CREATE VIEW daty_realizacji AS
    SELECT 
        dieta,
        od_kiedy,
        DATE_ADD(od_kiedy, INTERVAL 1 MONTH) AS do_kiedy,
        imię,
        nazwisko,
        telefon,
        miasto,
        opłacono
    FROM
        diety
            NATURAL LEFT JOIN
        zamówienia
            NATURAL LEFT JOIN
        klient
    WHERE
        opłacono IS not null
    ORDER BY od_kiedy;
alter view daty_realizacji AS
    SELECT 
        dieta,
        od_kiedy,
        DATE_ADD(od_kiedy, INTERVAL 1 MONTH) AS do_kiedy,
        imię,
        nazwisko,
        telefon,
        miasto,
        opłacono
    FROM
        diety
            NATURAL LEFT JOIN
        zamówienia
            NATURAL LEFT JOIN
        klient
    WHERE
        opłacono IS not null
    ORDER BY od_kiedy;
select * from daty_realizacji;




