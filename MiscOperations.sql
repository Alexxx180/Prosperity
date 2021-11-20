-- reset disciplines and hours relations

-- previous code

-- CREATE TABLE Disciplines (
-- ID MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
-- `Code` MEDIUMINT NOT NULL,
-- `Hours` MEDIUMINT NOT NULL,
-- `Name` VARCHAR(250) NOT NULL,
-- `Relation` VARCHAR(500) NOT NULL,
-- `DistanceCourse` VARCHAR(500) NOT NULL,
-- `PrepareWay` VARCHAR(500) NOT NULL
-- );
-- 
-- CREATE TABLE Hours (
-- ID MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
-- `Course` MEDIUMINT NOT NULL,
-- `Control` MEDIUMINT NOT NULL,
-- `Lections` MEDIUMINT NOT NULL,
-- `Practice` MEDIUMINT NOT NULL,
-- `LabWorks` MEDIUMINT NOT NULL,
-- `Prepare` MEDIUMINT NOT NULL
-- );

-- ALTER TABLE Disciplines
-- ADD FOREIGN KEY Disciplines_Hours (`Hours`)
-- 	  REFERENCES Hours (ID);

ALTER TABLE Disciplines DROP FOREIGN KEY Disciplines_Hours;

ALTER TABLE Disciplines DROP COLUMN `Hours`;

ALTER TABLE Hours DROP COLUMN `Course`;
ALTER TABLE Hours DROP COLUMN `Control`;
ALTER TABLE Hours DROP COLUMN `Lections`;
ALTER TABLE Hours DROP COLUMN `Practice`;
ALTER TABLE Hours DROP COLUMN `LabWorks`;
ALTER TABLE Hours DROP COLUMN `Prepare`;

ALTER TABLE Hours ADD COLUMN `Discipline` MEDIUMINT;
ALTER TABLE Hours ADD COLUMN `WorkType` MEDIUMINT;
ALTER TABLE Hours ADD COLUMN `Count` MEDIUMINT;

  	 ALTER TABLE Hours
ADD FOREIGN KEY Hours_Disciplines (`Discipline`)
	  REFERENCES Disciplines (ID);
	  
  	 ALTER TABLE Hours
ADD FOREIGN KEY Hours_Work_Types (`WorkType`)
	  REFERENCES Work_types (ID);