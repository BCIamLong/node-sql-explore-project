---------------------------------CONTRAINTS-----------------------------
-- DEFAULT, UNIQUE, AUTO_INCREMENT, IDENTITY, NULL, NOT NULL

-- DROP TABLE Teachers

/*
CREATE TABLE Teachers (
  id INT PRIMARY KEY,
  name VARCHAR(20), 
)

INSERT INTO Teachers (name) VALUES('Teacher 1')

-- If we do it like the code above the we get the error: Cannot insert the value NULL into column 'id'
-- because we don't have contraint for the id right
*/

-- DROP TABLE Teachers

-- with identity contraint it will hepl us auto increment the id value
/*
The IDENTITY constraint in SQL is a property you can assign to a column in a table. It ensures the column 
automatically generates unique numeric values for each new row inserted. This simplifies data management and
often serves as a primary key for the table.

Here's a breakdown of how IDENTITY constraints work:

Automatic Value Generation: Whenever a new row is inserted, the database system automatically assigns a unique value to the IDENTITY column. You don't need to specify a value for this column during insert operations.

Seed and Increment: The IDENTITY constraint uses a combination of seed and increment values to generate unique numbers.

Seed (Optional): This is the starting value for the sequence. By default, it's 1, but you can specify a different starting point.
Increment (Optional): This is the value added to the previous identity value to generate the next one in the sequence. By default, it's also 1, meaning the values will increase by 1 for each new row.
Guaranteed Uniqueness: The IDENTITY constraint ensures that each new value generated is unique within the table. This helps prevent duplicate entries and simplifies data referencing.

Data Types: IDENTITY columns can be of integer data types like int, bigint, smallint, or numeric/decimal with a scale of 0 (no decimals).
*/

/*
CREATE TABLE Teachers (
  id INT PRIMARY KEY IDENTITY,
  name VARCHAR(20), 
)
*/

-- INSERT INTO Teachers (name) VALUES('Teacher 1')

-- AUTO_INCREMENT contraint
/*
AUTO_INCREMENT itself isn't universally supported across all SQL platforms. It's commonly used in MySQL, 
but the syntax for achieving automatic incrementing IDs differs between database management systems. Here's 
a breakdown:
MS SQL Server: Instead of AUTO_INCREMENT, you use the IDENTITY constraint. This constraint is applied to a 
column, typically the primary key, and takes a seed (starting value) and increment (value added for each new
row) as parameters
*/

/*
CREATE TABLE Teachers (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(20)
)
*/

-- UNIQUE, NULL, NOT NULL and DEFAULT constraint 
-- UNIQUE is make the column is unique and we can't duplicate when we add or update the data 
-- NULL is allow the column can be NULL (mean that we don't pass the value for it)
-- NOT NULL is make the column must have the value and can't be NULL
-- DEFAULT val: make the default value for the columns when we don't pass anything to this column 

DROP TABLE Teachers

-- Notice: BIT is the type of data in SQL and has value only one of 0 and 1, this can be used to for the replacement of boolean type in SQL
-- So in PostgreSQL we have Boolean type but the remain other DBMSs like MySQL, MS SQL... we don't have that Boolean type support so we can use BIT for the replacement
-- Depending the type of DBMS we can have the different replacement so if we get some error just google to see what is the replacement for the specific DBMS

CREATE TABLE Teachers (
  id INT PRIMARY KEY IDENTITY,
  teacher_email NVARCHAR(50) UNIQUE NOT NULL,
  teacher_name VARCHAR(20) NOT NULL,
  age INT NOT NULL,
  habit VARCHAR(20) NULL,
  isTeaching BIT DEFAULT 0
)

INSERT INTO Teachers (teacher_email, teacher_name, age) VALUES ('nguyenvana@gmail.com', 'Nguyen Van A', 18)

SELECT * FROM Teachers