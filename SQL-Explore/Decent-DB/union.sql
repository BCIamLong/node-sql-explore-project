----------------------------------- UNION ------------------------------

-- UNION is the operator that we can combine two or more select statements and combine their results to one 
-- column

-- e.x: select first_name from Employee UNION select brand_name from Brand

-- So it will combine two result of these two select statements to one column

-- And that column's name is first_name, why? so because this will take the name of the column in the first
-- statement to make the column result

-- If we don't want that then we can use AS to change this 
-- => select first_name AS general_names from Employee UNION select brand_name from Brand

-- Conditions:
-- The select statements must have the same columns number, and columns type 
-- select first_name from Employee UNION select brand_name from Brand
-- in this case first_name and brand_name have the same type is string right
-- => select first_nam,A,B... from Employee UNION select brand_name,C,D... from Brand
-- The A must have the same data type with C and the B must have the same data type with D and similar if we
-- have many columns
-- If we don't match the conditions then the UNION will not work as we expected

use Company

-- we can do more select statements as we want with UNION if we satisfy the conditions
select first_name from Employee
UNION 
select branch_name from Branch
UNION
select client_name from Client


select first_name, branch_id  from Employee
UNION 
select branch_name, id from Branch

-- in the case if we have 
/*
select first_name, branch_id  from Employee
UNION 
select branch_name, branch_id from Branch

so we have two branch_id in the select statements, in this case it can be confusing right
and what we can do is use the prefix table for these columns

select first_name, Employee.branch_id  from Employee
UNION 
select branch_name, Branch.branch_id from Branch

and with this we know what's the branch_id for Employee and Branch 
so it makes the code more readable right

and this way can also apply for more complex queries because in that case we have the long queries then 
and it can cause some confusing so apply this way is really good and make the code more readable

*/