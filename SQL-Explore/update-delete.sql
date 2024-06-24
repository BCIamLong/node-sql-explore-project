USE NodeSQLExplore

-- INSERT INTO Teachers (teacher_email, teacher_name, age) VALUES ('c@gmail.com', 'C', 19)
-- INSERT INTO Teachers (teacher_email, teacher_name, age) VALUES ('d@gmail.com', 'D', 19)
-- INSERT INTO Teachers (teacher_email, teacher_name, age) VALUES ('e@gmail.com', 'E', 19)

-- Logic operations: OR, AND, NOR...
UPDATE Teachers
SET teacher_name = 'Nguyen Van C'
WHERE id = 2 AND isTeaching = 0;

-- Comparison operations: >, <, <>, !=, =, >=, <=...
UPDATE Teachers
SET isTeaching = 1
WHERE id = 3 OR age > 18;

UPDATE Teachers
SET isTeaching = 1
WHERE id = 3 OR age > 18;

-- The queries above are update for a specific row or teacher
-- Update for all rows or all teachers
UPDATE Teachers
SET isTeaching = 0

-- DELETE: the implement quite the same with UPDATE
-- Delete for a specific row or teacher

DELETE FROM Teachers
WHERE id = 4 AND isTeaching=0;

DELETE FROM Teachers
WHERE id = 3 OR age = 18;

-- Delete all the rows or teachers
DELETE FROM Teachers;

-- Notice the WHERE condition; and this condition can be more complex if we have complex table, DB, complex
-- relationship and based on the requirements
-- So keep in mind in the real world it can be more complex than just this, so this is just basic queries

SELECT * FROM Teachers