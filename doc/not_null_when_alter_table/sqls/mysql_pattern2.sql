DROP TABLE IF EXISTS not_null_when_alter_tables2;
CREATE TABLE not_null_when_alter_tables2 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255)
);

INSERT INTO not_null_when_alter_tables2 (name) VALUES
  ('nobunaga'),
  ('hideyoshi')
;


SELECT * FROM not_null_when_alter_tables2;

ALTER TABLE not_null_when_alter_tables2 ADD COLUMN added_column VARCHAR(255);

SELECT * FROM not_null_when_alter_tables2;

ALTER TABLE not_null_when_alter_tables2 MODIFY added_column VARCHAR(255) NOT NULL;
