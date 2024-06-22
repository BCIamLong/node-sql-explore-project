CREATE DATABASE NodeSQLExplore

USE NodeSQLExplore


CREATE TABLE Student
(
Id int primary key Identify,
Name nvarchar(100) NOT NULL,
Email nvarchar(100) NOT NULL UNIQUE,
Phone nvarchar(20) NOT NULL UNIQUE
)

INSERT INTO Student (Name, Email, Phone) VALUES
(N'Nguyen Van A', "a@gmail.com", 0123456789),
(N'Nguyen Van B', "b@gmail.com", 0123456788)