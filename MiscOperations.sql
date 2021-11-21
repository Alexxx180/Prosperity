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
	  
	  