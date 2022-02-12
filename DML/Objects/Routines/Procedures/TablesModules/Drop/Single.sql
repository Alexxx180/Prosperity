delimiter \;

-- Tables with no relation
-- to other smaller tables

-- table: levels

CREATE PROCEDURE drop_level(level_id INT UNSIGNED)
BEGIN
	DELETE FROM levels WHERE `ID` = level_id;
END;

-- table: hours

CREATE PROCEDURE drop_hour(hour_id INT UNSIGNED)
BEGIN
	DELETE FROM hours WHERE `ID` = hour_id;
END;

-- table: discipline_codes

CREATE PROCEDURE drop_discipline_code(code_id INT UNSIGNED)
BEGIN
	DELETE FROM discipline_codes WHERE `ID` = code_id;
END;

-- table: speciality_codes

CREATE PROCEDURE drop_speciality_code(code_id INT UNSIGNED)
BEGIN
	DELETE FROM speciality_codes WHERE `ID` = code_id;
END;

-- table: work_types

CREATE PROCEDURE drop_work_type(type_id INT UNSIGNED)
BEGIN
	DELETE FROM work_types WHERE `ID` = type_id;
END;

-- table: source_types

CREATE PROCEDURE drop_source_type(type_id INT UNSIGNED)
BEGIN
	DELETE FROM source_types WHERE `ID` = type_id;
END;

-- table: meta types

CREATE PROCEDURE drop_meta_type(type_id INT UNSIGNED)
BEGIN
	DELETE FROM meta_types WHERE `ID` = type_id;
END;

-- Tables with relations
-- to other smaller tables

-- table: source

CREATE PROCEDURE drop_source(source_id INT UNSIGNED)
BEGIN
	DELETE FROM sources WHERE `ID` = source_id;
END;

-- table: conformity

CREATE PROCEDURE drop_conformity(conformity_id INT UNSIGNED)
BEGIN
	DELETE FROM conformity WHERE `ID` = conformity_id;
END;

-- table: specialities

CREATE PROCEDURE drop_speciality(speciality_id INT UNSIGNED)
BEGIN
	DELETE FROM specialities WHERE `ID` = speciality_id;
END;

-- table: general_competetions

CREATE PROCEDURE drop_general_competetion(comp_id INT UNSIGNED)
BEGIN
	DELETE FROM general_competetions WHERE `ID` = comp_id;
END;

-- table: professional_competetions

CREATE PROCEDURE drop_professional_competetion(comp_id INT UNSIGNED)
BEGIN
	DELETE FROM professional_competetions WHERE `ID` = comp_id;
END;

-- table: general_mastering

CREATE PROCEDURE drop_general_mastering(mastering_id INT UNSIGNED)
BEGIN
	DELETE FROM general_mastering WHERE `ID` = mastering_id;
END;

-- table: professional_mastering

CREATE PROCEDURE drop_professional_mastering(mastering_id INT UNSIGNED)
BEGIN
	DELETE FROM professional_mastering WHERE `ID` = mastering_id;
END;

-- table: general_selection

CREATE PROCEDURE drop_general_selection(selection_id INT UNSIGNED)
BEGIN
	DELETE FROM general_selection WHERE `ID` = selection_id;
END;

-- table: professional_selection

CREATE PROCEDURE drop_professional_selection(selection_id INT UNSIGNED)
BEGIN
	DELETE FROM professional_selection WHERE `ID` = selection_id;
END;

-- table: disciplines

CREATE PROCEDURE drop_discipline(discipline_id INT UNSIGNED)
BEGIN
	DELETE FROM disciplines WHERE `ID` = discipline_id;
END;

-- table: theme_plan

CREATE PROCEDURE drop_section(section_id INT UNSIGNED)
BEGIN
	DELETE FROM theme_plan WHERE `ID` = section_id;
END;

-- table: themes

CREATE PROCEDURE drop_theme(theme_id INT UNSIGNED)
BEGIN
	DELETE FROM themes WHERE `ID` = theme_id;
END;

-- table: works

CREATE PROCEDURE drop_work(work_id BIGINT UNSIGNED)
BEGIN
	DELETE FROM works WHERE `ID` = work_id;
END;

-- table: tasks

CREATE PROCEDURE drop_task(task_id BIGINT UNSIGNED)
BEGIN
	DELETE FROM tasks WHERE `ID` = task_id;
END;

-- table: meta data

CREATE PROCEDURE drop_meta_data(data_id INT UNSIGNED)
BEGIN
	DELETE FROM Meta_data WHERE `ID` = data_id;
END;