DELIMITER $$

-- Tables with no relation
-- to other smaller tables

-- table: levels

CREATE PROCEDURE unmark_all_levels()
BEGIN
	UPDATE Levels
	SET
	`ToDrop` = FALSE;
END$$

-- table: hours

CREATE PROCEDURE unmark_all_hours()
BEGIN
	UPDATE Hours
	SET
	`ToDrop` = FALSE;
END$$

-- table: discipline_codes

CREATE PROCEDURE unmark_all_discipline_codes()
BEGIN
	UPDATE Discipline_codes
	SET
	`ToDrop` = FALSE;
END$$

-- table: speciality_codes

CREATE PROCEDURE unmark_all_speciality_codes()
BEGIN
	UPDATE Speciality_codes
	SET
	`ToDrop` = FALSE;
END$$

-- table: work_types

CREATE PROCEDURE unmark_all_work_types()
BEGIN
	UPDATE Work_types
	SET
	`ToDrop` = FALSE;
END$$

-- table: source_types

CREATE PROCEDURE unmark_all_source_types()
BEGIN
	UPDATE Source_types
	SET
	`ToDrop` = FALSE;
END$$

-- table: meta types

CREATE PROCEDURE unmark_all_meta_types()
BEGIN
	UPDATE Meta_types
	SET
	`ToDrop` = FALSE;
END$$

-- Tables with relations
-- to other smaller tables

-- table: source

CREATE PROCEDURE unmark_all_sources()
BEGIN
	UPDATE Sources
	SET
	`ToDrop` = FALSE;
END$$

-- table: conformity

CREATE PROCEDURE unmark_all_conformities()
BEGIN
	UPDATE Conformity
	SET
	`ToDrop` = FALSE;
END$$

-- table: specialities

CREATE PROCEDURE unmark_all_specialities()
BEGIN
	UPDATE Specialities
	SET
	`ToDrop` = FALSE;
END$$

-- table: general_competetions

CREATE PROCEDURE unmark_all_general_competetions()
BEGIN
	UPDATE General_competetions
	SET
	`ToDrop` = FALSE;
END$$

-- table: professional_competetions

CREATE PROCEDURE unmark_all_professional_competetions()
BEGIN
	UPDATE Professional_competetions
	SET
	`ToDrop` = FALSE;
END$$

-- table: general_mastering

CREATE PROCEDURE unmark_all_general_mastering()
BEGIN
	UPDATE General_mastering
	SET
	`ToDrop` = FALSE;
END$$

-- table: professional_mastering

CREATE PROCEDURE unmark_all_professional_mastering()
BEGIN
	UPDATE Professional_mastering
	SET
	`ToDrop` = FALSE;
END$$

-- table: general_selection

CREATE PROCEDURE unmark_all_general_selection()
BEGIN
	UPDATE General_selection
	SET
	`ToDrop` = FALSE;
END$$

-- table: professional_selection

CREATE PROCEDURE unmark_all_professional_selection()
BEGIN
	UPDATE Professional_selection
	SET
	`ToDrop` = FALSE;
END$$

-- table: disciplines

CREATE PROCEDURE unmark_all_disciplines()
BEGIN
	UPDATE Disciplines
	SET
	`ToDrop` = FALSE;
END$$

-- table: theme_plan

CREATE PROCEDURE unmark_all_sections()
BEGIN
	UPDATE Theme_plan
	SET
	`ToDrop` = FALSE;
END$$

-- table: themes

CREATE PROCEDURE unmark_all_themes()
BEGIN
	UPDATE Themes
	SET
	`ToDrop` = FALSE;
END$$

-- table: works

CREATE PROCEDURE unmark_all_works()
BEGIN
	UPDATE Works
	SET
	`ToDrop` = FALSE;
END$$

-- table: tasks

CREATE PROCEDURE unmark_all_tasks()
BEGIN
	UPDATE Tasks
	SET
	`ToDrop` = FALSE;
END$$

-- table: meta data

CREATE PROCEDURE unmark_all_meta_data()
BEGIN
	UPDATE Meta_data
	SET
	`ToDrop` = FALSE;
END$$
