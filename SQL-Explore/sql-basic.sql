/*
CREATE DATABASE Shop

DROP DATABASE Shop

*/
-- Use database
USE NodeSQLExplore

--------------------------------------------------------------------------------------------------------
-- SELECT * FROM Student

-- DESCRIBE is not a built-in stored procedure in MS SQL Server so therefore we can use the command bellow
-- SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Student';

/*
CREATE TABLE Teachers(
  teacher_id INT PRIMARY KEY,
  name VARCHAR(20),
  phone VARCHAR(10)
)
*/


-- Add column after define table
-- ALTER TABLE Teachers ADD major VARCHAR(20);

-- Drop a specific column in the table
-- ALTER TABLE Teachers DROP COLUMN major;

-- Drop table

-- DROP TABLE Teachers;

-- SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Teachers'
----------------------------------------------------------------------------------------------------
-- Inserting data

-- Way 1:
-- with way 1 we can add the teacher data with specific column for example if i just want to add the teacher
-- with only teacher_id and name i just write 
-- INSERT INTO Teachers(teacher_id, name) VALUES (1, 'Teacher 1')
-- with the way 2 we might add with all the data
-- of course notice that the columns we don't add can be NULL if it's NOT NULL then it's impossible

-- but with the way 2 we can do the thing like that:
-- INSERT INTO Teachers VALUES (1, 'Teacher 1', NULL) 
-- so these are equivalent and we can use both way when we add the data and don't want to add the can be NULL
-- data so that's it


-- INSERT INTO Teachers(teacher_id, name, phone) VALUES (1, 'Teacher 1', '0123456789')
-- or
-- Way 2:
-- INSERT INTO Teachers VALUES (1, 'Teacher 1', '0123456789')

-- INSERT INTO Teachers(teacher_id, name) VALUES (3, 'Teacher 3')
-- INSERT INTO Teachers VALUES (2, 'Teacher 2', NULL) 

-- the VALUES data must be the same order in the columns in the table

-- the result with Row effected 1 is just because we add a new row to the table then that row effected by us
-- with 1 row right because we just add 1 new data right

SELECT * FROM Teachers
-- SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Teachers'