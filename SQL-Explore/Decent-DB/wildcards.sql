------------------------------- WILDCARDS -------------------------

-- Usually we use wildcards with LIKE 
-- '%': represent for more characters
-- '_': represent for only 1 character

-- With % we can use when we want it represent for many characters or we don't know how many characters
-- With _ we can use when we want to format a fixed structure like we know the structure and the characters
-- we have right

use Company

-- get the first name have the A in the end of that first_name, and before we can have any character
select * from Employee where first_name like '%A'

-- get the last name have the Nguyen in the start of that last_name, and after that we can have any character
select * from Employee where last_name like 'Nguyen%'

-- get the first name have the Van, so before and after we can have any character right
select * from Employee where first_name like '%Van%'

-- now we know the format of the birth_data 2000-12-23 so like this we can use it to do something
-- so in this case we find the employees born in the December
select * from Employee where birth_date like '____-12%'
-- we can aplly this for maybe find the employee have the name with the Van in the certain name like
-- Nguyen Van A then we can do: LIKE '______ Van _' so like this right

-- So basically we write expression in this '' and this looks like the regular expression but with version
-- simpler right
-- Notice that we need to use '' not "" ok, everything in SQL we always use '' so single quote