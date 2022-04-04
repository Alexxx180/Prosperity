-- Custom procedures

DELIMITER $$

CREATE PROCEDURE get_conformity_full_unmarked()
BEGIN
	SELECT `ID`, `Discipline`, `Speciality`
	FROM Conformity
	WHERE `ToDrop` = 0;
END$$

CREATE PROCEDURE get_specialities_unmarked()
BEGIN
	SELECT `ID`, `Code`, `Name` 
	FROM Specialities
	WHERE `ToDrop` = 0;
END$$

CREATE PROCEDURE get_speciality_codes_unmarked()
BEGIN
	SELECT `ID`, `Code`
	FROM Speciality_codes
	WHERE `ToDrop` = 0;
END$$

CREATE PROCEDURE get_speciality_general_unmarked(speciality_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `No`, `Name`, `Knowledge`, `Skills`
	FROM General_competetions
	WHERE `Speciality` = speciality_id
	AND `ToDrop` = 0;
END$$

CREATE PROCEDURE get_speciality_professional_unmarked(speciality_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `No1`, `No2`, `Name`, `Knowledge`, `Skills`, `Experience`
	FROM Professional_competetions
	WHERE `Speciality` = speciality_id
	AND `ToDrop` = 0;
END$$

CREATE PROCEDURE get_disciplines_unmarked()
BEGIN
	SELECT `ID`, `Code`, `Name` 
	FROM Disciplines
	WHERE `ToDrop` = 0;
END$$

CREATE PROCEDURE get_discipline_codes_unmarked()
BEGIN
	SELECT `ID`, `Code`
	FROM Discipline_codes
	WHERE `ToDrop` = 0;
END$$

CREATE PROCEDURE get_discipline_total_hours_unmarked(discipline_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `WorkType`, `Count`
	FROM Hours
	WHERE `Discipline` = discipline_id
	AND `ToDrop` = 0;
END$$

CREATE PROCEDURE get_theme_plan_by_discipline_unmarked(discipline_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `No`, `Name`, `Hours`
	FROM Theme_plan
	WHERE `Discipline` = discipline_id
	AND `ToDrop` = 0;
END$$

CREATE PROCEDURE get_themes_by_section_unmarked(section_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `No`, `Name`, `Hours`, `Level`
	FROM Themes
	WHERE `Topic` = section_id
	AND `ToDrop` = 0;
END$$

CREATE PROCEDURE get_work_by_theme_unmarked(theme_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `Type`
	FROM Works
	WHERE `Theme` = theme_id
	AND `ToDrop` = 0;
END$$

CREATE PROCEDURE get_task_by_work_unmarked(work_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `Name`, `Hours`
	FROM Tasks
	WHERE `Work` = work_id
	AND `ToDrop` = 0;
END$$

CREATE PROCEDURE get_discipline_meta_data_unmarked(discipline_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `Type`, `Name`
	FROM Meta_data
	WHERE `Discipline` = discipline_id
	AND `ToDrop` = 0;
END$$

CREATE PROCEDURE get_discipline_sources_unmarked(discipline_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `Name`, `Type`
	FROM Sources
	WHERE `Discipline` = discipline_id
	AND `ToDrop` = 0
	ORDER BY
	`Type`;
END$$

CREATE PROCEDURE get_conformity_general_competetions_unmarked(discipline_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `No`, `Name`, `Knowledge`, `Skills`
	FROM General_competetions
	WHERE `Speciality` = (
		SELECT `Speciality`
		FROM Conformity
		WHERE `Discipline` = discipline_id
	) AND `ToDrop` = 0;
END$$

CREATE PROCEDURE get_conformity_professional_competetions_unmarked(discipline_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `No1`, `No2`, `Name`, `Knowledge`, `Skills`, `Experience`
	FROM Professional_competetions
	WHERE `Speciality` = (
		SELECT `Speciality`
		FROM Conformity
		WHERE `Discipline` = discipline_id
	) AND `ToDrop` = 0;
END$$

CREATE PROCEDURE get_discipline_by_theme(theme_id INT UNSIGNED)
BEGIN
	DECLARE topic_id, discipline_id INT UNSIGNED;
	SET topic_id = (SELECT get_topic_by_theme_id(theme_id));
	SELECT `Discipline`
	FROM Theme_Plan
	WHERE `ID` = topic_id;
END$$

CREATE PROCEDURE get_meta_types_unmarked()
BEGIN
	SELECT `ID`, `Name`
	FROM Meta_types
	WHERE `ToDrop` = 0;
END$$

CREATE PROCEDURE get_work_types_unmarked()
BEGIN
	SELECT `ID`, `Name`
	FROM Work_types
	WHERE `ToDrop` = 0;
END$$

CREATE PROCEDURE get_source_types_unmarked()
BEGIN
	SELECT `ID`, `Name`
	FROM Source_types
	WHERE `ToDrop` = 0;
END$$

CREATE PROCEDURE get_all_levels_unmarked()
BEGIN
	SELECT `ID`, `Name`, `Description`
	FROM Levels
	WHERE `ToDrop` = 0;
END$$

CREATE PROCEDURE get_discipline_general_mastering_unmarked(discipline_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `Mastering`
	FROM General_mastering
	WHERE `Discipline` = discipline_id
	AND `ToDrop` = 0;
END$$

CREATE PROCEDURE get_discipline_professional_mastering_unmarked(discipline_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `Mastering`
	FROM Professional_mastering
	WHERE `Discipline` = discipline_id
	AND `ToDrop` = 0;
END$$

CREATE PROCEDURE get_theme_general_mastering_selection_unmarked(theme_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `Mastering`
	FROM General_selection
	WHERE `Theme` = theme_id 
	AND `ToDrop` = 0;
END$$

CREATE PROCEDURE get_theme_professional_mastering_selection_unmarked(theme_id INT UNSIGNED)
BEGIN
	SELECT `ID`, `Mastering`
	FROM Professional_selection
	WHERE `Theme` = theme_id
	AND `ToDrop` = 0;
END$$

CREATE PROCEDURE send_report(redactor_name CHAR(32), commentary VARCHAR(5000))
BEGIN
	UPDATE Redactors
	SET `Comment` = commentary
	WHERE `User` = redactor_name;
END$$
