-- Custom procedures

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

-- delimiter \;

CREATE PROCEDURE get_log(var_name VARCHAR(50), var_value INT) 
BEGIN
	SELECT concat(var_name, var_value);
END;