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
insert into klient (id_k, nazwisko, imię, telefon, miasto) VALUES (1, 'Banak',	'Anna', '611-655-788', 'Pruszków');
insert into klient (id_k, nazwisko, imię, telefon, miasto) VALUES (2, 'Jędrysek', 'Helena', '511-235-697',  'Pruszków');
insert into klient (id_k, nazwisko, imię, telefon, miasto) VALUES (3, 'Dobrowolski', 'Krzysztof', '620-14-08', 'Piastów');
insert into klient (id_k, nazwisko, imię, telefon, miasto) VALUES (4, 'Kowalki',	'Jan', '511-676-333', 'Warszawa');
insert into klient (id_k, nazwisko, imię, telefon, miasto) VALUES (5, 'Józefowicz',	'Anna', '669-0216-698', 'Warszawa');
insert into klient (id_k, nazwisko, imię, telefon, miasto) VALUES (6, 'Jeczak',	'Jerzy', '615-418-922', 'Warszawa');
insert into klient (id_k, nazwisko, imię, telefon, miasto) VALUES (7, 'Barszcz',	'Czesław', '609-656-873', 'Piastów');
insert into klient (id_k, nazwisko, imię, telefon, miasto) VALUES (8, 'Bojanowska',	'Urszula', '602-912-586', 'Pruszków');
insert into klient (id_k, nazwisko, imię, telefon, miasto) VALUES (9, 'Dzida',	'Andrzej', '911-353-961', 'Warszawa');



#tabela produkty
CREATE TABLE diety (
    id_d int,
    dieta VARCHAR(15),
    abonament VARCHAR(50),
    cena_netto INT,
    opis VARCHAR(155),
    primary key (id_d)
);
	INSERT INTO diety
	(id_d, dieta, abonament, cena_netto, opis)
VALUES
	(1 , 'odchudzająca', 'miesięczny', 2500, 'Dzięki miesięcznej diecie odchudzającej szybko i smacznie schudniesz.'),
	(2 , 'odchudzająca', 'tygodniowy', 800, 'Dzięki diecie odchudzającej szybko i smacznie schudniesz. Przetestuj przez tydzień.'),
    (3 , 'dieta', 'tygodniowy', 500, 'Pyszna dieta zapewniająca wszelkie wartości odżywcze. W pełni zbilansowana. Przetestuj przez tydzień'),
	(4 , 'dieta', 'miesięczny', 2600, 'Pyszna dieta zapewniająca wszelkie wartości odżywcze. W pełni zbilansowana.'),
    (5 , 'sport', 'tygodniowy', 900, 'Dieta dla sportowców, zapewniająca wytrzymałość i sprawność podczas treningów. Przetestuj przez tydzień'),
	(6 , 'sport', 'miesięczny', 2500, 'Dieta dla sportowców, zapewniająca wytrzymałość i sprawność podczas treningów.');

#tabe zamówienie łączą klienta z zamówieniem
CREATE TABLE zamówienia (
    id_z int,
	id_k int,
    id_d int,
    opłacono VARCHAR(10),
    primary key (id_z),
    FOREIGN KEY (id_k)
        REFERENCES klient (id_k),
	FOREIGN KEY (id_d)
        REFERENCES diety (id_d)
);
	INSERT INTO zamówienia
	(id_z, id_k, id_d, opłacono)
VALUES
	(1, 1, 1, 'TAK'),
	(2, 1, 5, 'TAK'),
    (3, 3, 1, 'TAK'),
	(4, 8, 4, 'NIE'),
    (5, 4, 2, 'TAK'),
    (6, 5, 2, 'TAK'),
	(7, 6, 4, 'TAK');


select imię, nazwisko, miasto, opłacono, dieta, abonament, cena_netto from diety join zamówienia on (id_z=id_z) natural join klient;




CREATE TABLE punkty_odbioru(
    id_o int,
	miasto VARCHAR(15),
    id_k int,
    adres_punktu VARCHAR(50),
    primary key (id_o),
    FOREIGN KEY (id_k)
        REFERENCES klient (id_k)
);
	INSERT INTO punkty_odbioru
	(id_o, miasto, id_k, adres_punktu )
VALUES
	(1, 'Warszawa', 1, 'ul. Postępu 26'),
	(2, 'Pruszków', 2, 'ul. Warszawska 56' ),
    (3, 'Piastów', 3, 'ul. Kopernika 12' );







# tabela uprawnień użytkowników
CREATE TABLE uprawnienia (
    ID INT,
    Imię VARCHAR(20),
    Nazwisko VARCHAR(50),
    uprawnienia VARCHAR(20),
    e_mail VARCHAR(25),
    login VARCHAR(20),
    hasło VARCHAR(20),
    primary key (ID)
    );
insert into uprawnienia (ID, Imię, Nazwisko, uprawnienia, e_mail, login, hasło) values (1, 'Anna', 'Malinowska', 'odczyt','a_malinowska@wp.pl' , 'a_malinowska', 'Mali1!');
insert into uprawnienia (ID, Imię, Nazwisko, uprawnienia, e_mail, login, hasło) values (2, 'Krzysztof', 'Kowalski', 'admin', 'k_kowalski@o2.pl', 'k_kowalski', 'Kowal1!');
insert into uprawnienia (ID, Imię, Nazwisko, uprawnienia, e_mail, login, hasło) values (3, 'Marcin', 'Wiśniewski', 'wprowadzanie', 'm_wisniewski@onet.pl', 'm_wisniewski', 'Wisnie1!');


#co oferujemy - jakie typy boxów
select dieta, opis, abonament, cena_netto, cena_netto*1.23 AS 'cena_brutto' from diety;


# ceny boxów od najwyższych
SELECT * FROM diety order by cena_netto DESC;
#gdzie odebrać zamówione boxy
SELECT miasto, adres_punktu FROM punkty_odbioru;


# dla pracowników
# którzy klienci z jakiej miejscowości
SELECT * FROM klient WHERE miasto='Warszawa';
SELECT * FROM klient WHERE miasto='Pruszków' OR miasto='Piastów';



#czy opłacono zamówienie
select imię, nazwisko, telefon, miasto, id_z, opłacono from klient natural join zamówienia order by opłacono;


select dieta, abonament, cena_netto, cena_netto*1.23 AS 'cena_brutto', opłacono, id_k from diety natural join zamówienia;

#  którą dietę kto kupił
select dieta, abonament, cena_netto, opłacono, imię, nazwisko, miasto from diety natural left join zamówienia natural left join klient where opłacono is not null;


# która diets nie została sprzedana
select dieta, abonament, cena_netto, opłacono, imię, nazwisko, miasto from diety natural left join zamówienia natural left join klient where opłacono is null;

