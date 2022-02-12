delimiter \;

-- Tables with no relation
-- to other smaller tables

-- table: levels

CREATE PROCEDURE get_level(level_id INT UNSIGNED)
BEGIN
	SELECT * FROM levels	WHERE `ID` = level_id;
END;

-- table: hours

CREATE PROCEDURE get_hour(hour_id INT UNSIGNED)
BEGIN
	SELECT * FROM hours WHERE `ID` = hour_id;
END;

-- table: discipline_codes

CREATE PROCEDURE get_discipline_code(code_id INT UNSIGNED)
BEGIN
	SELECT * FROM discipline_codes WHERE `ID` = code_id;
END;

-- table: speciality_codes

CREATE PROCEDURE get_speciality_code(code_id INT UNSIGNED)
BEGIN
	SELECT * FROM speciality_codes WHERE `ID` = code_id;
END;

-- table: work_types

CREATE PROCEDURE get_work_type(type_id INT UNSIGNED)
BEGIN
	SELECT * FROM work_types WHERE `ID` = type_id;
END;

-- table: source_types

CREATE PROCEDURE get_source_type(type_id INT UNSIGNED)
BEGIN
	SELECT * FROM source_types WHERE `ID` = type_id;
END;

-- table: meta types

CREATE PROCEDURE get_meta_type(type_id INT UNSIGNED)
BEGIN
	SELECT * FROM meta_types WHERE `ID` = type_id;
END;

-- Tables with relations
-- to other smaller tables

-- table: source

CREATE PROCEDURE get_source(source_id INT UNSIGNED)
BEGIN
	SELECT * FROM sources WHERE `ID` = source_id;
END;

-- table: conformity

CREATE PROCEDURE get_conformity(conformity_id INT UNSIGNED)
BEGIN
	SELECT * FROM conformity WHERE `ID` = id;
END;

-- table: specialities

CREATE PROCEDURE get_speciality(speciality_id INT UNSIGNED)
BEGIN
	SELECT * FROM specialities WHERE `ID` = speciality_id;
END;

-- table: general_competetions

CREATE PROCEDURE get_general_competetion(id INT UNSIGNED)
BEGIN
	SELECT * FROM general_competetions WHERE `ID` = id;
END;

-- table: professional_competetions

CREATE PROCEDURE get_professional_competetion(comp_id INT UNSIGNED)
BEGIN
	SELECT * FROM professional_competetions WHERE `ID` = comp_id;
END;

-- table: general_mastering

CREATE PROCEDURE get_general_mastering(mastering_id INT UNSIGNED)
BEGIN
	SELECT * FROM general_mastering WHERE `ID` = mastering_id;
END;

-- table: professional_mastering

CREATE PROCEDURE get_professional_mastering(mastering_id INT UNSIGNED)
BEGIN
	SELECT * FROM professional_mastering WHERE `ID` = mastering_id;
END;

-- table: general_selection

CREATE PROCEDURE get_general_selection(selection_id INT UNSIGNED)
BEGIN
	SELECT * FROM general_selection WHERE `ID` = selection_id;
END;

-- table: professional_selection

CREATE PROCEDURE get_professional_selection(selection_id INT UNSIGNED)
BEGIN
	SELECT * FROM professional_selection WHERE `ID` = selection_id;
END;

-- table: disciplines

CREATE PROCEDURE get_discipline(discipline_id INT UNSIGNED)
BEGIN
	SELECT * FROM disciplines WHERE `ID` = discipline_id;
END;

-- table: theme_plan

CREATE PROCEDURE get_section(section_id INT UNSIGNED)
BEGIN
	SELECT * FROM theme_plan WHERE `ID` = section_id;
END;

-- table: themes

CREATE PROCEDURE get_theme(theme_id INT UNSIGNED)
BEGIN
	SELECT * FROM themes WHERE `ID` = theme_id;
END;

-- table: works

CREATE PROCEDURE get_work(work_id INT UNSIGNED)
BEGIN
	SELECT * FROM works WHERE `ID` = work_id;
END;

-- table: tasks

CREATE PROCEDURE get_task(task_id BIGINT UNSIGNED)
BEGIN
	SELECT * FROM tasks WHERE `ID` = task_id;
END;

-- table: meta data

CREATE PROCEDURE get_meta_data(data_id INT UNSIGNED)
BEGIN
	SELECT * FROM Meta_data WHERE `ID` = data_id;
END;