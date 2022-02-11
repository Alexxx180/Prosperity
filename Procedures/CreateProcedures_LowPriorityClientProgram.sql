-- Custom procedures

delimiter \;

CREATE PROCEDURE get_conformity_full()
BEGIN
	SELECT `ID`, `Discipline`, `Speciality`
	FROM conformity;
END;

delimiter \;

CREATE PROCEDURE get_specialities()
BEGIN
	SELECT `ID`, `Code`, `Name` 
	FROM Specialities;
END;

delimiter \;

CREATE PROCEDURE get_speciality_codes()
BEGIN
	SELECT `ID`, `Code`
	FROM Speciality_codes;
END;

CREATE PROCEDURE get_specialities_full()
BEGIN
	SELECT Specialities.`ID`, Speciality_codes.`Code`, Specialities.`Name` 
	FROM Specialities
	LEFT JOIN
	Speciality_codes
	ON Specialities.`Code` = Speciality_codes.`ID`;
END;

CREATE PROCEDURE get_speciality_general(speciality_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `No`, `Name`, `Knowledge`, `Skills`
	FROM General_competetions
	WHERE `Speciality` = speciality_id; -- speciality_id
END;

delimiter \;

CREATE PROCEDURE get_speciality_professional(speciality_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `No1`, `No2`, `Name`, `Knowledge`, `Skills`, `Experience`
	FROM Professional_competetions
	WHERE `Speciality` = speciality_id;
END;

delimiter \;

CREATE PROCEDURE get_speciality_disciplines(speciality_id INT UNSIGNED)
BEGIN
	SELECT Disciplines.`ID`, Discipline_codes.`Code`, Disciplines.`Name` 
	FROM Disciplines
	LEFT JOIN
	Discipline_codes
	ON Disciplines.`Code` = Discipline_codes.`ID`
	WHERE Disciplines.`ID` = (
		SELECT `Discipline`
		FROM Conformity
		WHERE `Speciality` = speciality_id
	);
END;

-- delimiter \;

CREATE PROCEDURE get_disciplines()
BEGIN
	SELECT `ID`, `Code`, `Name` 
	FROM Disciplines;
END;

delimiter \;

CREATE PROCEDURE get_discipline_codes()
BEGIN
	SELECT `ID`, `Code`
	FROM Discipline_codes;
END;

CREATE PROCEDURE get_disciplines_full()
BEGIN
	SELECT Disciplines.`ID`, Discipline_codes.`Code`, Disciplines.`Name` 
	FROM Disciplines
	LEFT JOIN
	Discipline_codes
	ON Disciplines.`Code` = Discipline_codes.`ID`;
END;

delimiter \;

CREATE PROCEDURE get_discipline_total_hours_original(discipline_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `WorkType`, `Count`
	FROM Hours
	WHERE `Discipline` = discipline_id; -- discipline_id
END;

CREATE PROCEDURE get_discipline_total_hours(discipline_id INT UNSIGNED)
BEGIN
	SELECT Hours.`ID`, Work_types.`Name`, Hours.`Count`
	FROM Hours
	LEFT JOIN
	Work_types
	ON Work_types.`ID` = Hours.`WorkType`
	WHERE `Discipline` = discipline_id; -- discipline_id
END;

CREATE PROCEDURE get_theme_plan_by_discipline(discipline_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `No`, `Name`, `Hours`
	FROM Theme_plan
	WHERE `Discipline` = discipline_id;
END;

CREATE PROCEDURE get_themes_by_section(section_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `No`, `Name`, `Hours`, `Level`
	FROM Themes
	WHERE `Topic` = section_id;
END;

delimiter \;

CREATE PROCEDURE get_work_by_theme_original(theme_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `Type`
	FROM Works
	WHERE `Theme` = theme_id;
END;

CREATE PROCEDURE get_work_by_theme(theme_id INT UNSIGNED)
BEGIN
	SELECT Works.`ID`, Work_types.`Name`
	FROM Works
	LEFT JOIN
	Work_types
	ON Work_types.`ID` = Works.`Type`
	WHERE `Theme` = theme_id;
END;

CREATE PROCEDURE get_task_by_work(work_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `Name`, `Hours`
	FROM Tasks
	WHERE `Work` = work_id;
END;

delimiter \;

CREATE PROCEDURE get_discipline_meta_data_original(discipline_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `Type`, `Name`
	FROM Meta_data
	WHERE `Discipline` = discipline_id;
END;

delimiter \;

CREATE PROCEDURE get_discipline_meta_data(discipline_id INT UNSIGNED)
BEGIN
	SELECT Meta_data.`ID`, Meta_types.`Name` AS `Type`, Meta_data.`Name`
	FROM Meta_data
	LEFT JOIN
	Meta_types
	ON Meta_types.`ID` = Meta_data.`Type`
	WHERE `Discipline` = discipline_id;
END;

delimiter \;

CREATE PROCEDURE get_discipline_sources(discipline_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `Name`, `Type`
	FROM Sources
	WHERE `Discipline` = discipline_id
	ORDER BY
	`Type`;
END;

delimiter \;

CREATE PROCEDURE get_conformity_general_competetions(discipline_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `No`, `Name`, `Knowledge`, `Skills`
	FROM General_competetions
	WHERE `Speciality` = (
		SELECT `Speciality`
		FROM Conformity
		WHERE `Discipline` = discipline_id
	); -- discipline_id
END;

delimiter \;

CREATE PROCEDURE get_conformity_professional_competetions(discipline_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `No1`, `No2`, `Name`, `Knowledge`, `Skills`
	FROM Professional_competetions
	WHERE `Speciality` = (
		SELECT `Speciality`
		FROM Conformity
		WHERE `Discipline` = discipline_id
	); -- discipline_id
END;


delimiter \;

CREATE PROCEDURE get_discipline_general_by_theme(theme_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `Mastering`
	FROM General_mastering
	WHERE `Discipline` = (
		SELECT get_discipline_by_theme_id(theme_id) -- theme_id
	); -- discipline_id
END;

delimiter \;

CREATE PROCEDURE get_discipline_professional_by_theme(theme_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `Mastering`
	FROM Professional_mastering
	WHERE `Discipline` = (
		SELECT get_discipline_by_theme_id(theme_id) -- theme_id
	); -- discipline_id
END;

delimiter \;

CREATE PROCEDURE get_meta_types()
BEGIN
	SELECT `ID`, `Name`
	FROM Meta_types;
END;

delimiter \;

CREATE PROCEDURE get_work_types()
BEGIN
	SELECT `ID`, `Name`
	FROM Work_types;
END;

delimiter \;

CREATE PROCEDURE get_source_types()
BEGIN
	SELECT `ID`, `Name`
	FROM Source_types;
END;

delimiter \;

CREATE PROCEDURE get_all_levels()
BEGIN
	SELECT `ID`, `Name`, `Description`
	FROM Levels;
END;

delimiter \;

CREATE PROCEDURE get_discipline_general_mastering(discipline_id INT UNSIGNED)
BEGIN
	SELECT
	General_competetions.`ID`,
	General_competetions.`No`,
	General_competetions.`Name`,
	General_competetions.`Knowledge`,
	General_competetions.`Skills`
	FROM General_mastering
	LEFT JOIN
	General_competetions
	ON General_competetions.`ID` = General_mastering.`Mastering`
	WHERE `Discipline` = discipline_id;
END;

delimiter \;

CREATE PROCEDURE get_discipline_professional_mastering(discipline_id INT UNSIGNED)
BEGIN
	SELECT
	Professional_competetions.`ID`,
	Professional_competetions.`No1`,
	Professional_competetions.`No2`,
	Professional_competetions.`Name`,
	Professional_competetions.`Knowledge`,
	Professional_competetions.`Skills`,
	Professional_competetions.`Experience`
	FROM Professional_mastering
	LEFT JOIN
	Professional_competetions
	ON Professional_competetions.`ID` = Professional_mastering.`Mastering`
	WHERE `Discipline` = discipline_id;
END;

delimiter \;

CREATE PROCEDURE get_theme_general_mastering_selection(theme_id INT UNSIGNED)
BEGIN
	SELECT
	General_competetions.`ID`,
	General_competetions.`No`
	FROM General_selection
	LEFT JOIN
	General_mastering
	ON General_mastering.`ID` = General_selection.`Mastering`
	LEFT JOIN
	General_competetions
	ON General_competetions.`ID` = General_mastering.`Mastering`
	WHERE `Theme` = theme_id;
END;

delimiter \;

CREATE PROCEDURE get_theme_professional_mastering_selection(theme_id INT UNSIGNED)
BEGIN
	SELECT
	Professional_competetions.`ID`,
	Professional_competetions.`No1`,
	Professional_competetions.`No2`
	FROM Professional_selection
	LEFT JOIN
	Professional_mastering
	ON Professional_mastering.`ID` = Professional_selection.`Mastering`
	LEFT JOIN
	Professional_competetions
	ON Professional_competetions.`ID` = Professional_mastering.`Mastering`
	WHERE `Theme` = theme_id;
END;