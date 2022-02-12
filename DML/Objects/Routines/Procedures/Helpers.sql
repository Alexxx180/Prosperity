-- Custom procedures

-- delimiter \;

CREATE PROCEDURE seek_for_column_type(type_name VARCHAR(15))
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
		data_type = type_name;
END;

CREATE PROCEDURE get_log(var_name VARCHAR(50), var_value INT) 
BEGIN
	SELECT concat(var_name, var_value);
END;

CREATE PROCEDURE hours_auto_set(discipline_id INT UNSIGNED, hours_count SMALLINT UNSIGNED)
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE hour_id INT UNSIGNED;
  DECLARE id_cursor CURSOR FOR SELECT id FROM work_types;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  OPEN id_cursor;

  REPEAT
    FETCH id_cursor INTO hour_id;
    IF NOT done AND hour_id IS NOT NULL THEN
      CALL add_hour(discipline_id, hour_id, hours_count);
    END IF;
  UNTIL done END REPEAT;

  CLOSE id_cursor;
END;

CREATE PROCEDURE meta_data_auto_set(discipline_id INT UNSIGNED, data_name VARCHAR(1000))
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE data_type_id INT UNSIGNED;
  DECLARE id_cursor CURSOR FOR SELECT id FROM meta_types;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  OPEN id_cursor;

  REPEAT
    FETCH id_cursor INTO data_type_id;
    IF NOT done AND data_type_id IS NOT NULL THEN
      CALL add_meta_data(discipline_id, data_type_id, data_name);
    END IF;
  UNTIL done END REPEAT;

  CLOSE id_cursor;
END;