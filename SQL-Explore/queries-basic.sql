-- * THE PROBLEM with the SELECT * FROM table_name 
-- * So when the data grow and we have huge data store in the DB
-- * For example: in the student table we have 1 million studens are stored
-- * And in the practical we don't use SELECT * FROM table_name like this because we don't crazy to get all 1 millions students right
-- * We ONLY WANT to get some piece of data so some piece of students with some certain conditions right
-- * For example: get the studen with the name start with ..., get students have gpa > 3.0 ...
-- * And also we don't always want to get all the columns of the data, the student right maybe sometime we only want some columns of the data, the student like just name, age, phone... right

-- * And queries are just SQL blocks contains SQL code to make the query to DBMS and ask it to get the data from DB
-- * This block can be more complex based on the data and the conditions we want


USE NodeSQLExplore

--INSERT INTO Teachers (teacher_email, teacher_name, age) VALUES ('c@gmail.com', 'C', 19)
--INSERT INTO Teachers (teacher_email, teacher_name, age) VALUES ('d@gmail.com', 'D', 30)
--INSERT INTO Teachers (teacher_email, teacher_name, age) VALUES ('f@gmail.com', 'F', 21)

-- ------------------------------Select certain columns, fields in the table --------------------------
/*
SELECT Teachers.teacher_name, Teachers.teacher_email
FROM Teachers
*/

---------------------------------------- Sort the data ------------------------------------------
-- Use ORDER BY field_to_sort
-- Contrainsts: DESC for descending, ASC for ascending (default is ASC)

-- Sort data with a certain column, field (? how to sort based 2 or more columns?)
/*
SELECT Teachers.teacher_name, Teachers.teacher_email
FROM Teachers
ORDER BY Teachers.age DESC

SELECT Teachers.teacher_name, Teachers.teacher_email
FROM Teachers
ORDER BY Teachers.id DESC
*/

-- Question: ? how to sort based 2 or more columns?
-- Sort data with sub columns

/*
SELECT Teachers.teacher_name, Teachers.teacher_email
FROM Teachers
ORDER BY Teachers.age, Teachers.id DESC
*/

/*
Notice: when we sort with sub columns like in this case Teachers.age, Teachers.id it will sort the age first
then if we have the students have the same age => it will continue sort with id 

- The prioty is from left to right
- If the previous result of sorting has the case that the entries have the same value of the column want to
sort then it will go to the next sort column as we declare in the sort of sub columns and sort only for those 
entries have the same value

=> it's the same with the way it work in sort operation in MongoDB
*/

------------------------------------------------ LIMIT --------------------------------------------------
-- To limit the amount of data we want to select

-- LIMIT is built-in on MySQL, in MS SQL we will use SELECT TOP to do that

-- We can do it simple like this
/*
SELECT TOP 2 * 
FROM Teachers;
*/

-- Or we can do it with more complex by combine many other ways to select the data
/*
SELECT TOP 2 Teachers.teacher_name, Teachers.teacher_email
FROM Teachers
ORDER BY Teachers.age, Teachers.id ;
*/

-- Of course if it can be more complex than this based on the amounts of data, requirements...

----------------------------------------- Filter ---------------------------------------------

/*
SELECT *
FROM Teachers
WHERE Teachers.habit IS NULL OR Teachers.age > 25 AND Teachers.age < 40;
*/

-- Notice the above command: 

-- IS
-- IS is the operation we use to check for NULL and NOT NULL values
-- Instead of habit = NULL => habit IS NULL, habit IS NOT NULL

-- And in SQL we have precedence (do uu tien) of operations like we have in like JS operations right
-- And because OR has precedence less than AND then
-- This WHERE Teachers.habit IS NULL OR Teachers.age > 25 AND Teachers.age < 40
-- will become: WHERE Teachers.habit IS NULL OR (Teachers.age > 25 AND Teachers.age < 40)
-- because AND is more priority then it will be check first then the OR operation

-- And if we want to make the condition like we want to force the conditions go to a form we can use ()

/*
SELECT *
FROM Teachers
WHERE (Teachers.habit IS NULL OR Teachers.age > 25) AND Teachers.age < 30;
*/

-- Because () has the precedence higher, maybe highest in SQL then the things inside of () will always
-- perform first

-- Precedence table: 
/*
| Precedence | Operator(s) |	Description             |
|	1	     | (), []      | Parentheses (grouping)     |
2	::	Type cast
3	+, -	Unary plus and minus
4	*, /, %	Multiplication, division, modulus
5	+, -	Addition, subtraction
6	IS, IS NOT	IS and IS NOT
7	IN, NOT IN	IN and NOT IN
8	BETWEEN, LIKE	BETWEEN, LIKE, and ILIKE
9	=, <>, !=, <, <=, >, >=	Comparison operators
10	NOT	Logical NOT
11	AND	Logical AND
12	OR	Logical OR

*/
-- Complex queries what we will met every time and to make these complex queries we first understand about
-- the SQL operations precedence to understand what is the expression will execute first, the order executes
-- of the command, how to change the order executes fit with our goal...
-- So that's important right

-- IN: like enum operation in MongoDB

SELECT TOP 2 *
FROM Teachers
WHERE (Teachers.habit IS NULL OR Teachers.age > 25) AND (Teachers.age < 30 AND Teachers.age IN (19, 20, 21))

-- <> is not equal opreation like !== in JS
