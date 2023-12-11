--CREATE DATABASE Torgovlya
USE Torgovlya

go 
create table Tip_dostavki(
Kod_dostavki int not null primary key,
Nazvanie varchar(100)
);

go
create table Sotrudniki(
Kod_sotrudnika int not null primary key,
Familia varchar(100) not null,
Ima varchar(100) not null,
Otchestvo varchar(100) not null,
Dolzhnost varchar(100) not null,
Data_rozhdenia date not null,
Data_priema_na_rabotu date not null,
Adres varchar(150) not null,
Gorod varchar(100) not null,
Indeks varchar(100) not null,
Telefon varchar(20) not null,
Primezhanie varchar(200) not null,
);



go
create table Postavshiki(
Kod_postavshika int not null primary key,
Nazvanie varchar(100) not null,
Kontaktnoe_lizo varchar(100) not null,
Dolzhnost varchar(150) not null,
Adres varchar(200) not null,
Gorod varchar(100) not null,
Oblast varchar(100) not null,
Indeks varchar(30) not null,
Telefon varchar(20) not null,
Faks varchar(20) not null,
Primezhanie varchar(200) not null,
);

go
create table Klienty(
Kod_klienta int not null primary key,
Nazvanie varchar(100) not null,
Kontaktnoe_lizo varchar(100) not null,
Dolzhnost varchar(150) not null,
Adres varchar(200) not null,
Gorod varchar(100) not null,
Oblast varchar(100) not null,
Indeks varchar(30) not null,
Telefon varchar(20) not null,
Faks varchar(20) not null,
);

go
create table Zakazi(
Kod_zakaza int not null primary key,
Klient int not null,
Sotrudniki int not null,
Data_zakaza date not null,
Sposob_dostavki varchar(150) not null,
Adres_poluzhatela varchar(200) not null,
Gorod varchar(100) not null,
Oblast varchar(100) not null,
Indeks varchar(30) not null,
foreign key (Klient) references Klienty (Kod_klienta),
foreign key (Sotrudniki) references Sotrudniki (Kod_sotrudnika),
foreign key (Kod_zakaza) references Tip_dostavki (Kod_dostavki)
);

go
create table Tip_tovara(
Kod_tip_tovara int not null primary key,
Nazvanie varchar(100) not null,
);

go
create table Ediniza_izmereniya(
Kod_ed_izmereniya int not null primary key,
Nazvanie varchar(100) not null,
);

go
create table Tovari(
Kod_tovara int not null primary key,
Nazvanie varchar(100) not null,
Postavshiki int not null,
Tip int not null,
Ed_izmereniya int not null,
Zena varchar(50) not null,
Kolvo_na_sklade varchar(30) not null,
min_zapas varchar(30) not null,
Postavki_prekrasheni varchar(20) not null,
foreign key (Ed_izmereniya) references Ediniza_izmereniya (Kod_ed_izmereniya),
foreign key (Tip) references Tip_tovara (Kod_tip_tovara),
foreign key (Postavshiki) references Postavshiki (Kod_postavshika)
);

go
create table Zakazaniy_tovar(
Kod_zakaza int not null primary key,
Tovar int not null,
Zena varchar(50) not null,
Kolizhestvo varchar(50) not null,
Skidka varchar(50) not null,
foreign key (Tovar) references Tovari (Kod_tovara),
foreign key (Kod_zakaza) references Zakazi (Kod_zakaza),
);
