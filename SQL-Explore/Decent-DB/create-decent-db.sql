
-- Notice that if the DB has the tables have the foreign keys then we will met the error when delete DB
-- we need to see where the foreign key and then delete these keys then we can delete DB

-- EXEC sp_fkeys 'Table1'

--DROP DATABASE Company
 
-- CREATE DATABASE Company

-- Notice that when we delete table has the id which is the foreign key of another table we can't delete
-- table with normal but we need to delete the foreign key of this table first then we can delete this
-- of course we can have the way to delete the table also have foreign key
-- https://stackoverflow.com/questions/25267532/could-not-drop-object-dbo-table1-because-it-is-referenced-by-a-foreign-key-con
-- https://stackoverflow.com/questions/1776079/sql-drop-table-foreign-key-constraint

-- drop table Employee;

-- EXEC sp_fkeys 'Employee'

/*
CREATE TABLE Employee (
  id INT PRIMARY KEY IDENTITY,
  first_name varchar(40) not null,
  last_name varchar(40) not null,
  birth_date date not null,
  sex varchar(1) not null,
  salary int not null, 
  super_id int,
  branch_id int
)
*/



/*
create table Branch(
 id int primary key identity,
 branch_name varchar(60) not null,
 mrg_id int,
 mrg_start_date date,
)
*/

-- with foreign key when we use alter and add foreign key we just add once so keep in mind that
-- but if we do something like: add column... then we can have multiple lines

/*
alter table Employee
add foreign key(branch_id) references Branch(id) on delete set null;
*/

-- We met the error when perform the command bellow because we point to the Employee itself right so that's
-- may cause cycles or multiple cascade paths
-- Introducing FOREIGN KEY constraint 'FK__Employee__super___3F466844' on table 'Employee' may cause cycles 
-- or multiple cascade paths. Specify ON DELETE NO ACTION or ON UPDATE NO ACTION, or modify other FOREIGN 
-- KEY constraints.

-- to solve that we can use: ON DELETE NO ACTION or ON UPDATE NO ACTION
alter table Employee
add foreign key(super_id) references Employee(id) ON DELETE NO ACTION;
-- add foreign key(super_id) references Employee(id) on delete set null;

------------------------------------------------------------------------------------------------------
--? So what is  ON DELETE NO ACTION or ON UPDATE NO ACTION, on delete set null and on delete cascade
/*
answer here
*/
------------------------------------------------------------------------------------------------------



/*
create table Client (
 id int primary key identity,
 client_name varchar(60) not null,
 branch_id int foreign key references Branch(id) on delete set null
)
*/


/*
create table Works_With(
  emp_id int,
  client_id int,
  total_sales int not null,
  primary key(emp_id, client_id),
  foreign key(emp_id) references Employee(id) on delete cascade,
  foreign key(client_id) references Client(id) on delete cascade,
)
*/

/*
create table Branch_Supplier(
  branch_id int,
  supplier_name int,
  supply_type varchar(40),
  primary key(branch_id,supplier_name),
  foreign key(branch_id) references Branch(id) on delete cascade
)
*/