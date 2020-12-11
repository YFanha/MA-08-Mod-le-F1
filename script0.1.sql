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