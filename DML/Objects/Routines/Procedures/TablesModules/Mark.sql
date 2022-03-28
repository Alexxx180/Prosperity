DELIMITER $$

-- Tables with no relation
-- to other smaller tables

-- table: levels

CREATE PROCEDURE mark_level(
	level_id INT UNSIGNED
	)
BEGIN
	UPDATE Levels
	SET `ToDrop` = TRUE
	WHERE `ID` = level_id;
END$$

-- table: hours

CREATE PROCEDURE mark_hour(
	hour_id INT UNSIGNED
	)
BEGIN
	UPDATE Hours
	SET `ToDrop` = TRUE
	WHERE `ID` = hour_id;
END$$

-- table: discipline_codes

CREATE PROCEDURE mark_discipline_code(
	code_id INT UNSIGNED
	)
BEGIN
	UPDATE Discipline_codes
	SET `ToDrop` = TRUE
	WHERE `ID` = code_id;
END$$

-- table: speciality_codes

CREATE PROCEDURE mark_speciality_code(
	code_id INT UNSIGNED
	)
BEGIN
	UPDATE Speciality_codes
	SET `ToDrop` = TRUE
	WHERE `ID` = code_id;
END$$

-- table: work_types

CREATE PROCEDURE mark_work_type(
	type_id INT UNSIGNED
	)
BEGIN
	UPDATE Work_types
	SET `ToDrop` = TRUE
	WHERE `ID` = type_id;
END$$

-- table: source_types

CREATE PROCEDURE mark_source_type(
	type_id INT UNSIGNED
	)
BEGIN
	UPDATE Source_types
	SET `ToDrop` = TRUE
	WHERE `ID` = type_id;
END$$

-- table: meta types

CREATE PROCEDURE mark_meta_type(
	type_id INT UNSIGNED
	)
BEGIN
	UPDATE Meta_types
	SET `ToDrop` = TRUE
	WHERE `ID` = type_id;
END$$

-- Tables with relations
-- to other smaller tables

-- table: source

CREATE PROCEDURE mark_source(
	source_id INT UNSIGNED
	)
BEGIN
	UPDATE Sources
	SET `ToDrop` = TRUE
	WHERE `ID` = source_id;
END$$

-- table: conformity

CREATE PROCEDURE mark_conformity(
	conformity_id INT UNSIGNED
	)
BEGIN
	UPDATE Conformity
	SET `ToDrop` = TRUE
	WHERE `ID` = conformity_id;
END$$

-- table: specialities

CREATE PROCEDURE mark_speciality(
	speciality_id INT UNSIGNED
	)
BEGIN
	UPDATE Specialities
	SET `ToDrop` = TRUE
	WHERE `ID` = speciality_id;
END$$

-- table: general_competetions

CREATE PROCEDURE mark_general_competetion(
	comp_id INT UNSIGNED
	)
BEGIN
	UPDATE General_competetions
	SET `ToDrop` = TRUE
	WHERE `ID` = comp_id;
END$$

-- table: professional_competetions

CREATE PROCEDURE mark_professional_competetion(
	comp_id INT UNSIGNED
	)
BEGIN
	UPDATE Professional_competetions
	SET `ToDrop` = TRUE
	WHERE `ID` = comp_id;
END$$

-- table: general_mastering

CREATE PROCEDURE mark_general_mastering(
	mastering_id INT UNSIGNED
	)
BEGIN
	UPDATE General_mastering
	SET `ToDrop` = TRUE
	WHERE `ID` = mastering_id;
END$$

-- table: professional_mastering

CREATE PROCEDURE mark_professional_mastering(
	mastering_id INT UNSIGNED
	)
BEGIN
	UPDATE Professional_mastering
	SET `ToDrop` = TRUE
	WHERE `ID` = mastering_id;
END$$

-- table: general_selection

CREATE PROCEDURE mark_general_selection(
	selection_id INT UNSIGNED
	)
BEGIN
	UPDATE General_selection
	SET `ToDrop` = TRUE
	WHERE `ID` = selection_id;
END$$

-- table: professional_selection

CREATE PROCEDURE mark_professional_selection(
	selection_id INT UNSIGNED
	)
BEGIN
	UPDATE Professional_selection
	SET `ToDrop` = TRUE
	WHERE `ID` = selection_id;
END$$

-- table: disciplines

CREATE PROCEDURE mark_discipline(
	discipline_id INT UNSIGNED
	)
BEGIN
	UPDATE Disciplines
	SET `ToDrop` = TRUE
	WHERE `ID` = discipline_id;
END$$

-- table: theme_plan

CREATE PROCEDURE mark_section(
	section_id INT UNSIGNED
	)
BEGIN
	UPDATE Theme_plan
	SET `ToDrop` = TRUE
	WHERE `ID` = section_id;
END$$

-- table: themes

CREATE PROCEDURE mark_theme(
	theme_id INT UNSIGNED
	)
BEGIN
	UPDATE Themes
	SET `ToDrop` = TRUE
	WHERE `ID` = theme_id;
END$$

-- table: works

CREATE PROCEDURE mark_work(
	work_id BIGINT UNSIGNED
	)
BEGIN
	UPDATE Works
	SET `ToDrop` = TRUE
	WHERE `ID` = work_id;
END$$

-- table: tasks

CREATE PROCEDURE mark_task(
	task_id BIGINT UNSIGNED
	)
BEGIN
	UPDATE Tasks
	SET `ToDrop` = TRUE
	WHERE `ID` = task_id;
END$$

-- table: meta data

CREATE PROCEDURE mark_meta_data(
	data_id INT UNSIGNED
	)
BEGIN
	UPDATE Meta_data
	SET `ToDrop` = TRUE
	WHERE `ID` = data_id;
END$$
