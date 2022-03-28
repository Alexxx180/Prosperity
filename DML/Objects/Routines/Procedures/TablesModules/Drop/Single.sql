DELIMITER $$

-- Tables with no relation
-- to other smaller tables

-- table: levels

CREATE PROCEDURE drop_level(level_id INT UNSIGNED)
BEGIN
	DELETE FROM Levels WHERE `ID` = level_id;
END$$

-- table: hours

CREATE PROCEDURE drop_hour(hour_id INT UNSIGNED)
BEGIN
	DELETE FROM Hours WHERE `ID` = hour_id;
END$$

-- table: discipline_codes

CREATE PROCEDURE drop_discipline_code(code_id INT UNSIGNED)
BEGIN
	DELETE FROM Discipline_codes WHERE `ID` = code_id;
END$$

-- table: speciality_codes

CREATE PROCEDURE drop_speciality_code(code_id INT UNSIGNED)
BEGIN
	DELETE FROM Speciality_codes WHERE `ID` = code_id;
END$$

-- table: work_types

CREATE PROCEDURE drop_work_type(type_id INT UNSIGNED)
BEGIN
	DELETE FROM Work_types WHERE `ID` = type_id;
END$$

-- table: source_types

CREATE PROCEDURE drop_source_type(type_id INT UNSIGNED)
BEGIN
	DELETE FROM Source_types WHERE `ID` = type_id;
END$$

-- table: meta types

CREATE PROCEDURE drop_meta_type(type_id INT UNSIGNED)
BEGIN
	DELETE FROM Meta_types WHERE `ID` = type_id;
END$$

-- Tables with relations
-- to other smaller tables

-- table: source

CREATE PROCEDURE drop_source(source_id INT UNSIGNED)
BEGIN
	DELETE FROM Sources WHERE `ID` = source_id;
END$$

-- table: conformity

CREATE PROCEDURE drop_conformity(conformity_id INT UNSIGNED)
BEGIN
	DELETE FROM Conformity WHERE `ID` = conformity_id;
END$$

-- table: specialities

CREATE PROCEDURE drop_speciality(speciality_id INT UNSIGNED)
BEGIN
	DELETE FROM Specialities WHERE `ID` = speciality_id;
END$$

-- table: general_competetions

CREATE PROCEDURE drop_general_competetion(comp_id INT UNSIGNED)
BEGIN
	DELETE FROM General_competetions WHERE `ID` = comp_id;
END$$

-- table: professional_competetions

CREATE PROCEDURE drop_professional_competetion(comp_id INT UNSIGNED)
BEGIN
	DELETE FROM Professional_competetions WHERE `ID` = comp_id;
END$$

-- table: general_mastering

CREATE PROCEDURE drop_general_mastering(mastering_id INT UNSIGNED)
BEGIN
	DELETE FROM General_mastering WHERE `ID` = mastering_id;
END$$

-- table: professional_mastering

CREATE PROCEDURE drop_professional_mastering(mastering_id INT UNSIGNED)
BEGIN
	DELETE FROM Professional_mastering WHERE `ID` = mastering_id;
END$$

-- table: general_selection

CREATE PROCEDURE drop_general_selection(selection_id INT UNSIGNED)
BEGIN
	DELETE FROM General_selection WHERE `ID` = selection_id;
END$$

-- table: professional_selection

CREATE PROCEDURE drop_professional_selection(selection_id INT UNSIGNED)
BEGIN
	DELETE FROM Professional_selection WHERE `ID` = selection_id;
END$$

-- table: disciplines

CREATE PROCEDURE drop_discipline(discipline_id INT UNSIGNED)
BEGIN
	DELETE FROM Disciplines WHERE `ID` = discipline_id;
END$$

-- table: theme_plan

CREATE PROCEDURE drop_section(section_id INT UNSIGNED)
BEGIN
	DELETE FROM Theme_plan WHERE `ID` = section_id;
END$$

-- table: themes

CREATE PROCEDURE drop_theme(theme_id INT UNSIGNED)
BEGIN
	DELETE FROM Themes WHERE `ID` = theme_id;
END$$

-- table: works

CREATE PROCEDURE drop_work(work_id BIGINT UNSIGNED)
BEGIN
	DELETE FROM Works WHERE `ID` = work_id;
END$$

-- table: tasks

CREATE PROCEDURE drop_task(task_id BIGINT UNSIGNED)
BEGIN
	DELETE FROM Tasks WHERE `ID` = task_id;
END$$

-- table: meta data

CREATE PROCEDURE drop_meta_data(data_id INT UNSIGNED)
BEGIN
	DELETE FROM Meta_data WHERE `ID` = data_id;
END$$
