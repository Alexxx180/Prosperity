-- reset disciplines and hours relations

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
	  
DELETE FROM speciality_codes WHERE `ID` >= 4;
UPDATE speciality_codes SET `Code` = "15.02.14" WHERE `ID` = 2;

ALTER TABLE Competetions_mastering DROP FOREIGN KEY Competetions_Mastering_Themes;
ALTER TABLE Competetions_mastering CHANGE COLUMN `Theme` `Discipline` MEDIUMINT NOT NULL;

	 ALTER TABLE Competetions_Mastering
ADD FOREIGN KEY Competetions_Mastering_Disciplines (`Discipline`)
	  REFERENCES Disciplines (ID);
	  

ALTER TABLE Disciplines DROP COLUMN `Relation`;
ALTER TABLE Disciplines DROP COLUMN `DistanceCourse`;
ALTER TABLE Disciplines DROP COLUMN `PrepareWay`;

ALTER TABLE Meta_data AUTO_INCREMENT = 3;
ALTER TABLE Disciplines AUTO_INCREMENT = 2;
ALTER TABLE Themes AUTO_INCREMENT = 24;
ALTER TABLE Works AUTO_INCREMENT = 2;
ALTER TABLE Tasks AUTO_INCREMENT = 52;
ALTER TABLE Sources AUTO_INCREMENT = 9;
UPDATE Themes SET ID = 1 WHERE ID = 5;
UPDATE Works SET ID = 1 WHERE ID = 4;
UPDATE Tasks SET ID = 4 WHERE ID = 5;
