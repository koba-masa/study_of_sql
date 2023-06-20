DROP TABLE IF EXISTS not_null_when_add_columns2;
CREATE TABLE not_null_when_add_columns2 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255)
);

INSERT INTO not_null_when_add_columns2 (name) VALUES
  ('nobunaga'),
  ('hideyoshi')
;


SELECT * FROM not_null_when_add_columns2;

ALTER TABLE not_null_when_add_columns2 ADD COLUMN added_column VARCHAR(255);

SELECT * FROM not_null_when_add_columns2;

ALTER TABLE not_null_when_add_columns2 MODIFY added_column VARCHAR(255) NOT NULL;
