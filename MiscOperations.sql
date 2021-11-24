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


UPDATE Tasks SET `Hours` = 5 WHERE ID = 1;
UPDATE Tasks SET `Hours` = 12 WHERE ID = 6;
UPDATE Tasks SET `Hours` = 3 WHERE ID = 39;
UPDATE Tasks SET `Hours` = 1 WHERE ID = 52;

CALL drop_all_hours();

ALTER TABLE Hours AUTO_INCREMENT = 1;

CALL add_hour(
	1, 1, 0
);

CALL add_hour(
	1, 2, 0
);

CALL add_hour(
	1, 3, 0
);

CALL add_hour(
	1, 4, 0
);

CALL add_hour(
	1, 5, 0
);

CALL add_hour(
	1, 6, 0
);

CALL add_hour(
	1, 7, 0
);


CALL add_hour(
	2, 1, 0
);

CALL add_hour(
	2, 2, 0
);

CALL add_hour(
	2, 3, 0
);

CALL add_hour(
	2, 4, 0
);

CALL add_hour(
	2, 5, 0
);

CALL add_hour(
	2, 6, 0
);

CALL add_hour(
	2, 7, 0
);


CALL add_hour(
	3, 1, 0
);

CALL add_hour(
	3, 2, 0
);

CALL add_hour(
	3, 3, 0
);

CALL add_hour(
	3, 4, 0
);

CALL add_hour(
	3, 5, 0
);

CALL add_hour(
	2, 6, 0
);

CALL add_hour(
	3, 7, 0
);
	

delimiter \;

BEGIN
	DECLARE theme_id, discipline_id, work_type_id, theme_hours, dp_hours INT UNSIGNED;
	SET theme_id = (SELECT get_theme_by_task_id(52));
	SET work_type_id = (SELECT get_work_type_by_task_id(52));
	SET discipline_id = (SELECT get_discipline_by_task_id(52));
	SET theme_hours = (SELECT get_theme_hours(25));
	SELECT get_discipline_hours_by_work_type(3, 2); 
END;