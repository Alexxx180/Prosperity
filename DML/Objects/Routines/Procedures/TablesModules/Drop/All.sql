delimiter \;

-- Tables with no relation
-- to other smaller tables

-- table: levels

CREATE PROCEDURE drop_all_levels()
BEGIN
	DELETE FROM levels;
END;

-- table: hours

CREATE PROCEDURE drop_all_hours()
BEGIN
	DELETE FROM hours;
END;

-- table: discipline_codes

CREATE PROCEDURE drop_all_discipline_code()
BEGIN
	DELETE FROM discipline_codes;
END;

-- table: speciality_codes

CREATE PROCEDURE drop_all_speciality_code()
BEGIN
	DELETE FROM speciality_codes;
END;

-- table: work_types

CREATE PROCEDURE drop_all_work_types()
BEGIN
	DELETE FROM work_types;
END;

-- table: source_types

CREATE PROCEDURE drop_all_source_types()
BEGIN
	DELETE FROM source_types;
END;

-- table: meta types

CREATE PROCEDURE drop_all_meta_type()
BEGIN
	DELETE FROM meta_types;
END;

-- Tables with relations
-- to other smaller tables

-- table: source

CREATE PROCEDURE drop_all_sources()
BEGIN
	DELETE FROM sources;
END;

-- table: conformity

CREATE PROCEDURE drop_all_conformities()
BEGIN
	DELETE FROM conformity;
END;

-- table: specialities

CREATE PROCEDURE drop_all_specialities()
BEGIN
	DELETE FROM specialities;
END;

-- table: general_competetions

CREATE PROCEDURE drop_all_general_competetions()
BEGIN
	DELETE FROM general_competetions;
END;

-- table: professional_competetions

CREATE PROCEDURE drop_all_professional_competetions()
BEGIN
	DELETE FROM professional_competetions;
END;

-- table: general_mastering

CREATE PROCEDURE drop_all_general_mastering()
BEGIN
	DELETE FROM general_mastering;
END;

-- table: professional_mastering

CREATE PROCEDURE drop_all_professional_mastering()
BEGIN
	DELETE FROM professional_mastering;
END;

-- table: general_selection

CREATE PROCEDURE drop_all_general_selection()
BEGIN
	DELETE FROM general_selection;
END;

-- table: professional_selection

CREATE PROCEDURE drop_all_professional_selection()
BEGIN
	DELETE FROM professional_selection;
END;

-- table: disciplines

CREATE PROCEDURE drop_all_disciplines()
BEGIN
	DELETE FROM disciplines;
END;

-- table: theme_plan

CREATE PROCEDURE drop_all_theme_plan()
BEGIN
	DELETE FROM theme_plan;
END;

-- table: themes

CREATE PROCEDURE drop_all_themes()
BEGIN
	DELETE FROM themes;
END;

-- table: works

CREATE PROCEDURE drop_all_works()
BEGIN
	DELETE FROM works;
END;

-- table: tasks

CREATE PROCEDURE drop_all_tasks()
BEGIN
	DELETE FROM tasks;
END;

-- table: meta data

CREATE PROCEDURE drop_all_meta_data()
BEGIN
	DELETE FROM Meta_data;
END;