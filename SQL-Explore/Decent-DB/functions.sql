use Company


-- select * from Employee

-- https://www.w3schools.com/sql/func_sqlserver_convert.asp

/*
select count(id) 
from Employee

select count(id) 
from Employee
where sex = 'F'

select count(id) 
from Employee
where sex = 'M' and birth_date > '1997-01-01'
-- or we can do it like this: where sex = 'M' and birth_date > '1997'
*/

-- SUM and AVG functions: (1 param: field we want to calculate)

/*
select sum(salary) from Employee
select avg(salary) from Employee

select sum(id) from Employee

select sum(salary) from Employee where sex = 'M'
select avg(salary) from Employee where sex = 'M'
select sum(salary) from Employee where sex = 'M' and super_id > 10
*/

-- AGGREGATION (WE WILL EXPLORE MORE BECAUSE IT'S IMPORTANT)

--select * from Employee

-- so if we want to select and also include some fields so include more information we can use aggregation
-- we can declare the fields after we use the function like: count(sex), fields... but we need to declare these
-- fields in the GROUP BY fields...
/*
select count(sex), sex
from Employee
group by sex;

-- aggregation with many fields
select count(sex), sex, salary
from Employee
group by sex, salary;
*/

-- select * from Works_With

-- we can say group by emp_id and calculate sum total_sales of each emp_id
select sum(total_sales), emp_id
from Works_With
group by emp_id;

select sum(total_sales), client_id
from Works_With
group by client_id;