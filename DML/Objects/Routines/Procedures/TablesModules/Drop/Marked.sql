DELIMITER $$

-- Tables with no relation
-- to other smaller tables

-- table: levels

CREATE PROCEDURE drop_all_marked_levels()
BEGIN
	DELETE FROM Levels WHERE `ToDrop` = TRUE;
END$$

-- table: hours

CREATE PROCEDURE drop_all_marked_hours()
BEGIN
	DELETE FROM Hours WHERE `ToDrop` = TRUE;
END$$

-- table: discipline_codes

CREATE PROCEDURE drop_all_marked_discipline_codes()
BEGIN
	DELETE FROM Discipline_codes WHERE `ToDrop` = TRUE;
END$$

-- table: speciality_codes

CREATE PROCEDURE drop_all_marked_speciality_codes()
BEGIN
	DELETE FROM Speciality_codes WHERE `ToDrop` = TRUE;
END$$

-- table: work_types

CREATE PROCEDURE drop_all_marked_work_types()
BEGIN
	DELETE FROM Work_types WHERE `ToDrop` = TRUE;
END$$

-- table: source_types

CREATE PROCEDURE drop_all_marked_source_types()
BEGIN
	DELETE FROM Source_types WHERE `ToDrop` = TRUE;
END$$

-- table: meta types

CREATE PROCEDURE drop_all_marked_meta_types()
BEGIN
	DELETE FROM Meta_types WHERE `ToDrop` = TRUE;
END$$

-- Tables with relations
-- to other smaller tables

-- table: source

CREATE PROCEDURE drop_all_marked_sources()
BEGIN
	DELETE FROM Sources WHERE `ToDrop` = TRUE;
END$$

-- table: conformity

CREATE PROCEDURE drop_all_marked_conformities()
BEGIN
	DELETE FROM Conformity WHERE `ToDrop` = TRUE;
END$$

-- table: specialities

CREATE PROCEDURE drop_all_marked_specialities()
BEGIN
	DELETE FROM Specialities WHERE `ToDrop` = TRUE;
END$$

-- table: general_competetions

CREATE PROCEDURE drop_all_marked_general_competetions()
BEGIN
	DELETE FROM General_competetions WHERE `ToDrop` = TRUE;
END$$

-- table: professional_competetions

CREATE PROCEDURE drop_all_marked_professional_competetions()
BEGIN
	DELETE FROM Professional_competetions WHERE `ToDrop` = TRUE;
END$$

-- table: general_mastering

CREATE PROCEDURE drop_all_marked_general_mastering()
BEGIN
	DELETE FROM General_mastering WHERE `ToDrop` = TRUE;
END$$

-- table: professional_mastering

CREATE PROCEDURE drop_all_marked_professional_mastering()
BEGIN
	DELETE FROM Professional_mastering WHERE `ToDrop` = TRUE;
END$$

-- table: general_selection

CREATE PROCEDURE drop_all_marked_general_selection()
BEGIN
	DELETE FROM General_selection WHERE `ToDrop` = TRUE;
END$$

-- table: professional_selection

CREATE PROCEDURE drop_all_marked_professional_selection()
BEGIN
	DELETE FROM Professional_selection WHERE `ToDrop` = TRUE;
END$$

-- table: disciplines

CREATE PROCEDURE drop_all_marked_disciplines()
BEGIN
	DELETE FROM Disciplines WHERE `ToDrop` = TRUE;
END$$

-- table: theme_plan

CREATE PROCEDURE drop_all_marked_sections()
BEGIN
	DELETE FROM Theme_plan WHERE `ToDrop` = TRUE;
END$$

-- table: themes

CREATE PROCEDURE drop_all_marked_themes()
BEGIN
	DELETE FROM Themes WHERE `ToDrop` = TRUE;
END$$

-- table: works

CREATE PROCEDURE drop_all_marked_works()
BEGIN
	DELETE FROM Works WHERE `ToDrop` = TRUE;
END$$

-- table: tasks

CREATE PROCEDURE drop_all_marked_tasks()
BEGIN
	DELETE FROM Tasks WHERE `ToDrop` = TRUE;
END$$

-- table: meta data

CREATE PROCEDURE drop_all_marked_meta_data()
BEGIN
	DELETE FROM Meta_data WHERE `ToDrop` = TRUE;
END$$
