use Company

-- AS
-- We can use it when we select data and we want to change the name of the column
-- For example in the case the name column is not suite for this context then we want to select and also change
-- that we can use
/*
select first_name as represent_name from Employee
select first_name as represent_name, last_name from Employee
select first_name as represent_name, last_name as addition_name from Employee
*/

-- LIMIT or TOP 
--select top 6 * from Employee;

-- DISTICT: to get all distinct values of the column in the table

--select DISTINCT sex from Employee;

--select * from Employee order by salary, first_name 
--select * from Employee order by salary desc
