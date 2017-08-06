create database dieta_box;
use dieta_box;



#tabela klienci
CREATE TABLE klient (
    id_k INT,
    nazwisko VARCHAR(15),
    imię VARCHAR(10),
    telefon VARCHAR(27),
    miasto VARCHAR(15),
    PRIMARY KEY (id_k)
    
);
insert into klient (id_k, nazwisko, imię, telefon, miasto) VALUES (1, 'Banak',	'Anna', '611-655-788', 'Piastów');
insert into klient (id_k, nazwisko, imię, telefon, miasto) VALUES (2, 'Jędrysek', 'Helena', '511-235-697',  'Piastów');
insert into klient (id_k, nazwisko, imię, telefon, miasto) VALUES (3, 'Dobrowolski', 'Krzysztof', '620-14-08', 'Piastów');
insert into klient (id_k, nazwisko, imię, telefon, miasto) VALUES (4, 'Kowalski',	'Jan', '511-676-333', 'Warszawa');
insert into klient (id_k, nazwisko, imię, telefon, miasto) VALUES (5, 'Józefowicz',	'Anna', '669-0216-698', 'Warszawa');
insert into klient (id_k, nazwisko, imię, telefon, miasto) VALUES (6, 'Bućko',	'Jerzy', '615-418-922', 'Warszawa');
insert into klient (id_k, nazwisko, imię, telefon, miasto) VALUES (7, 'Barszcz',	'Czesław', '609-656-873', 'Piastów');
insert into klient (id_k, nazwisko, imię, telefon, miasto) VALUES (8, 'Bojanowska',	'Urszula', '602-912-586', 'Piastów');
insert into klient (id_k, nazwisko, imię, telefon, miasto) VALUES (9, 'Dzida',	'Andrzej', '911-353-961', 'Warszawa');

#delete from klient WHERE id_k=10; 


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
    id_z int,
	id_k int,
    id_d int,
    opłacono VARCHAR(10),
    od_kiedy DATE,
    primary key (id_z),
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


#tabela punkty odbioru - możliwość wyboru dogodnej lokalizacji dla klienta
CREATE TABLE punkty_odbioru(
    id_o int,
	miasto VARCHAR(15),
    id_k int,
    nazwa_punktu VARCHAR(50),
    adres_punktu VARCHAR(50),
       primary key (id_o),
    FOREIGN KEY (id_k)
        REFERENCES klient (id_k)
);
	INSERT INTO punkty_odbioru
	(id_o, miasto, id_k, nazwa_punktu, adres_punktu )
VALUES
	(1, 'Warszawa', 1, 'Klub Sportowy S4', 'ul. Bony 6'),
	(2, 'Piastów', 2, 'Szkoła tańca FEN', 'ul. Warszawska 92' ),
    (3, 'Piastów', 3, 'Klub Sportowy S4', 'ul. Prusa 16' ),
    (4, 'Warszawa', 4, 'Oxygen Fitness', 'ul. Gierdziejowskiego 17'),
    (5, 'Warszawa', 5, 'Cross Klub Ursus', 'ul. Warszawska 58'),
    (6, 'Piastów', 6, 'Fight Klub Pitbul', 'ul. Konopnickiej 12');


# tabela uprawnień użytkowników
CREATE TABLE uprawnienia (
    ID INT,
    id_k INT,
    Imię VARCHAR(20),
    Nazwisko VARCHAR(50),
    uprawnienia VARCHAR(20),
    e_mail VARCHAR(25),
    login VARCHAR(20),
    hasło VARCHAR(20),
    PRIMARY KEY (ID),
    FOREIGN KEY (id_k)
        REFERENCES klient (id_k)
);
insert into uprawnienia (ID, id_k, Imię, Nazwisko, uprawnienia, e_mail, login, hasło) values (1, 1, 'Anna', 'Banak', 'klient','a_Banak@wp.pl' , 'a_malinowska', 'Mali1!');
insert into uprawnienia (ID, id_k, Imię, Nazwisko, uprawnienia, e_mail, login, hasło) values (2, 3, 'Krzysztof', 'Dobrowolski', 'klient', 'k_dobrowolski@o2.pl', 'k_dobrowolski', 'Dobro1!');
insert into uprawnienia (ID, id_k, Imię, Nazwisko, uprawnienia, e_mail, login, hasło) values (5, 8, 'Urszula', 'Bojanowska', 'klient','u_boja@wp.pl' , 'a_bojanowska', 'Boja1!');
insert into uprawnienia (ID, id_k, Imię, Nazwisko, uprawnienia, e_mail, login, hasło) values (6, 4, 'Jan', 'Kowalski', 'klient','J.kowal@wp.pl' , 'j_kowalski', 'Kowal1!');
insert into uprawnienia (ID, id_k, Imię, Nazwisko, uprawnienia, e_mail, login, hasło) values (7, 5, 'Anna', 'Józefowicz',  'klient', 'pysia@o2.pl', 'a_jozefowicz', 'Jozef1!');
insert into uprawnienia (ID, id_k, Imię, Nazwisko, uprawnienia, e_mail, login, hasło) values (8, 6, 'Jerzy', 'Bućko', 'klient', 'Jerzyk@o2.pl', 'j_bucko', 'Bucko1!');
insert into uprawnienia (ID, id_k, Imię, Nazwisko, uprawnienia, e_mail, login, hasło) values (9, 7,'Czesław', 'Barszcz', 'klient', 'Bar@wp.pl', 'c_barsz', 'Barsz1!');
insert into uprawnienia (ID, id_k, Imię, Nazwisko, uprawnienia, e_mail, login, hasło) values (10, 2, 'Helena', 'Jędrysek', 'klient', 'h_jedr@wp.pl', 'h_jedry', 'Jedry1!');
insert into uprawnienia (ID, id_k, Imię, Nazwisko, uprawnienia, e_mail, login, hasło) values (11, 9, 'Andrzej', 'Dzida', 'klient', 'a_dzida@onet.pl', 'a_dzida', 'Dzida1!');




#dla klientów:
# 1. co oferujemy - jakie typy boxów
SELECT 
    dieta, opis, cena_netto, cena_netto * 1.23 AS 'cena_brutto'
FROM
    diety;


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
    nazwa_punktu, adres_punktu, miasto
FROM
    punkty_odbioru
ORDER BY miasto;

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
    imię, nazwisko, telefon, miasto, e_mail, login, hasło
FROM
    klient
        NATURAL LEFT JOIN
    uprawnienia
ORDER BY nazwisko;



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



# daty realizacji zamówień dla poszczególnych klientów
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
    opłacono IS NOT NULL
ORDER BY od_kiedy;

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




