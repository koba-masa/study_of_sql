\pset null (null)

DROP TABLE IF EXISTS not_null_when_add_columns2;
CREATE TABLE not_null_when_add_columns2(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

INSERT INTO not_null_when_add_columns2 (name) VALUES
  ('nobunaga'),
  ('hideyoshi')
;

SELECT * FROM not_null_when_add_columns2;

ALTER TABLE not_null_when_add_columns2 ADD COLUMN added_column VARCHAR(32);

SELECT * FROM not_null_when_add_columns2;

ALTER TABLE not_null_when_add_columns2 ALTER COLUMN added_column SET NOT NULL;

SELECT * FROM not_null_when_add_columns2;
