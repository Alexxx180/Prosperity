delimiter \;

-- Tables with no relation
-- to other smaller tables

-- table: levels

CREATE PROCEDURE add_level(
	name VARCHAR(50),
	description VARCHAR(500)
	)
BEGIN
	INSERT INTO levels(`Name`, `Description`)
	VALUES (name, description);
END;

CREATE PROCEDURE get_level(id INT UNSIGNED)
BEGIN
	SELECT * FROM levels	WHERE `ID` = id;
END;

CREATE PROCEDURE set_level(
	id INT UNSIGNED,
	name VARCHAR(50), 
	description VARCHAR(500)
	)
BEGIN
	UPDATE levels
	SET
	`Name` = name,
	`Description` = description
	WHERE `ID` = id;
END;

CREATE PROCEDURE drop_level(id INT UNSIGNED)
BEGIN
	DELETE FROM levels WHERE `ID` = id;
END;

CREATE PROCEDURE drop_all_levels()
BEGIN
	DELETE FROM levels;
END;


-- table: hours

delimiter \;

CREATE PROCEDURE add_hour(
	discipline_id INT UNSIGNED,
	work_type_id INT UNSIGNED,
	hours_count INT UNSIGNED
	)
BEGIN
	INSERT INTO hours(`Discipline`, `WorkType`,`Count`)
	VALUES (discipline_id, work_type_id, hours_count);
END;

CREATE PROCEDURE get_hour(id INT UNSIGNED)
BEGIN
	SELECT * FROM hours WHERE `ID` = id;
END;



CREATE PROCEDURE set_hour(
		id INT UNSIGNED,
		discipline_id INT UNSIGNED,
		work_type_id INT UNSIGNED,
		hours_count INT UNSIGNED
		)
BEGIN
	UPDATE hours
	SET
	`Discipline` = discipline_id,
	`WorkType` = work_type_id,
	`Count` = hours_count
	WHERE `ID` = id;
END;

CREATE PROCEDURE drop_hour(id INT UNSIGNED)
BEGIN
	DELETE FROM hours WHERE `ID` = id;
END;

CREATE PROCEDURE drop_all_hours()
BEGIN
	DELETE FROM hours;
END;


-- table: discipline_codes

CREATE PROCEDURE add_discipline_code(code VARCHAR(50))
BEGIN
	INSERT INTO discipline_codes(`Code`)
	VALUES (code);
END;

CREATE PROCEDURE get_discipline_code(id INT UNSIGNED)
BEGIN
	SELECT * FROM discipline_codes WHERE `ID` = id;
END;

CREATE PROCEDURE set_discipline_code(
		id INT UNSIGNED,
		code VARCHAR(50)
		)
BEGIN
	UPDATE discipline_codes
	SET `Code` = code
	WHERE `ID` = id;
END;

CREATE PROCEDURE drop_discipline_code(id INT UNSIGNED)
BEGIN
	DELETE FROM discipline_codes WHERE `ID` = id;
END;

CREATE PROCEDURE drop_all_discipline_code()
BEGIN
	DELETE FROM discipline_codes;
END;


-- table: speciality_codes



CREATE PROCEDURE add_speciality_code(name VARCHAR(50))
BEGIN
	INSERT INTO speciality_codes(`Code`)
	VALUES (name);
END;

CREATE PROCEDURE get_speciality_code(id INT UNSIGNED)
BEGIN
	SELECT * FROM speciality_codes WHERE `ID` = id;
END;



CREATE PROCEDURE set_speciality_code(
		id INT UNSIGNED,
		name VARCHAR(50)
		)
BEGIN
	UPDATE speciality_codes
	SET `Code` = name
	WHERE `ID` = id;
END;

CREATE PROCEDURE drop_speciality_code(id INT UNSIGNED)
BEGIN
	DELETE FROM speciality_codes WHERE `ID` = id;
END;

CREATE PROCEDURE drop_all_speciality_code()
BEGIN
	DELETE FROM speciality_codes;
END;


-- table: work_types



CREATE PROCEDURE add_work_type_ignore_increment(type_id INT UNSIGNED, name VARCHAR(50))
BEGIN
	INSERT INTO work_types(`ID`, `Name`)
	VALUES (type_id, name);
END;

CREATE PROCEDURE add_work_type(name VARCHAR(50))
BEGIN
	INSERT INTO work_types(`Name`)
	VALUES (name);
END;

CREATE PROCEDURE get_work_type(id INT UNSIGNED)
BEGIN
	SELECT * FROM work_types WHERE `ID` = id;
END;

CREATE PROCEDURE set_work_type(
		id INT UNSIGNED,
		name VARCHAR(50)
		)
BEGIN
	UPDATE work_types
	SET `Name` = name
	WHERE `ID` = id;
END;

CREATE PROCEDURE drop_work_type(id INT UNSIGNED)
BEGIN
	DELETE FROM work_types WHERE `ID` = id;
END;

CREATE PROCEDURE drop_all_work_types()
BEGIN
	DELETE FROM work_types;
END;


-- table: source_types

CREATE PROCEDURE add_source_type(name VARCHAR(500))
BEGIN
	INSERT INTO source_types(`Name`)
	VALUES (name);
END;

CREATE PROCEDURE get_source_type(id INT UNSIGNED)
BEGIN
	SELECT * FROM source_types WHERE `ID` = id;
END;

CREATE PROCEDURE set_source_type(
		id INT UNSIGNED,
		name VARCHAR(500)
		)
BEGIN
	UPDATE source_types
	SET `Name` = name
	WHERE `ID` = id;
END;

CREATE PROCEDURE drop_source_type(id INT UNSIGNED)
BEGIN
	DELETE FROM source_types WHERE `ID` = id;
END;

CREATE PROCEDURE drop_all_source_types()
BEGIN
	DELETE FROM source_types;
END;


-- table: meta types

delimiter \;

CREATE PROCEDURE add_meta_type(name VARCHAR(250))
BEGIN
	INSERT INTO meta_types(`Name`)
	VALUES (name);
END;

CREATE PROCEDURE get_meta_type(id INT UNSIGNED)
BEGIN
	SELECT * FROM meta_types WHERE `ID` = id;
END;

CREATE PROCEDURE set_meta_type(
		id INT UNSIGNED,
		name VARCHAR(250)
		)
BEGIN
	UPDATE meta_types
	SET `Name` = name
	WHERE `ID` = id;
END;

CREATE PROCEDURE drop_meta_type(id INT UNSIGNED)
BEGIN
	DELETE FROM meta_types WHERE `ID` = id;
END;

CREATE PROCEDURE drop_all_meta_type()
BEGIN
	DELETE FROM meta_types;
END;


-- Tables with relations
-- to other smaller tables

-- table: source

delimiter \;

CREATE PROCEDURE add_source(
	discipline INT UNSIGNED,
	type_id INT UNSIGNED,
	name VARCHAR(1000)
)
BEGIN
	INSERT INTO sources(
		`Discipline`,
		`Type`,
		`Name`
	)
	VALUES (
		discipline,
		type_id,
		name
	);
END;

CREATE PROCEDURE get_source(id INT UNSIGNED)
BEGIN
	SELECT * FROM sources WHERE `ID` = id;
END;

delimiter \;

CREATE PROCEDURE set_source(
		id INT UNSIGNED,
		discipline INT UNSIGNED,
		type_id INT UNSIGNED,
		name VARCHAR(1000)
		)
BEGIN
	UPDATE sources
	SET 
	`Discipline` = discipline,
	`Type` = type_id,
	`Name` = name
	WHERE `ID` = id;
END;

CREATE PROCEDURE drop_source(id INT UNSIGNED)
BEGIN
	DELETE FROM sources WHERE `ID` = id;
END;

CREATE PROCEDURE drop_all_sources()
BEGIN
	DELETE FROM sources;
END;


-- table: conformity

CREATE PROCEDURE add_conformity(
	discipline INT UNSIGNED,
	speciality INT UNSIGNED
	)
BEGIN
	INSERT INTO conformity(
	`Discipline`,
	`Speciality`
	)
	VALUES (
	discipline,
	speciality
	);
END;

CREATE PROCEDURE get_conformity(id INT UNSIGNED)
BEGIN
	SELECT * FROM conformity WHERE `ID` = id;
END;

CREATE PROCEDURE set_conformity(
	id INT UNSIGNED,
	discipline INT UNSIGNED,
	speciality INT UNSIGNED
	)
BEGIN
	UPDATE conformity
	SET
	`Discipline` = discipline,
	`Speciality` = speciality
	WHERE `ID` = id;
END;

CREATE PROCEDURE drop_conformity(id INT UNSIGNED)
BEGIN
	DELETE FROM conformity WHERE `ID` = id;
END;

CREATE PROCEDURE drop_all_conformities()
BEGIN
	DELETE FROM conformity;
END;


-- table: specialities



CREATE PROCEDURE add_speciality(
	code INT UNSIGNED,
	name VARCHAR(250)
	)
BEGIN
	INSERT INTO specialities(
	`Code`,
	`Name`
	)
	VALUES (
	code,
	name
	);
END;

CREATE PROCEDURE get_speciality(id INT UNSIGNED)
BEGIN
	SELECT * FROM specialities WHERE `ID` = id;
END;



CREATE PROCEDURE set_speciality(
	id INT UNSIGNED,
	code INT UNSIGNED,
	name VARCHAR(250)
	)
BEGIN
	UPDATE specialities
	SET
	`Code` = code,
	`Name` = name
	WHERE `ID` = id;
END;

CREATE PROCEDURE drop_speciality(id INT UNSIGNED)
BEGIN
	DELETE FROM specialities WHERE `ID` = id;
END;

CREATE PROCEDURE drop_all_specialities()
BEGIN
	DELETE FROM specialities;
END;


-- table: general_competetions



CREATE PROCEDURE add_general_competetion(
	speciality INT UNSIGNED,
	comp_no INT UNSIGNED,
	name VARCHAR(250),
	knowledge VARCHAR(1000),
	skills VARCHAR(1000)
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
	speciality,
	comp_no,
	name,
	knowledge,
	skills
	);
END;

CREATE PROCEDURE get_general_competetion(id INT UNSIGNED)
BEGIN
	SELECT * FROM general_competetions WHERE `ID` = id;
END;



CREATE PROCEDURE set_general_competetion(
	id INT UNSIGNED,
	speciality INT UNSIGNED,
	comp_no INT UNSIGNED,
	name VARCHAR(250),
	knowledge VARCHAR(1000),
	skills VARCHAR(1000)
	)
BEGIN
	UPDATE general_competetions
	SET
	`Speciality` = speciality,
	`No` = comp_no,
	`Name` = name,
	`Knowledge` = knowledge,
	`Skills` = skills
	WHERE `ID` = id;
END;

CREATE PROCEDURE drop_general_competetion(id INT UNSIGNED)
BEGIN
	DELETE FROM general_competetions WHERE `ID` = id;
END;

CREATE PROCEDURE drop_all_general_competetions()
BEGIN
	DELETE FROM general_competetions;
END;


-- table: professional_competetions



CREATE PROCEDURE add_professional_competetion(
	speciality INT UNSIGNED,
	comp_no1 INT UNSIGNED,
	comp_no2 INT UNSIGNED,
	name VARCHAR(250),
	knowledge VARCHAR(1000),
	skills VARCHAR(1000),
	experience VARCHAR(1000)
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
	speciality,
	comp_no1,
	comp_no2,
	name,
	knowledge,
	skills,
	experience 
	);
END;

CREATE PROCEDURE get_professional_competetion(id INT UNSIGNED)
BEGIN
	SELECT * FROM professional_competetions WHERE `ID` = id;
END;



CREATE PROCEDURE set_professional_competetion(
	id INT UNSIGNED,
	speciality INT UNSIGNED,
	comp_no1 INT UNSIGNED,
	comp_no2 INT UNSIGNED,
	name VARCHAR(250),
	knowledge VARCHAR(1000),
	skills VARCHAR(1000),
	experience VARCHAR(1000)
	)
BEGIN
	UPDATE professional_competetions
	SET
	`Speciality` = speciality,
	`No1` = comp_no1,
	`No2` = comp_no2,
	`Name` = name,
	`Knowledge` = knowledge,
	`Skills` = skills,
	`Experience` = experience
	WHERE `ID` = id;
END;

CREATE PROCEDURE drop_professional_competetion(id INT UNSIGNED)
BEGIN
	DELETE FROM professional_competetions WHERE `ID` = id;
END;

CREATE PROCEDURE drop_all_professional_competetions()
BEGIN
	DELETE FROM professional_competetions;
END;



-- table: general_mastering

CREATE PROCEDURE add_general_mastering(
	code INT UNSIGNED,
	theme INT UNSIGNED,
	mastering INT UNSIGNED
	)
BEGIN
	INSERT INTO general_mastering(
	`Code`,
	`Theme`,
	`Mastering`
	)
	VALUES (
	code,
	theme,
	mastering
	);
END;

CREATE PROCEDURE get_general_mastering(id INT UNSIGNED)
BEGIN
	SELECT * FROM general_mastering WHERE `ID` = id;
END;

CREATE PROCEDURE set_general_mastering(
	id INT UNSIGNED,
	code INT UNSIGNED,
	theme INT UNSIGNED,
	mastering INT UNSIGNED
	)
BEGIN
	UPDATE general_mastering
	SET
	`Code` = code,
	`Theme` = Theme,
	`Mastering` = mastering
	WHERE `ID` = id;
END;

CREATE PROCEDURE drop_general_mastering(id INT UNSIGNED)
BEGIN
	DELETE FROM general_mastering WHERE `ID` = id;
END;

CREATE PROCEDURE drop_all_general_mastering()
BEGIN
	DELETE FROM general_mastering;
END;


-- table: professional_mastering

CREATE PROCEDURE add_professional_mastering(
	code INT UNSIGNED,
	theme INT UNSIGNED,
	mastering INT UNSIGNED
	)
BEGIN
	INSERT INTO professional_mastering(
	`Code`,
	`Theme`,
	`Mastering`
	)
	VALUES (
	code,
	theme,
	mastering
	);
END;

CREATE PROCEDURE get_professional_mastering(id INT UNSIGNED)
BEGIN
	SELECT * FROM professional_mastering WHERE `ID` = id;
END;

CREATE PROCEDURE set_professional_mastering(
	id INT UNSIGNED,
	code INT UNSIGNED,
	theme INT UNSIGNED,
	mastering INT UNSIGNED
	)
BEGIN
	UPDATE professional_mastering
	SET
	`Code` = code,
	`Theme` = Theme,
	`Mastering` = mastering
	WHERE `ID` = id;
END;

CREATE PROCEDURE drop_professional_mastering(id INT UNSIGNED)
BEGIN
	DELETE FROM professional_mastering WHERE `ID` = id;
END;

CREATE PROCEDURE drop_all_professional_mastering()
BEGIN
	DELETE FROM professional_mastering;
END;


-- table: general_selection

CREATE PROCEDURE add_general_selection(
	code INT UNSIGNED,
	theme INT UNSIGNED,
	mastering INT UNSIGNED
	)
BEGIN
	INSERT INTO general_selection(
	`Code`,
	`Theme`,
	`Mastering`
	)
	VALUES (
	code,
	theme,
	mastering
	);
END;

CREATE PROCEDURE get_general_selection(id INT UNSIGNED)
BEGIN
	SELECT * FROM general_selection WHERE `ID` = id;
END;

CREATE PROCEDURE set_general_selection(
	id INT UNSIGNED,
	code INT UNSIGNED,
	theme INT UNSIGNED,
	mastering INT UNSIGNED
	)
BEGIN
	UPDATE general_selection
	SET
	`Code` = code,
	`Theme` = Theme,
	`Mastering` = mastering
	WHERE `ID` = id;
END;

CREATE PROCEDURE drop_general_selection(id INT UNSIGNED)
BEGIN
	DELETE FROM general_selection WHERE `ID` = id;
END;

CREATE PROCEDURE drop_all_general_selection()
BEGIN
	DELETE FROM general_selection;
END;


-- table: professional_selection

CREATE PROCEDURE add_professional_selection(
	code INT UNSIGNED,
	theme INT UNSIGNED,
	mastering INT UNSIGNED
	)
BEGIN
	INSERT INTO professional_selection(
	`Code`,
	`Theme`,
	`Mastering`
	)
	VALUES (
	code,
	theme,
	mastering
	);
END;

CREATE PROCEDURE get_professional_selection(id INT UNSIGNED)
BEGIN
	SELECT * FROM professional_selection WHERE `ID` = id;
END;

CREATE PROCEDURE set_professional_selection(
	id INT UNSIGNED,
	code INT UNSIGNED,
	theme INT UNSIGNED,
	mastering INT UNSIGNED
	)
BEGIN
	UPDATE professional_selection
	SET
	`Code` = code,
	`Theme` = Theme,
	`Mastering` = mastering
	WHERE `ID` = id;
END;

CREATE PROCEDURE drop_professional_selection(id INT UNSIGNED)
BEGIN
	DELETE FROM professional_selection WHERE `ID` = id;
END;

CREATE PROCEDURE drop_all_professional_selection()
BEGIN
	DELETE FROM professional_selection;
END;


-- table: disciplines



CREATE PROCEDURE add_discipline(
	code INT UNSIGNED,
	name VARCHAR(250)
	)
BEGIN
	INSERT INTO disciplines(
	`Code`,
	`Name`
	)
	VALUES (
	code,
	name
	);
END;

CREATE PROCEDURE get_discipline(id INT UNSIGNED)
BEGIN
	SELECT * FROM disciplines WHERE `ID` = id;
END;



CREATE PROCEDURE set_discipline(
	id INT UNSIGNED,
	code INT UNSIGNED,
	name VARCHAR(250)
	)
BEGIN
	UPDATE disciplines
	SET
	`Code` = code,
	`Name` = name
	WHERE `ID` = id;
END;

CREATE PROCEDURE drop_discipline(id INT UNSIGNED)
BEGIN
	DELETE FROM disciplines WHERE `ID` = id;
END;

CREATE PROCEDURE drop_all_disciplines()
BEGIN
	DELETE FROM disciplines;
END;


-- table: theme_plan

CREATE PROCEDURE add_section(
	discipline INT UNSIGNED,
	section_no INT UNSIGNED,
	name VARCHAR(500),
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
	discipline,
	section_no,
	name,
	section_hours
	);
END;

CREATE PROCEDURE get_section(id INT UNSIGNED)
BEGIN
	SELECT * FROM theme_plan WHERE `ID` = id;
END;

CREATE PROCEDURE set_section(
	id INT UNSIGNED,
	discipline INT UNSIGNED,
	section_no INT UNSIGNED,
	name VARCHAR(500),
	section_hours INT UNSIGNED
	)
BEGIN
	UPDATE theme_plan
	SET
	`Discipline` = discipline,
	`No` = section_no,
	`Name` = name,
	`Hours` = section_hours
	WHERE `ID` = id;
END;

CREATE PROCEDURE drop_section(id INT UNSIGNED)
BEGIN
	DELETE FROM theme_plan WHERE `ID` = id;
END;

CREATE PROCEDURE drop_all_theme_plan()
BEGIN
	DELETE FROM theme_plan;
END;


-- table: themes

CREATE PROCEDURE add_theme(
	topic INT UNSIGNED,
	mastering_level INT UNSIGNED,
	theme_no INT UNSIGNED,
	name VARCHAR(500),
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
	topic,
	mastering_level,
	theme_no,
	name,
	theme_hours
	);
END;

CREATE PROCEDURE get_theme(id INT UNSIGNED)
BEGIN
	SELECT * FROM themes WHERE `ID` = id;
END;

CREATE PROCEDURE set_theme(
	id INT UNSIGNED,
	topic INT UNSIGNED,
	mastering_level INT UNSIGNED,
	theme_no INT UNSIGNED,
	name VARCHAR(500),
	theme_hours INT UNSIGNED
	)
BEGIN
	UPDATE themes
	SET
	`Topic` = topic,
	`Level` = mastering_level,
	`No` = theme_no,
	`Name` = name,
	`Hours` = theme_hours
	WHERE `ID` = id;
END;

CREATE PROCEDURE drop_theme(id INT UNSIGNED)
BEGIN
	DELETE FROM themes WHERE `ID` = id;
END;

CREATE PROCEDURE drop_all_themes()
BEGIN
	DELETE FROM themes;
END;


-- table: works

CREATE PROCEDURE add_work(
	theme INT UNSIGNED,
	work_type INT UNSIGNED
	)
BEGIN
	INSERT INTO works(
	`Theme`,
	`Type`
	)
	VALUES (
	theme,
	work_type
	);
END;

CREATE PROCEDURE get_work(id INT UNSIGNED)
BEGIN
	SELECT * FROM works WHERE `ID` = id;
END;

CREATE PROCEDURE set_work(
	id INT UNSIGNED,
	theme INT UNSIGNED,
	work_type INT UNSIGNED
	)
BEGIN
	UPDATE works
	SET
	`Theme` = theme,
	`Type` = work_type
	WHERE `ID` = id;
END;

CREATE PROCEDURE drop_work(id INT UNSIGNED)
BEGIN
	DELETE FROM works WHERE `ID` = id;
END;

CREATE PROCEDURE drop_all_works()
BEGIN
	DELETE FROM works;
END;


-- table: tasks

CREATE PROCEDURE add_task(
	work_id INT UNSIGNED,
	name VARCHAR(500),
	task_hours SMALLINT UNSIGNED
	)
BEGIN
	INSERT INTO tasks(
	`Work`,
	`Name`,
	`Hours`
	)
	VALUES (
	work_id,
	name,
	task_hours
	);
END;

CREATE PROCEDURE get_task(id INT UNSIGNED)
BEGIN
	SELECT * FROM tasks WHERE `ID` = id;
END;

CREATE PROCEDURE set_task(
	work_id INT UNSIGNED,
	name VARCHAR(500),
	task_hours SMALLINT UNSIGNED
	)
BEGIN
	UPDATE tasks
	SET
	`Work` = work_id,
	`Name` = name,
	`Hours` = task_hours
	WHERE `ID` = id;
END;

CREATE PROCEDURE drop_task(id INT UNSIGNED)
BEGIN
	DELETE FROM tasks WHERE `ID` = id;
END;

CREATE PROCEDURE drop_all_tasks()
BEGIN
	DELETE FROM tasks;
END;

-- table: meta data

delimiter \;

CREATE PROCEDURE add_meta_data(
	discipline INT UNSIGNED,
	type_id INT UNSIGNED,
	name VARCHAR(1000)
	)
BEGIN
	INSERT INTO Meta_data(
	`Discipline`,
	`Type`,
	`Name`
	)
	VALUES (
	discipline,
	type_id,
	name
	);
END;

CREATE PROCEDURE get_meta_data(id INT UNSIGNED)
BEGIN
	SELECT * FROM Meta_data WHERE `ID` = id;
END;

delimiter \;

CREATE PROCEDURE set_meta_data(
	discipline INT UNSIGNED,
	type_id INT UNSIGNED,
	name VARCHAR(1000)
	)
BEGIN
	UPDATE Meta_data
	SET
	`Discipline` = discipline,
	`Type` = type_id,
	`Name` = name
	WHERE `ID` = id;
END;

CREATE PROCEDURE drop_meta_data(id INT UNSIGNED)
BEGIN
	DELETE FROM Meta_data WHERE `ID` = id;
END;

CREATE PROCEDURE drop_all_meta_data()
BEGIN
	DELETE FROM Meta_data;
END;



-- Custom procedures



CREATE PROCEDURE seek_for_column_type(name VARCHAR(15))
BEGIN
	SELECT 
		table_name,
		column_name,
		numeric_precision,
		column_type
	FROM information_schema.columns
	WHERE
		TABLE_SCHEMA = 'prosperity'
	   AND
		data_type = name;
END;

delimiter \;

CREATE PROCEDURE get_log(name VARCHAR(50), value INT) 
BEGIN
	SELECT concat(name, value);
END;