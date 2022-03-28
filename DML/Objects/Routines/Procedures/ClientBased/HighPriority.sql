-- Custom procedures

DELIMITER $$

CREATE PROCEDURE get_conformity_full_marked()
BEGIN
	SELECT `ID`, `Discipline`, `Speciality`
	FROM Conformity
	WHERE `ToDrop` = 1;
END$$

CREATE PROCEDURE get_specialities_marked()
BEGIN
	SELECT `ID`, `Code`, `Name` 
	FROM Specialities
	WHERE `ToDrop` = 1;
END$$

CREATE PROCEDURE get_speciality_codes_marked()
BEGIN
	SELECT `ID`, `Code`
	FROM Speciality_codes
	WHERE `ToDrop` = 1;
END$$

CREATE PROCEDURE get_speciality_general_marked(speciality_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `No`, `Name`, `Knowledge`, `Skills`
	FROM General_competetions
	WHERE `Speciality` = speciality_id
	AND `ToDrop` = 1;
END$$

CREATE PROCEDURE get_speciality_professional_marked(speciality_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `No1`, `No2`, `Name`, `Knowledge`, `Skills`, `Experience`
	FROM Professional_competetions
	WHERE `Speciality` = speciality_id
	AND `ToDrop` = 1;
END$$

CREATE PROCEDURE get_disciplines_marked()
BEGIN
	SELECT `ID`, `Code`, `Name` 
	FROM Disciplines
	WHERE `ToDrop` = 1;
END$$

CREATE PROCEDURE get_discipline_codes_marked()
BEGIN
	SELECT `ID`, `Code`
	FROM Discipline_codes
	WHERE `ToDrop` = 1;
END$$

CREATE PROCEDURE get_discipline_total_hours_marked(discipline_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `WorkType`, `Count`
	FROM Hours
	WHERE `Discipline` = discipline_id
	AND `ToDrop` = 1;
END$$

CREATE PROCEDURE get_theme_plan_by_discipline_marked(discipline_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `No`, `Name`, `Hours`
	FROM Theme_plan
	WHERE `Discipline` = discipline_id
	AND `ToDrop` = 1;
END$$

CREATE PROCEDURE get_themes_by_section_marked(section_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `No`, `Name`, `Hours`, `Level`
	FROM Themes
	WHERE `Topic` = section_id
	AND `ToDrop` = 1;
END$$

CREATE PROCEDURE get_work_by_theme_marked(theme_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `Type`
	FROM Works
	WHERE `Theme` = theme_id
	AND `ToDrop` = 1;
END$$

CREATE PROCEDURE get_task_by_work_marked(work_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `Name`, `Hours`
	FROM Tasks
	WHERE `Work` = work_id
	AND `ToDrop` = 1;
END$$

CREATE PROCEDURE get_discipline_meta_data_marked(discipline_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `Type`, `Name`
	FROM Meta_data
	WHERE `Discipline` = discipline_id
	AND `ToDrop` = 1;
END$$

CREATE PROCEDURE get_discipline_sources_marked(discipline_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `Name`, `Type`
	FROM Sources
	WHERE `Discipline` = discipline_id
	AND `ToDrop` = 1
	ORDER BY
	`Type`;
END$$

CREATE PROCEDURE get_conformity_general_competetions_marked(discipline_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `No`, `Name`, `Knowledge`, `Skills`
	FROM General_competetions
	WHERE `Speciality` = (
		SELECT `Speciality`
		FROM Conformity
		WHERE `Discipline` = discipline_id
	) AND `ToDrop` = 1;
END$$

CREATE PROCEDURE get_conformity_professional_competetions_marked(discipline_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `No1`, `No2`, `Name`, `Knowledge`, `Skills`, `Experience`
	FROM Professional_competetions
	WHERE `Speciality` = (
		SELECT `Speciality`
		FROM Conformity
		WHERE `Discipline` = discipline_id
	) AND `ToDrop` = 1;
END$$

CREATE PROCEDURE get_meta_types_marked()
BEGIN
	SELECT `ID`, `Name`
	FROM Meta_types
	WHERE `ToDrop` = 1;
END$$

CREATE PROCEDURE get_work_types_marked()
BEGIN
	SELECT `ID`, `Name`
	FROM Work_types
	WHERE `ToDrop` = 1;
END$$

CREATE PROCEDURE get_source_types_marked()
BEGIN
	SELECT `ID`, `Name`
	FROM Source_types
	WHERE `ToDrop` = 1;
END$$

CREATE PROCEDURE get_all_levels_marked()
BEGIN
	SELECT `ID`, `Name`, `Description`
	FROM Levels
	WHERE `ToDrop` = 1;
END$$

CREATE PROCEDURE get_discipline_general_mastering_marked(discipline_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `Mastering`
	FROM General_mastering
	WHERE `Discipline` = discipline_id
	AND `ToDrop` = 1;
END$$

CREATE PROCEDURE get_discipline_professional_mastering_marked(discipline_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `Mastering`
	FROM Professional_mastering
	WHERE `Discipline` = discipline_id
	AND `ToDrop` = 1;
END$$

CREATE PROCEDURE get_theme_general_mastering_selection_marked(theme_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `Mastering`
	FROM General_selection
	WHERE `Theme` = theme_id 
	AND `ToDrop` = 1;
END$$

CREATE PROCEDURE get_theme_professional_mastering_selection_marked(theme_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `Mastering`
	FROM Professional_selection
	WHERE `Theme` = theme_id
	AND `ToDrop` = 1;
END$$
