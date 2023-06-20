\pset null (null)
DROP TABLE IF EXISTS not_null_when_alter_tables1;
CREATE TABLE not_null_when_alter_tables1(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

INSERT INTO not_null_when_alter_tables1 (name) VALUES
  ('nobunaga'),
  ('hideyoshi')
;

SELECT * FROM not_null_when_alter_tables1;

ALTER TABLE not_null_when_alter_tables1 ADD COLUMN added_column VARCHAR(32) NOT NULL;

SELECT * FROM not_null_when_alter_tables1;
