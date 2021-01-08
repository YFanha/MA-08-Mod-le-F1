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
	weight float null,
	addresse_id INT not null,
	team_id INT not null,
	role_id INT not null,

	CONSTRAINT uniquePerson unique(lastname, firstname, birthdate)
);


-- Créer la table adresses

Create table addresses (
	id int identity(1,1) primary key not null,
	street varchar(50) not null,
	zipCode varchar(50) not null,
	city varchar(50) not null,
	AdditionnalAddress varchar(100) null,
	country varchar(50) not null,

	CONSTRAINT uniqueAddresse unique(street, zipcode, city, country)
);


-- Créer la table Sponsors

Create table Sponsors (
	id int identity(1,1) primary key not null,
	name varchar(50) not null,
	value float not null,
	creationDate date not null,
	agreementDuration time not null,
	advertType varchar(50) not null,
	addresse_id INT not null,

	CONSTRAINT uniqueSponsor unique(name, creationDate)
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
	headquarter_id INT not null,

	CONSTRAINT uniqueTeam unique(name)
);

-- Créer la table voitures

Create table Cars (
	id int identity(1,1) primary key not null,
	chassisNumber varchar(20) not null,
	brand varchar(50) not null,
	model varchar(100) not null,
	netWeight int,
	power int,
	team_id INT not null,

	CONSTRAINT uniqueCar unique(chassisNumber)
);

-- Créer la table circuits
Create table Circuits (
	id int identity(1,1) primary key not null,
	name varchar(50) not null,
	country varchar(50) not null,
	city varchar(50) not null,
	lenght DECIMAL(20) not null,
	nbTurns DECIMAL(20) null,
	creatDate DATE null,

	CONSTRAINT uniqueCircuit unique(name, city)
);

-- Créer la table people_race_circuits
Create table people_race_circuits (
	id int identity(1,1) primary key not null,
	raceDate DATE not null,
	time TIME null,
	people_id INT not null,
	circuit_id INT not null
);

-- Créer la table headquarters
Create table Headquarters (
	id int identity(1,1) primary key not null,
	name varchar(50) not null,
	creationDate DATE null,

	CONSTRAINT uniqueHeadquarter unique(name)
);

-- Créer la table roles
Create table Roles (
	id int identity(1,1) primary key not null,
	name varchar(50) not null,

	CONSTRAINT uniqueRole unique(name)
);

-- Créer la table results
Create table Results (
	id int identity(1,1) primary key not null,
	date DATE not null,
	time TIME not null,
	point int not null,
	circuit_id INT not null,
	person_id INT not null,

	CONSTRAINT uniqueResult unique(date, circuit_id, time)
);

-- Créer la table sponsors_finance_teams
Create table sponsors_finance_teams (
	id int identity(1,1) primary key not null,
	team_id INT not null,
	sponsor_id INT not null,
);

-- Modifier la table personnes
ALTER TABLE people
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
	

-- Modifier la table adresses



-- Modifier la table Sponsors


-- Modifier la table ecuries


-- Modifier la table voitures



-- Modifier la table circuits


-- Modifier la table people_race_circuits


-- Modifier la table headquarters


-- Modifier la table roles


-- Modifier la table results


-- Modifier la table sponsors_finance_teams





--ALTER TABLE Results
--ADD CONSTRAINT uniqueResult unique(date, place, time, point)