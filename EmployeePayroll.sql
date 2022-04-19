--UC1 Create database
CREATE DATABASE Payroll_Service;

--UC2 Create table
CREATE TABLE Employee_Payroll(
ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
Name VARCHAR(50),
PhoneNumber BIGINT,
StartDate DATETIME,
Salary BIGINT
);

--UC 3 INsert data into table
INSERT INTO Employee_Payroll(Name,PhoneNumber,StartDate,Salary) 
VALUES('Sankalp',123456,'2022-04-13',12345),
('Sonal',234234,'2022-04-13',50000),
('Aditya',5000,'2020-04-13',234234);

--UC4 Retrieve data
SELECT * FROM Employee_Payroll;

--UC 5 Salary of Perticualar Employee
SELECT Salary FROM Employee_Payroll WHERE NAME = 'Sankalp';

--UC 6 Add Gender column
ALTER TABLE Employee_Payroll ADD Gender VARCHAR(1);
UPDATE Employee_Payroll SET Gender = 'M' WHERE Name = 'Aditya';

--UC7 
--SUM  of salary
SELECT Gender, SUM(Salary) AS Sum_OF_SALARY FROM Employee_Payroll GROUP BY Gender ;
-- Average of salary
SELECT Gender, AVG(Salary) AS AVG_OF_SALARY FROM Employee_Payroll GROUP BY Gender ;
--Min salary
SELECT Gender, MIN(Salary) AS MIN_SALARY FROM Employee_Payroll GROUP BY Gender ;
--max salary
SELECT Gender, MAX(Salary) AS MAX_SALARY FROM Employee_Payroll GROUP BY Gender ;
--number of males and females
SELECT Gender, COUNT(Gender) AS GENDER_COUNT FROM Employee_Payroll GROUP BY Gender;

--UC8
ALTER TABLE Employee_Payroll ADD Addresses VARCHAR(250);
ALTER TABLE Employee_Payroll ADD  Department VARCHAR(250);
ALTER TABLE Employee_Payroll ADD CONSTRAINT DF_Address DEFAULT 'Address' FOR Addresses;

--UC9
ALTER TABLE Employee_Payroll ADD Basic_Pay BIGINT;
ALTER TABLE Employee_Payroll ADD Deductions BIGINT;
ALTER TABLE Employee_Payroll ADD Taxable_Pay BIGINT;
ALTER TABLE Employee_Payroll ADD Income_Tax BIGINT;
ALTER TABLE Employee_Payroll ADD Net_Pay BIGINT;


--UC10
INSERT INTO Employee_Payroll(Name,PhoneNumber,StartDate,Salary,Gender,Addresses,Department,Basic_Pay,Deductions,Taxable_Pay,Income_Tax,Net_Pay)
VALUES ('Terissa',09345564,'12-12-20',347563,'F','Delhi','Sales',240000,34567,35612,12367,123456);

CREATE TABLE Department(
Dept_ID int NOT NULL,
Name VARCHAR(100),
Dept_Name VARCHAR(50),
CONSTRAINT FK FOREIGN KEY (Dept_ID) REFERENCES Employee_Payroll(ID)
);
-- UC 11 ER DIAGRAM
INSERT INTO Department(Dept_ID,Name,Dept_Name)
VALUES(1,'Terrisa','Sales'),
(1,'Terrisa','Marketing');

SELECT * FROM Department;