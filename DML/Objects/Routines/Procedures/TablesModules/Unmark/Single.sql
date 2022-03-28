DELIMITER $$

-- Tables with no relation
-- to other smaller tables

-- table: levels

CREATE PROCEDURE unmark_level(
	level_id INT UNSIGNED
	)
BEGIN
	UPDATE Levels
	SET `ToDrop` = FALSE
	WHERE `ID` = level_id;
END$$

-- table: hours

CREATE PROCEDURE unmark_hour(
	hour_id INT UNSIGNED
	)
BEGIN
	UPDATE Hours
	SET `ToDrop` = FALSE
	WHERE `ID` = hour_id;
END$$

-- table: discipline_codes

CREATE PROCEDURE unmark_discipline_code(
	code_id INT UNSIGNED
	)
BEGIN
	UPDATE Discipline_codes
	SET `ToDrop` = FALSE
	WHERE `ID` = code_id;
END$$

-- table: speciality_codes

CREATE PROCEDURE unmark_speciality_code(
	code_id INT UNSIGNED
	)
BEGIN
	UPDATE Speciality_codes
	SET `ToDrop` = FALSE
	WHERE `ID` = code_id;
END$$

-- table: work_types

CREATE PROCEDURE unmark_work_type(
	type_id INT UNSIGNED
	)
BEGIN
	UPDATE Work_types
	SET `ToDrop` = FALSE
	WHERE `ID` = type_id;
END$$

-- table: source_types

CREATE PROCEDURE unmark_source_type(
	type_id INT UNSIGNED
	)
BEGIN
	UPDATE Source_types
	SET `ToDrop` = FALSE
	WHERE `ID` = type_id;
END$$

-- table: meta types

CREATE PROCEDURE unmark_meta_type(
	type_id INT UNSIGNED
	)
BEGIN
	UPDATE Meta_types
	SET `ToDrop` = FALSE
	WHERE `ID` = type_id;
END$$

-- Tables with relations
-- to other smaller tables

-- table: source

CREATE PROCEDURE unmark_source(
	source_id INT UNSIGNED
	)
BEGIN
	UPDATE Sources
	SET `ToDrop` = FALSE
	WHERE `ID` = source_id;
END$$

-- table: conformity

CREATE PROCEDURE unmark_conformity(
	conformity_id INT UNSIGNED
	)
BEGIN
	UPDATE Conformity
	SET `ToDrop` = FALSE
	WHERE `ID` = conformity_id;
END$$

-- table: specialities

CREATE PROCEDURE unmark_speciality(
	speciality_id INT UNSIGNED
	)
BEGIN
	UPDATE Specialities
	SET `ToDrop` = FALSE
	WHERE `ID` = speciality_id;
END$$

-- table: general_competetions

CREATE PROCEDURE unmark_general_competetion(
	comp_id INT UNSIGNED
	)
BEGIN
	UPDATE General_competetions
	SET `ToDrop` = FALSE
	WHERE `ID` = comp_id;
END$$

-- table: professional_competetions

CREATE PROCEDURE unmark_professional_competetion(
	comp_id INT UNSIGNED
	)
BEGIN
	UPDATE Professional_competetions
	SET `ToDrop` = FALSE
	WHERE `ID` = comp_id;
END$$

-- table: general_mastering

CREATE PROCEDURE unmark_general_mastering(
	mastering_id INT UNSIGNED
	)
BEGIN
	UPDATE General_mastering
	SET `ToDrop` = FALSE
	WHERE `ID` = mastering_id;
END$$

-- table: professional_mastering

CREATE PROCEDURE unmark_professional_mastering(
	mastering_id INT UNSIGNED
	)
BEGIN
	UPDATE Professional_mastering
	SET `ToDrop` = FALSE
	WHERE `ID` = mastering_id;
END$$

-- table: general_selection

CREATE PROCEDURE unmark_general_selection(
	selection_id INT UNSIGNED
	)
BEGIN
	UPDATE General_selection
	SET `ToDrop` = FALSE
	WHERE `ID` = selection_id;
END$$

-- table: professional_selection

CREATE PROCEDURE unmark_professional_selection(
	selection_id INT UNSIGNED
	)
BEGIN
	UPDATE Professional_selection
	SET `ToDrop` = FALSE
	WHERE `ID` = selection_id;
END$$

-- table: disciplines

CREATE PROCEDURE unmark_discipline(
	discipline_id INT UNSIGNED
	)
BEGIN
	UPDATE Disciplines
	SET `ToDrop` = FALSE
	WHERE `ID` = discipline_id;
END$$

-- table: theme_plan

CREATE PROCEDURE unmark_section(
	section_id INT UNSIGNED
	)
BEGIN
	UPDATE Theme_plan
	SET `ToDrop` = FALSE
	WHERE `ID` = section_id;
END$$

-- table: themes

CREATE PROCEDURE unmark_theme(
	theme_id INT UNSIGNED
	)
BEGIN
	UPDATE Themes
	SET `ToDrop` = FALSE
	WHERE `ID` = theme_id;
END$$

-- table: works

CREATE PROCEDURE unmark_work(
	work_id BIGINT UNSIGNED
	)
BEGIN
	UPDATE Works
	SET `ToDrop` = FALSE
	WHERE `ID` = work_id;
END$$

-- table: tasks

CREATE PROCEDURE unmark_task(
	task_id BIGINT UNSIGNED
	)
BEGIN
	UPDATE Tasks
	SET `ToDrop` = FALSE
	WHERE `ID` = task_id;
END$$

-- table: meta data

CREATE PROCEDURE unmark_meta_data(
	data_id INT UNSIGNED
	)
BEGIN
	UPDATE Meta_data
	SET `ToDrop` = FALSE
	WHERE `ID` = data_id;
END$$
