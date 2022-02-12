-- Custom views

CREATE VIEW full_discipline_vision AS
SELECT
Disciplines.`ID` AS `No`,
Disciplines.`Name` AS `Name`,
Theme_Plan.`No` AS `Section_No`,
Theme_Plan.`Name` AS `Section_Name`,
Theme_Plan.`Hours` AS `Section_Hours`,
Themes.`No` AS `Theme_No`,
Themes.`Name` AS `Theme_Name`,
Themes.`Hours` AS `Theme_Hours`,
Work_types.`Name` AS `Work_Type`,
Tasks.`Name` AS `Task_Name`,
Tasks.`Hours`  AS `Task_Hours`
FROM Disciplines
LEFT JOIN Theme_Plan -- (ID AS `Theme_Plan_ID`, `No`, Name)
ON Theme_Plan.`Discipline` = Disciplines.`ID`
LEFT JOIN Themes
ON Themes.`Topic` = Theme_Plan.`ID`
LEFT JOIN Works
ON Works.`Theme` = Themes.`ID`
LEFT JOIN Work_types
ON Works.`Type` = Work_types.`ID`
LEFT JOIN Tasks
ON Tasks.`Work` = Works.`ID`;

CREATE VIEW full_general_competetions_vision AS
SELECT
Specialities.`ID` AS `No`,
Specialities.`Name` AS `Name`,
General_Competetions.`No` AS `GC_No`,
General_Competetions.`Name` AS `General_Competetion_Name`,
General_Competetions.`Knowledge` AS `Knowledge`,
General_Competetions.`Skills` AS `Skills`
FROM Specialities
LEFT JOIN General_Competetions
ON Specialities.`ID` = General_Competetions.`Speciality`;

CREATE VIEW full_professional_competetions_vision AS
SELECT
Specialities.`ID` AS `No`,
Specialities.`Name` AS `Name`,
Professional_Competetions.`No1` AS `PC_No_1`,
Professional_Competetions.`No2` AS `PC_No_2`,
Professional_Competetions.Name AS `Proffesional_Competetion_Name`,
Professional_Competetions.`Knowledge` AS `Knowledge`,
Professional_Competetions.`Skills` AS `Skills`,
Professional_Competetions.`Experience` AS `Experience`
FROM Specialities
LEFT JOIN Professional_Competetions
ON Specialities.`ID` = Professional_Competetions.`Speciality`;