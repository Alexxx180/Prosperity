DELIMITER $$

-- Tables with no relation
-- to other smaller tables

-- table: levels

CREATE PROCEDURE set_level(
	level_id INT UNSIGNED,
	level_name VARCHAR(50), 
	level_description VARCHAR(500)
	)
BEGIN
	UPDATE Levels
	SET
	`Name` = level_name,
	`Description` = level_description
	WHERE `ID` = level_id;
END$$

-- table: hours

CREATE PROCEDURE set_hour(
		hour_id INT UNSIGNED,
		discipline_id INT UNSIGNED,
		work_type_id INT UNSIGNED,
		hours_count INT UNSIGNED
		)
BEGIN
	UPDATE Hours
	SET
	`Discipline` = discipline_id,
	`WorkType` = work_type_id,
	`Count` = hours_count
	WHERE `ID` = hour_id;
END$$

-- table: discipline_codes

CREATE PROCEDURE set_discipline_code(
		code_id INT UNSIGNED,
		discipline_code VARCHAR(50)
		)
BEGIN
	UPDATE Discipline_codes
	SET `Code` = discipline_code
	WHERE `ID` = code_id;
END$$

-- table: speciality_codes

CREATE PROCEDURE set_speciality_code(
		code_id INT UNSIGNED,
		speciality_code VARCHAR(50)
		)
BEGIN
	UPDATE Speciality_codes
	SET `Code` = speciality_code
	WHERE `ID` = code_id;
END$$

-- table: work_types

CREATE PROCEDURE set_work_type(
		type_id INT UNSIGNED,
		type_name VARCHAR(50)
		)
BEGIN
	UPDATE Work_types
	SET `Name` = type_name
	WHERE `ID` = type_id;
END$$

-- table: source_types

CREATE PROCEDURE set_source_type(
		type_id INT UNSIGNED,
		type_name VARCHAR(500)
		)
BEGIN
	UPDATE source_types
	SET `Name` = type_name
	WHERE `ID` = type_id;
END$$

-- table: meta types

CREATE PROCEDURE set_meta_type(
		type_id INT UNSIGNED,
		type_name VARCHAR(250)
		)
BEGIN
	UPDATE Meta_types
	SET `Name` = type_name
	WHERE `ID` = type_id;
END$$

-- Tables with relations
-- to other smaller tables

-- table: source

CREATE PROCEDURE set_source(
		source_id INT UNSIGNED,
		discipline_id INT UNSIGNED,
		type_id INT UNSIGNED,
		source_name VARCHAR(1000)
		)
BEGIN
	UPDATE Sources
	SET 
	`Discipline` = discipline_id,
	`Type` = type_id,
	`Name` = source_name
	WHERE `ID` = source_id;
END$$

-- table: conformity

CREATE PROCEDURE set_conformity(
	conformity_id INT UNSIGNED,
	conformity_discipline INT UNSIGNED,
	conformity_speciality INT UNSIGNED
	)
BEGIN
	UPDATE Conformity
	SET
	`Discipline` = conformity_discipline,
	`Speciality` = conformity_speciality
	WHERE `ID` = conformity_id;
END$$

-- table: specialities

CREATE PROCEDURE set_speciality(
	speciality_id INT UNSIGNED,
	speciality_code INT UNSIGNED,
	speciality_name VARCHAR(250)
	)
BEGIN
	UPDATE Specialities
	SET
	`Code` = speciality_code,
	`Name` = speciality_name
	WHERE `ID` = speciality_id;
END$$

-- table: general_competetions

CREATE PROCEDURE set_general_competetion(
	comp_id INT UNSIGNED,
	comp_speciality INT UNSIGNED,
	comp_no INT UNSIGNED,
	comp_name VARCHAR(250),
	comp_knowledge VARCHAR(1000),
	comp_skills VARCHAR(1000)
	)
BEGIN
	UPDATE General_competetions
	SET
	`Speciality` = comp_speciality,
	`No` = comp_no,
	`Name` = comp_name,
	`Knowledge` = comp_knowledge,
	`Skills` = comp_skills
	WHERE `ID` = comp_id;
END$$

-- table: professional_competetions

CREATE PROCEDURE set_professional_competetion(
	comp_id INT UNSIGNED,
	comp_speciality INT UNSIGNED,
	comp_no1 INT UNSIGNED,
	comp_no2 INT UNSIGNED,
	comp_name VARCHAR(250),
	comp_knowledge VARCHAR(1000),
	comp_skills VARCHAR(1000),
	comp_experience VARCHAR(1000)
	)
BEGIN
	UPDATE Professional_competetions
	SET
	`Speciality` = comp_speciality,
	`No1` = comp_no1,
	`No2` = comp_no2,
	`Name` = comp_name,
	`Knowledge` = comp_knowledge,
	`Skills` = comp_skills,
	`Experience` = comp_experience
	WHERE `ID` = comp_id;
END$$

-- table: general_mastering

CREATE PROCEDURE set_general_mastering(
	mastering_id INT UNSIGNED,
	mastering_discipline INT UNSIGNED,
	general_id INT UNSIGNED
	)
BEGIN
	UPDATE General_mastering
	SET
	`Discipline` = mastering_discipline,
	`Mastering` = general_id
	WHERE `ID` = mastering_id;
END$$

-- table: professional_mastering

CREATE PROCEDURE set_professional_mastering(
	mastering_id INT UNSIGNED,
	mastering_discipline INT UNSIGNED,
	professional_id INT UNSIGNED
	)
BEGIN
	UPDATE Professional_mastering
	SET
	`Discipline` = mastering_discipline,
	`Mastering` = professional_id
	WHERE `ID` = mastering_id;
END$$

-- table: general_selection

CREATE PROCEDURE set_general_selection(
	selection_id INT UNSIGNED,
	selection_theme INT UNSIGNED,
	mastering_selection INT UNSIGNED
	)
BEGIN
	UPDATE General_selection
	SET
	`Theme` = selection_theme,
	`Mastering` = mastering_selection
	WHERE `ID` = selection_id;
END$$

-- table: professional_selection

CREATE PROCEDURE set_professional_selection(
	selection_id INT UNSIGNED,
	selection_theme INT UNSIGNED,
	mastering_selection INT UNSIGNED
	)
BEGIN
	UPDATE Professional_selection
	SET
	`Theme` = selection_theme,
	`Mastering` = mastering_selection
	WHERE `ID` = selection_id;
END$$

-- table: disciplines

CREATE PROCEDURE set_discipline(
	discipline_id INT UNSIGNED,
	discipline_code INT UNSIGNED,
	discipline_name VARCHAR(250)
	)
BEGIN
	UPDATE Disciplines
	SET
	`Code` = discipline_code,
	`Name` = discipline_name
	WHERE `ID` = discipline_id;
END$$

-- table: theme_plan

CREATE PROCEDURE set_section(
	section_id INT UNSIGNED,
	section_discipline INT UNSIGNED,
	section_no INT UNSIGNED,
	section_name VARCHAR(500),
	section_hours INT UNSIGNED
	)
BEGIN
	UPDATE Theme_plan
	SET
	`Discipline` = section_discipline,
	`No` = section_no,
	`Name` = section_name,
	`Hours` = section_hours
	WHERE `ID` = section_id;
END$$

-- table: themes

CREATE PROCEDURE set_theme(
	theme_id INT UNSIGNED,
	theme_topic INT UNSIGNED,
	theme_mastering_level INT UNSIGNED,
	theme_no INT UNSIGNED,
	theme_name VARCHAR(500),
	theme_hours INT UNSIGNED
	)
BEGIN
	UPDATE Themes
	SET
	`Topic` = theme_topic,
	`Level` = theme_mastering_level,
	`No` = theme_no,
	`Name` = theme_name,
	`Hours` = theme_hours
	WHERE `ID` = theme_id;
END$$

-- table: works

CREATE PROCEDURE set_work(
	work_id BIGINT UNSIGNED,
	work_theme INT UNSIGNED,
	work_type INT UNSIGNED
	)
BEGIN
	UPDATE Works
	SET
	`Theme` = work_theme,
	`Type` = work_type
	WHERE `ID` = work_id;
END$$

-- table: tasks

CREATE PROCEDURE set_task(
	task_id BIGINT UNSIGNED,
	task_work_id BIGINT UNSIGNED,
	task_name VARCHAR(500),
	task_hours SMALLINT UNSIGNED
	)
BEGIN
	UPDATE Tasks
	SET
	`Work` = task_work_id,
	`Name` = task_name,
	`Hours` = task_hours
	WHERE `ID` = task_id;
END$$

-- table: meta data

CREATE PROCEDURE set_meta_data(
	data_id INT UNSIGNED,
	data_discipline INT UNSIGNED,
	data_type_id INT UNSIGNED,
	data_name VARCHAR(1000)
	)
BEGIN
	UPDATE Meta_data
	SET
	`Discipline` = data_discipline,
	`Type` = data_type_id,
	`Name` = data_name
	WHERE `ID` = data_id;
END$$
