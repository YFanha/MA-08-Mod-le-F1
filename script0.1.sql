/*	
	Author : Sven Volery & Yann Fanha
	Project : Formule 1 (F1)
	version : 11.12.2020
*/
--Create database F1;

use F1;

-- Créer la table personnes

Create table people (
	id int identity(1,1) primary key not null,
	lastname varchar(50) not null,
	firstname varchar(50) not null,
	birthdate date not null,
	nationality varchar(50) not null,
	height float null,
	weight float null

	unique(lastname, firstname, birthdate)
);


-- Créer la table adresses

Create table addresses (
	id int identity(1,1) primary key not null,
	street varchar(50) not null,
	zipCode varchar(50) not null,
	city varchar(50) not null,
	AdditionnalAddress varchar(100) null,
	country varchar(50) not null,

	unique(street, zipcode, city, country)
);


-- Créer la table Sponsors

Create table Sponsors (
	id int identity(1,1) primary key not null,
	name varchar(50) not null,
	value float not null,
	creationDate date not null,
	agreementDuration time not null,
	advertType varchar(50) not null,

	unique(name, creationDate)
);


-- Créer la table ecuries

Create table Teams (
	id int identity(1,1) primary key not null,
	name varchar(50) not null,
	country varchar(50) not null,
	F1since int null,
	victoryNumber varchar(100),
	nbrGP int null,
	president varchar(50) not null,

	unique(name)
);

-- Créer la table voitures

Create table Cars (
	id int identity(1,1) primary key not null,
	chassisNumber varchar(20) not null,
	brand varchar(50) not null,
	model varchar(100) not null,
	netWeight int,
	power int,

	unique(chassisNumber)
);