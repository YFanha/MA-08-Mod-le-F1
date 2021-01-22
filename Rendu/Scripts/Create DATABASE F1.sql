/*	
	Author : Sven Volery & Yann Fanha
	Project : Formule 1 (F1)
	version : v0.1 08.01.2021
*/

-- DROP DATABASE F1;

USE master

DROP DATABASE IF EXISTS F1;

CREATE DATABASE F1
	ON PRIMARY
	( NAME = 'F1', FILENAME = 'C:\Data\MA08\F1.mdf', SIZE = 2048KB, MAXSIZE = 51200KB, FILEGROWTH = 1024KB)

	LOG ON
	( NAME = 'F1_log', FILENAME = 'C:\Data\MA08\F1_log.mdf', SIZE = 10240KB, MAXSIZE = 20480, FILEGROWTH = 1024KB)


--use database F1;
use F1;



----------------CREATE TABLE--------------------------------------------------------------

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

	CONSTRAINT uniquePerson unique(lastname, firstname, birthdate, role_id)
);


-- Créer la table adresses
Create table addresses (
	id int identity(1,1) primary key not null,
	street varchar(50) not null,
	zipCode varchar(50) not null,
	city varchar(50) not null,
	additionnalAddress varchar(100) null,
	country varchar(50) not null,

	CONSTRAINT uniqueAddresse unique(street, zipcode, city, additionnalAddress, country)
);


-- Créer la table Sponsors
Create table sponsors (
	id int identity(1,1) primary key not null,
	name varchar(50) not null,
	creationDate date not null,
	addresse_id INT null,

	CONSTRAINT uniqueSponsor unique(name, creationDate)
);


-- Créer la table ecuries
Create table teams (
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
Create table cars (
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
Create table circuits (
	id int identity(1,1) primary key not null,
	name varchar(50) not null,
	country varchar(50) not null,
	city varchar(50) not null,
	lenght DECIMAL(20) not null,
	nbTurns DECIMAL(20) null,
	creatDate INT null,

	CONSTRAINT uniqueCircuit unique(name, city)
);

-- Créer la table people_race_circuits
Create table people_race_circuits (
	id int identity(1,1) primary key not null,
	raceDate DATE not null,
	time TIME null,
	person_id INT not null,
	circuit_id INT not null

	CONSTRAINT uniqueRace unique(raceDate, time, person_id, circuit_id)
);

-- Créer la table headquarters
Create table headquarters (
	id int identity(1,1) primary key not null,
	name varchar(50) not null,
	creationDate DATE null,

	CONSTRAINT uniqueHeadquarter unique(name)
);

-- Créer la table roles
Create table roles (
	id int identity(1,1) primary key not null,
	name varchar(50) not null,

	CONSTRAINT uniqueRole unique(name)
);

-- Créer la table results
Create table results (
	id int identity(1,1) primary key not null,
	places INT not null,
	date DATE not null,
	time TIME not null,
	point int not null,
	circuit_id INT not null,
	person_id INT not null,

	CONSTRAINT uniqueResult unique(date, circuit_id, time, person_id)
);

-- DROP TABLE sponsors_finance_teams;

-- Créer la table sponsors_finance_teams
Create table sponsors_finance_teams (
	id int identity(1,1) primary key not null,
	advertType varchar(50) not null,
	value varchar(25) not null,
	team_id INT not null,
	sponsor_id INT not null,
	dateSignature DATE not null,
	agreementDuration INT not null,

	CONSTRAINT uniqueSponsoring unique(advertType, value, team_id, sponsor_id, dateSignature)
);

----------------ALTER TABLE---------------------------------------------------------------

-- Modifier la table personnes
ALTER TABLE people WITH CHECK ADD CONSTRAINT fk_addresse_person FOREIGN KEY (addresse_id) 
REFERENCES addresses(id);

ALTER TABLE people WITH CHECK ADD CONSTRAINT fk_team_person FOREIGN KEY (team_id) 
REFERENCES teams(id);

ALTER TABLE people WITH CHECK ADD CONSTRAINT fk_role_person FOREIGN KEY (role_id) 
REFERENCES roles(id);

-- Modifier la table adresses


-- Modifier la table Sponsors
ALTER TABLE sponsors WITH CHECK ADD CONSTRAINT fk_addresse_sponsor FOREIGN KEY (addresse_id) 
REFERENCES addresses(id);

-- Modifier la table ecuries
ALTER TABLE teams WITH CHECK ADD CONSTRAINT fk_headquarter_team FOREIGN KEY (headquarter_id) 
REFERENCES headquarters(id);

-- Modifier la table voitures
ALTER TABLE cars WITH CHECK ADD CONSTRAINT fk_team_car FOREIGN KEY (team_id) 
REFERENCES teams(id);


-- Modifier la table circuits

-- Modifier la table people_race_circuits
ALTER TABLE people_race_circuits WITH CHECK ADD CONSTRAINT fk_person_race FOREIGN KEY (person_id) 
REFERENCES people(id);

ALTER TABLE people_race_circuits WITH CHECK ADD CONSTRAINT fk_circuit_race FOREIGN KEY (circuit_id) 
REFERENCES circuits(id);

-- Modifier la table headquarters


-- Modifier la table roles


-- Modifier la table results
ALTER TABLE results WITH CHECK ADD CONSTRAINT fk_person_result FOREIGN KEY (person_id) 
REFERENCES people(id);

ALTER TABLE results WITH CHECK ADD CONSTRAINT fk_circuit_result FOREIGN KEY (circuit_id) 
REFERENCES circuits(id);

-- Modifier la table sponsors_finance_teams
ALTER TABLE sponsors_finance_teams WITH CHECK ADD CONSTRAINT fk_team_finance FOREIGN KEY (team_id) 
REFERENCES teams(id);


ALTER TABLE sponsors_finance_teams WITH CHECK ADD CONSTRAINT fk_sponsor_finance FOREIGN KEY (sponsor_id) 
REFERENCES sponsors(id);

