delimiter \;

-- Tables with no relation
-- to other smaller tables

-- table: levels

CREATE PROCEDURE add_level(
	level_name VARCHAR(50),
	level_description VARCHAR(500)
	)
BEGIN
	INSERT INTO levels(`Name`, `Description`)
	VALUES (level_name, level_description);
END;

-- table: hours

CREATE PROCEDURE add_hour(
	discipline_id INT UNSIGNED,
	work_type_id INT UNSIGNED,
	hours_count INT UNSIGNED
	)
BEGIN
	INSERT INTO hours(`Discipline`, `WorkType`,`Count`)
	VALUES (discipline_id, work_type_id, hours_count);
END;

-- table: discipline_codes

CREATE PROCEDURE add_discipline_code(discipline_code VARCHAR(50))
BEGIN
	INSERT INTO discipline_codes(`Code`)
	VALUES (discipline_code);
END;

-- table: speciality_codes

CREATE PROCEDURE add_speciality_code(speciality_code VARCHAR(50))
BEGIN
	INSERT INTO speciality_codes(`Code`)
	VALUES (speciality_code);
END;

-- table: work_types

CREATE PROCEDURE add_work_type(type_name VARCHAR(50))
BEGIN
	INSERT INTO work_types(`Name`)
	VALUES (type_name);
END;

-- table: source_types

CREATE PROCEDURE add_source_type(type_name VARCHAR(500))
BEGIN
	INSERT INTO source_types(`Name`)
	VALUES (type_name);
END;

-- table: meta types

CREATE PROCEDURE add_meta_type(type_name VARCHAR(250))
BEGIN
	INSERT INTO meta_types(`Name`)
	VALUES (type_name);
END;

-- Tables with relations
-- to other smaller tables

-- table: source

CREATE PROCEDURE add_source(
	discipline_id INT UNSIGNED,
	type_id INT UNSIGNED,
	source_name VARCHAR(1000)
)
BEGIN
	INSERT INTO sources(
		`Discipline`,
		`Type`,
		`Name`
	)
	VALUES (
		discipline_id,
		type_id,
		source_name
	);
END;

-- table: conformity

CREATE PROCEDURE add_conformity(
	conformity_discipline INT UNSIGNED,
	conformity_speciality INT UNSIGNED
	)
BEGIN
	INSERT INTO conformity(
	`Discipline`,
	`Speciality`
	)
	VALUES (
	conformity_discipline,
	conformity_speciality
	);
END;

-- table: specialities

CREATE PROCEDURE add_speciality(
	speciality_code INT UNSIGNED,
	speciality_name VARCHAR(250)
	)
BEGIN
	INSERT INTO specialities(
	`Code`,
	`Name`
	)
	VALUES (
	speciality_code,
	speciality_name
	);
END;

-- table: general_competetions

CREATE PROCEDURE add_general_competetion(
	comp_speciality INT UNSIGNED,
	comp_no INT UNSIGNED,
	comp_name VARCHAR(250),
	comp_knowledge VARCHAR(1000),
	comp_skills VARCHAR(1000)
	)
BEGIN
	INSERT INTO general_competetions(
	`Speciality`,
	`No`,
	`Name`,
	`Knowledge`,
	`Skills`
	)
	VALUES (
	comp_speciality,
	comp_no,
	comp_name,
	comp_knowledge,
	comp_skills
	);
END;

-- table: professional_competetions

CREATE PROCEDURE add_professional_competetion(
	comp_speciality INT UNSIGNED,
	comp_no1 INT UNSIGNED,
	comp_no2 INT UNSIGNED,
	comp_name VARCHAR(250),
	comp_knowledge VARCHAR(1000),
	comp_skills VARCHAR(1000),
	comp_experience VARCHAR(1000)
	)
BEGIN
	INSERT INTO professional_competetions(
	`Speciality`,
	`No1`,
	`No2`,
	`Name`,
	`Knowledge`,
	`Skills`,
	`Experience`
	)
	VALUES (
	comp_speciality,
	comp_no1,
	comp_no2,
	comp_name,
	comp_knowledge,
	comp_skills,
	comp_experience 
	);
END;

-- table: general_mastering

CREATE PROCEDURE add_general_mastering(
	mastering_discipline INT UNSIGNED,
	general_id INT UNSIGNED
	)
BEGIN
	INSERT INTO general_mastering(
	`Discipline`,
	`Mastering`
	)
	VALUES (
	mastering_discipline,
	general_id
	);
END;

-- table: professional_mastering

CREATE PROCEDURE add_professional_mastering(
	mastering_discipline INT UNSIGNED,
	professional_id INT UNSIGNED
	)
BEGIN
	INSERT INTO professional_mastering(
	`Discipline`,
	`Mastering`
	)
	VALUES (
	mastering_discipline,
	professional_id
	);
END;

-- table: general_selection

CREATE PROCEDURE add_general_selection(
	selection_theme INT UNSIGNED,
	mastering_selection INT UNSIGNED
	)
BEGIN
	INSERT INTO general_selection(
	`Theme`,
	`Mastering`
	)
	VALUES (
	selection_theme,
	mastering_selection
	);
END;

-- table: professional_selection

CREATE PROCEDURE add_professional_selection(
	selection_theme INT UNSIGNED,
	mastering_selection INT UNSIGNED
	)
BEGIN
	INSERT INTO professional_selection(
	`Theme`,
	`Mastering`
	)
	VALUES (
	selection_theme,
	mastering_selection
	);
END;

-- table: disciplines

CREATE PROCEDURE add_discipline(
	discipline_code INT UNSIGNED,
	discipline_name VARCHAR(250)
	)
BEGIN
	INSERT INTO disciplines(
	`Code`,
	`Name`
	)
	VALUES (
	discipline_code,
	discipline_name
	);
END;

-- table: theme_plan

CREATE PROCEDURE add_section(
	section_discipline INT UNSIGNED,
	section_no INT UNSIGNED,
	section_name VARCHAR(500),
	section_hours INT UNSIGNED
	)
BEGIN
	INSERT INTO theme_plan(
	`Discipline`,
	`No`,
	`Name`,
	`Hours`
	)
	VALUES (
	section_discipline,
	section_no,
	section_name,
	section_hours
	);
END;

-- table: themes

CREATE PROCEDURE add_theme(
	theme_topic INT UNSIGNED,
	theme_mastering_level INT UNSIGNED,
	theme_no INT UNSIGNED,
	theme_name VARCHAR(500),
	theme_hours INT UNSIGNED
	)
BEGIN
	INSERT INTO themes(
	`Topic`,
	`Level`,
	`No`,
	`Name`,
	`Hours`
	)
	VALUES (
	theme_topic,
	theme_mastering_level,
	theme_no,
	theme_name,
	theme_hours
	);
END;

-- table: works

CREATE PROCEDURE add_work(
	work_theme INT UNSIGNED,
	work_type INT UNSIGNED
	)
BEGIN
	INSERT INTO works(
	`Theme`,
	`Type`
	)
	VALUES (
	work_theme,
	work_type
	);
END;

-- table: tasks

CREATE PROCEDURE add_task(
	task_work_id BIGINT UNSIGNED,
	task_name VARCHAR(500),
	task_hours SMALLINT UNSIGNED
	)
BEGIN
	INSERT INTO tasks(
	`Work`,
	`Name`,
	`Hours`
	)
	VALUES (
	task_work_id,
	task_name,
	task_hours
	);
END;

-- table: meta data

CREATE PROCEDURE add_meta_data(
	data_discipline INT UNSIGNED,
	data_type_id INT UNSIGNED,
	data_name VARCHAR(1000)
	)
BEGIN
	INSERT INTO Meta_data(
	`Discipline`,
	`Type`,
	`Name`
	)
	VALUES (
	data_discipline,
	data_type_id,
	data_name
	);
END;