DELIMITER $$

-- Tables with no relation
-- to other smaller tables

-- table: levels

CREATE PROCEDURE drop_all_levels()
BEGIN
	DELETE FROM Levels;
END$$

-- table: hours

CREATE PROCEDURE drop_all_hours()
BEGIN
	DELETE FROM Hours;
END$$

-- table: discipline_codes

CREATE PROCEDURE drop_all_discipline_code()
BEGIN
	DELETE FROM Discipline_codes;
END$$

-- table: speciality_codes

CREATE PROCEDURE drop_all_speciality_code()
BEGIN
	DELETE FROM Speciality_codes;
END$$

-- table: work_types

CREATE PROCEDURE drop_all_work_types()
BEGIN
	DELETE FROM Work_types;
END$$

-- table: source_types

CREATE PROCEDURE drop_all_source_types()
BEGIN
	DELETE FROM Source_types;
END$$

-- table: meta types

CREATE PROCEDURE drop_all_meta_type()
BEGIN
	DELETE FROM Meta_types;
END$$

-- Tables with relations
-- to other smaller tables

-- table: source

CREATE PROCEDURE drop_all_sources()
BEGIN
	DELETE FROM Sources;
END$$

-- table: conformity

CREATE PROCEDURE drop_all_conformities()
BEGIN
	DELETE FROM Conformity;
END$$

-- table: specialities

CREATE PROCEDURE drop_all_specialities()
BEGIN
	DELETE FROM Specialities;
END$$

-- table: general_competetions

CREATE PROCEDURE drop_all_general_competetions()
BEGIN
	DELETE FROM General_competetions;
END$$

-- table: professional_competetions

CREATE PROCEDURE drop_all_professional_competetions()
BEGIN
	DELETE FROM Professional_competetions;
END$$

-- table: general_mastering

CREATE PROCEDURE drop_all_general_mastering()
BEGIN
	DELETE FROM General_mastering;
END$$

-- table: professional_mastering

CREATE PROCEDURE drop_all_professional_mastering()
BEGIN
	DELETE FROM Professional_mastering;
END$$

-- table: general_selection

CREATE PROCEDURE drop_all_general_selection()
BEGIN
	DELETE FROM General_selection;
END$$

-- table: professional_selection

CREATE PROCEDURE drop_all_professional_selection()
BEGIN
	DELETE FROM Professional_selection;
END$$

-- table: disciplines

CREATE PROCEDURE drop_all_disciplines()
BEGIN
	DELETE FROM Disciplines;
END$$

-- table: theme_plan

CREATE PROCEDURE drop_all_theme_plan()
BEGIN
	DELETE FROM Theme_plan;
END$$

-- table: themes

CREATE PROCEDURE drop_all_themes()
BEGIN
	DELETE FROM Themes;
END$$

-- table: works

CREATE PROCEDURE drop_all_works()
BEGIN
	DELETE FROM Works;
END$$

-- table: tasks

CREATE PROCEDURE drop_all_tasks()
BEGIN
	DELETE FROM Tasks;
END$$

-- table: meta data

CREATE PROCEDURE drop_all_meta_data()
BEGIN
	DELETE FROM Meta_data;
END$$
