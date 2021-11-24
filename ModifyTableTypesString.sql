CALL seek_for_column_type('varchar');

-- MySQL doesn't have means to optimize that, so we use
-- only one column per query

ALTER TABLE
Meta_types
MODIFY
`Name`
VARCHAR(500)
NOT NULL;

ALTER TABLE
Meta_data
MODIFY
`Name`
VARCHAR(1000)
NOT NULL
DEFAULT "";

ALTER TABLE
Sources
MODIFY
`Name`
VARCHAR(1000)
NOT NULL
DEFAULT "";