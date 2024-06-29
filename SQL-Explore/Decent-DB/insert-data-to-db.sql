use Company;

-- In MS SQL when we add the date field if we write it by string we need to convert it like this otherwise it
-- will not work
-- Notice that in MySQL maybe we just write string and will convert to date but in MS SQL it's not

-- This is the way we can add the new values to the table which is have the foreign key when we have no data yet
-- Because now we don't have data in Employee and Branch table so we can't set foreign key right therefore
-- we need to use the way bellow add placholders with NULL and then update it again when we already have
-- the branch data right

-- insert into Employee values ('Van A', 'Nguyen', CONVERT(date, '23-12-2000', 103), 'M', 250000, null, null)
-- insert into Employee values ('Van B', 'Nguyen', CONVERT(date, '20-02-2000', 103), 'M', 3000, null, null)

-- insert into Branch values('Comporate', 1, CONVERT(date, '23-12-2020', 103))
-- insert into Branch values('Comporate', 7, CONVERT(date, '23-12-2020', 103))
/*
update Employee
set branch_id = 1
where id = 1;
*/

/*
update Employee
set super_id = 7
where id = 6;
*/

--alter table Branch
--add foreign key(mrg_id) references Employee(id) on delete set null;

--select * from Employee

--delete from Branch
--where id = 1;

--select * from Branch

/*
INSERT INTO employee VALUES('David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO branch VALUES('Corporate', 8, '2006-02-09');

UPDATE employee
SET branch_id = 1
WHERE id = 8;

INSERT INTO employee VALUES( 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 8, 2);

-- Scranton
INSERT INTO employee VALUES('Michael', 'Scott', '1964-03-15', 'M', 75000, 8, NULL);

INSERT INTO branch VALUES('Scranton', 10, '1992-04-06');

UPDATE employee
SET branch_id = 3
WHERE id = 10;

INSERT INTO employee VALUES('Angela', 'Martin', '1971-06-25', 'F', 63000, 10, 3);
INSERT INTO employee VALUES('Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 10, 3);
INSERT INTO employee VALUES('Stanley', 'Hudson', '1958-02-19', 'M', 69000, 10, 3);

-- Stamford
INSERT INTO employee VALUES('Josh', 'Porter', '1969-09-05', 'M', 78000, 8, NULL);

INSERT INTO branch VALUES('Stamford', 11, '1998-02-13');

UPDATE employee
SET branch_id = 4
WHERE id = 11;

INSERT INTO employee VALUES('Andy', 'Bernard', '1973-07-22', 'M', 65000, 11, 4);
INSERT INTO employee VALUES('Jim', 'Halpert', '1978-10-01', 'M', 71000, 11, 4);

*/

-- select * from Employee

--drop table Branch_Supplier


/*
create table Branch_Supplier(
  branch_id int,
  supplier_name varchar(80),
  supply_type varchar(40),
  primary key(branch_id,supplier_name),
  foreign key(branch_id) references Branch(id) on delete cascade
)
*/




--select * from Branch_Supplier
/*
INSERT INTO Branch_Supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO Branch_Supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO Branch_Supplier VALUES(4, 'Patriot Paper', 'Paper');
INSERT INTO Branch_Supplier VALUES(4, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO Branch_Supplier VALUES(5, 'Uni-ball', 'Writing Utensils');
INSERT INTO Branch_Supplier VALUES(5, 'Hammer Mill', 'Paper');
INSERT INTO Branch_Supplier VALUES(6, 'Stamford Lables', 'Custom Forms');
*/

/*
create table Client (
 id int primary key identity,
 client_name varchar(60) not null,
 branch_id int foreign key references Branch(id) on delete set null
)

-- CLIENT
INSERT INTO client VALUES('Dunmore Highschool', 3);
INSERT INTO client VALUES('Lackawana Country', 3);
INSERT INTO client VALUES( 'FedEx', 4);
INSERT INTO client VALUES( 'John Daly Law, LLC', 4);
INSERT INTO client VALUES( 'Scranton Whitepages', 3);
INSERT INTO client VALUES( 'Times Newspaper', 4);
INSERT INTO client VALUES( 'FedEx', 6);
*/

--select * from client


/*
create table Works_With(
  emp_id int,
  client_id int,
  total_sales int not null,
  primary key(emp_id, client_id),
  foreign key(emp_id) references Employee(id) on delete cascade,
  foreign key(client_id) references Client(id) on delete cascade,
)


INSERT INTO works_with VALUES(8, 4, 55000);
INSERT INTO works_with VALUES(10, 2, 267000);
INSERT INTO works_with VALUES(11, 3, 22500);
INSERT INTO works_with VALUES(9, 5, 5000);
INSERT INTO works_with VALUES(11, 4, 12000);
INSERT INTO works_with VALUES(8, 2, 33000);
INSERT INTO works_with VALUES(9, 6, 26000);
INSERT INTO works_with VALUES(11, 7, 15000);
INSERT INTO works_with VALUES(10, 3, 130000);
*/

select * from works_with

