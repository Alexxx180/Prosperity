-- Проверено: работает без ошибок

CREATE TABLE Tasks (
	ID MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`Work` MEDIUMINT NOT NULL,
	`Name` VARCHAR(500) NOT NULL,
	`Hours` MEDIUMINT NOT NULL
);

CREATE TABLE Work_Types (
	ID MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`Name` VARCHAR(50) NOT NULL
);

CREATE TABLE Works (
	ID MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`Theme` MEDIUMINT NOT NULL,
	`Type` MEDIUMINT NOT NULL
);

CREATE TABLE Levels (
	ID MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`Name` VARCHAR(50) NOT NULL,
	`Description` VARCHAR(500) NOT NULL
);

CREATE TABLE Themes (
	ID MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`Topic` MEDIUMINT NOT NULL,
	`Level` MEDIUMINT NOT NULL,
	`No` MEDIUMINT NOT NULL,
	`Name` VARCHAR(500) NOT NULL,
	`Hours` MEDIUMINT NOT NULL
);

CREATE TABLE Competetions_Mastering (
	ID MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`Theme` MEDIUMINT NOT NULL,
	`General` MEDIUMINT NOT NULL,
	`Professional` MEDIUMINT NOT NULL
);

CREATE TABLE Theme_Plan (
	ID MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`Discipline` MEDIUMINT NOT NULL,
	`No` MEDIUMINT NOT NULL,
	`Name` VARCHAR(500) NOT NULL,
	`Hours` MEDIUMINT NOT NULL
);

CREATE TABLE Discipline_Codes (
	ID MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`Code` VARCHAR(15) NOT NULL
);

CREATE TABLE Disciplines (
	ID MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`Code` MEDIUMINT NOT NULL,
	`Name` VARCHAR(250) NOT NULL,
	`Relation` VARCHAR(500) NOT NULL,
	`DistanceCourse` VARCHAR(500) NOT NULL,
	`PrepareWay` VARCHAR(500) NOT NULL
);

CREATE TABLE Hours (
	ID MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`Discipline` MEDIUMINT NOT NULL,
	`WorkType` MEDIUMINT NOT NULL,
	`Count` MEDIUMINT NOT NULL
);

CREATE TABLE Source_Types (
	ID MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`Name` VARCHAR(250) NOT NULL
);

CREATE TABLE Sources (
	ID MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`Discipline` MEDIUMINT NOT NULL,
	`Type` MEDIUMINT NOT NULL,
	`Name` VARCHAR(1000) NOT NULL
);

CREATE TABLE Conformity (
	ID MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`Discipline` MEDIUMINT NOT NULL,
	`Speciality` MEDIUMINT NOT NULL
);

CREATE TABLE Speciality_Codes (
	ID MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`Code` VARCHAR(15) NOT NULL
);

CREATE TABLE Specialities (
	ID MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`Code` MEDIUMINT NOT NULL,
	`Name` VARCHAR(250) NOT NULL
);

CREATE TABLE General_Competetions (
	ID MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`Speciality` MEDIUMINT NOT NULL,
	`No` SMALLINT NOT NULL,
	`Name` VARCHAR(250) NOT NULL,
	`Knowledge` VARCHAR(1000) NOT NULL,
	`Skills` VARCHAR(1000) NOT NULL
);

CREATE TABLE Professional_Competetions (
	ID MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`Speciality` MEDIUMINT NOT NULL,
	`No1` SMALLINT NOT NULL,
	`No2` SMALLINT NOT NULL,
	`Name` VARCHAR(250) NOT NULL,
	`Knowledge` VARCHAR(1000) NOT NULL,
	`Skills` VARCHAR(1000) NOT NULL,
	`Experience` VARCHAR(1000) NOT NULL
);