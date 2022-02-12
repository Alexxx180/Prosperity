delimiter \;

-- Tables with no relation
-- to other smaller tables

-- table: levels

CREATE PROCEDURE drop_all_marked_levels()
BEGIN
	DELETE FROM levels WHERE `ToDrop` = TRUE;
END;

-- table: hours

CREATE PROCEDURE drop_all_marked_hours()
BEGIN
	DELETE FROM hours WHERE `ToDrop` = TRUE;
END;

-- table: discipline_codes

CREATE PROCEDURE drop_all_marked_discipline_codes()
BEGIN
	DELETE FROM discipline_codes WHERE `ToDrop` = TRUE;
END;

-- table: speciality_codes

CREATE PROCEDURE drop_all_marked_speciality_codes()
BEGIN
	DELETE FROM speciality_codes WHERE `ToDrop` = TRUE;
END;

-- table: work_types

CREATE PROCEDURE drop_all_marked_work_types()
BEGIN
	DELETE FROM work_types WHERE `ToDrop` = TRUE;
END;

-- table: source_types

CREATE PROCEDURE drop_all_marked_source_types()
BEGIN
	DELETE FROM source_types WHERE `ToDrop` = TRUE;
END;

-- table: meta types

CREATE PROCEDURE add_meta_type(type_name VARCHAR(250))
BEGIN
	INSERT INTO meta_types(`Name`)
	VALUES (type_name);
END;

-- table: meta types

CREATE PROCEDURE drop_all_marked_meta_types()
BEGIN
	DELETE FROM meta_types WHERE `ToDrop` = TRUE;
END;

-- Tables with relations
-- to other smaller tables

-- table: source

CREATE PROCEDURE drop_all_marked_sources()
BEGIN
	DELETE FROM sources WHERE `ToDrop` = TRUE;
END;

-- table: conformity

CREATE PROCEDURE drop_all_marked_conformities()
BEGIN
	DELETE FROM conformity WHERE `ToDrop` = TRUE;
END;

-- table: specialities

CREATE PROCEDURE drop_all_marked_specialities()
BEGIN
	DELETE FROM specialities WHERE `ToDrop` = TRUE;
END;

-- table: general_competetions

CREATE PROCEDURE drop_all_marked_general_competetions()
BEGIN
	DELETE FROM general_competetions WHERE `ToDrop` = TRUE;
END;

-- table: professional_competetions

CREATE PROCEDURE drop_all_marked_professional_competetions()
BEGIN
	DELETE FROM professional_competetions WHERE `ToDrop` = TRUE;
END;

-- table: general_mastering

CREATE PROCEDURE drop_all_marked_general_mastering()
BEGIN
	DELETE FROM general_mastering WHERE `ToDrop` = TRUE;
END;

-- table: professional_mastering

CREATE PROCEDURE drop_all_marked_professional_mastering()
BEGIN
	DELETE FROM professional_mastering WHERE `ToDrop` = TRUE;
END;

-- table: general_selection

CREATE PROCEDURE drop_all_marked_general_selection()
BEGIN
	DELETE FROM general_selection WHERE `ToDrop` = TRUE;
END;

-- table: professional_selection

CREATE PROCEDURE drop_all_marked_professional_selection()
BEGIN
	DELETE FROM professional_selection WHERE `ToDrop` = TRUE;
END;

-- table: disciplines

CREATE PROCEDURE drop_all_marked_disciplines()
BEGIN
	DELETE FROM disciplines WHERE `ToDrop` = TRUE;
END;

-- table: theme_plan

CREATE PROCEDURE drop_all_marked_sections()
BEGIN
	DELETE FROM theme_plan WHERE `ToDrop` = TRUE;
END;

-- table: themes

CREATE PROCEDURE drop_all_marked_themes()
BEGIN
	DELETE FROM themes WHERE `ToDrop` = TRUE;
END;

-- table: works

CREATE PROCEDURE drop_all_marked_works()
BEGIN
	DELETE FROM works WHERE `ToDrop` = TRUE;
END;

-- table: tasks

CREATE PROCEDURE drop_all_marked_tasks()
BEGIN
	DELETE FROM tasks WHERE `ToDrop` = TRUE;
END;

-- table: meta data

CREATE PROCEDURE drop_all_marked_meta_data()
BEGIN
	DELETE FROM meta_data WHERE `ToDrop` = TRUE;
END;