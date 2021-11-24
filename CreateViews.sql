CREATE VIEW full_discipline_vision AS
SELECT *
FROM Disciplines
LEFT JOIN Theme_Plan -- (ID AS `Theme_Plan_ID`, `No`, Name)
ON Theme_Plan.`Discipline` = Disciplines.`ID`
LEFT JOIN Themes
ON Themes.`Topic` = Theme_Plan.`ID`
LEFT JOIN Works
ON Works.`Theme` = Themes.`ID`
LEFT JOIN Tasks
ON Tasks.`Work` = Works.`ID`;