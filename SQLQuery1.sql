--CREATE TABLE EmployeeDemographics
--(EmployeeID int, 
--FirstName varchar(50),           -- Creating table.
--LastName varchar(50),
--Age int,
--Gender varchar(50)
--);

--CREATE TABLE EmployeeSalary
--(EmployeeID int,
--JobTitle varchar(50),           -- Creating second table.
--Salary int);

--Insert into EmployeeDemographics VALUES
--(1001, 'Jim', 'Halpert', 30, 'Male'),
--(1002, 'Pam', 'Beasley', 30, 'Female'),
--(1003, 'Dwight', 'Schrute', 29, 'Male'),  -- Inserting values into table 1.
--(1004, 'Angela', 'Martin', 31, 'Female'),
--(1005, 'Toby', 'Flenderson', 32, 'Male'),
--(1006, 'Michael', 'Scott', 35, 'Male'),
--(1007, 'Meredith', 'Palmer', 32, 'Female'),
--(1008, 'Stanley', 'Hudson', 38, 'Male'),
--(1009, 'Kevin', 'Malone', 31, 'Male');

--Insert Into EmployeeSalary VALUES
--(1001, 'Salesman', 45000),
--(1002, 'Receptionist', 36000),
--(1003, 'Salesman', 63000),                    -- Inserting information into table 2.
--(1004, 'Accountant', 47000),
--(1005, 'HR', 50000),
--(1006, 'Regional Manager', 65000),
--(1007, 'Supplier Relations', 41000),
--(1008, 'Salesman', 48000),
--(1009, 'Accountant', 42000);

-------------------------------------------JOIN-----------------------------

--SELECT *
--FROM EmployeeDemographics;

--SELECT *                      -- Each table has EmployeeID. Perfect to join with.
--FROM EmployeeSalary;

--SELECT *
--FROM EmployeeDemographics
--INNER JOIN EmployeeSalary     -- Inner join shows everything that is common between both tables.
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

--SELECT *
--FROM EmployeeDemographics
--FULL OUTER JOIN EmployeeSalary     -- FUll outer join will show everything from both tables even if there's no match.
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

--SELECT *
--FROM EmployeeDemographics
--LEFT OUTER JOIN EmployeeSalary     -- Left outer join will show everything from the left table and everything overlapping, but if only in the right table it will not show.
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

--SELECT *
--FROM SQLTutorial.dbo.EmployeeDemographics
--RIGHT OUTER JOIN SQLTutorial.dbo.EmployeeSalary     -- Right outer join will show everything from the right table and everything overlapping, but if only in the left table it will not show.
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

--SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
--FROM SQLTutorial.dbo.EmployeeDemographics
--INNER JOIN SQLTutorial.dbo.EmployeeSalary     -- Join based on the EmployeeID from the EmployeeDemographics table. 
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

--SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
--FROM SQLTutorial.dbo.EmployeeDemographics
--INNER JOIN SQLTutorial.dbo.EmployeeSalary     -- Finding out the highest paid employee that is not Michael.. 
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE FirstName <> 'Michael'
--ORDER BY Salary DESC;

--SELECT JobTitle, AVG(Salary)
--FROM SQLTutorial.dbo.EmployeeDemographics
--INNER JOIN SQLTutorial.dbo.EmployeeSalary     -- Finding the average salary for a salesman. 
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE JobTitle = 'Salesman'
--GROUP BY JobTitle;

-----------------------------------UNION------------------------------------
--Insert into EmployeeDemographics VALUES
--(1011, 'Ryan', 'Howard', 26, 'Male'),
--(NULL, 'Holly', 'Flax', NULL, NULL),
--(1013, 'Darryl', 'Philbin', NULL, 'Male');

--Create Table WareHouseEmployeeDemographics 
--(EmployeeID int, 
--FirstName varchar(50), 
--LastName varchar(50), 
--Age int, 
--Gender varchar(50)
--);

--Insert into WareHouseEmployeeDemographics VALUES
--(1013, 'Darryl', 'Philbin', NULL, 'Male'),
--(1050, 'Roy', 'Anderson', 31, 'Male'),
--(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
--(1052, 'Val', 'Johnson', 31, 'Female');

--SELECT *
--FROM SQLTutorial.dbo.EmployeeDemographics
--FULL OUTER JOIN SQLTutorial.dbo.WareHouseEmployeeDemographics -- UNION is needed to create a table correctly.
--	ON EmployeeDemographics.EmployeeID = 
--		WareHouseEmployeeDemographics.EmployeeID;

--SELECT *
--FROM SQLTutorial.dbo.EmployeeDemographics
--UNION       -- UNION removes duplicates. These tables are easy to union because they are basically the same.
--SELECT *
--FROM SQLTutorial.dbo.WareHouseEmployeeDemographics;

--SELECT *
--FROM SQLTutorial.dbo.EmployeeDemographics
--UNION ALL     -- UNION ALL keeps duplicates.
--SELECT *
--FROM SQLTutorial.dbo.WareHouseEmployeeDemographics;

--SELECT EmployeeID, FirstName, Age
--FROM SQLTutorial.dbo.EmployeeDemographics
--UNION     -- UNION stills works with different tables because the data types are the same. Incorrect table though. Make sure data selected is the same.
--SELECT EmployeeID, JobTitle, Salary
--FROM SQLTutorial.dbo.EmployeeSalary
--ORDER BY EmployeeID;

-----------------------------CASE--------------------------------------------

--SELECT FirstName, LastName, Age,
--CASE
--	WHEN Age > 30 THEN 'Old'
--	WHEN Age BETWEEN 27 AND 30 THEN 'Young'  -- First condition that is met is used.
--	ELSE 'Baby'
--END
--FROM SQLTutorial.dbo.EmployeeDemographics
--WHERE Age IS NOT NULL
--ORDER BY Age;

--SELECT FirstName, LastName, JobTitle, Salary,
--CASE
--	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
--	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
--	WHEN JobTitle = 'HR' THEN Salary + (Salary * .000001)
--	ELSE Salary + (Salary * 0.03)
--END AS SalaryAfterRaise                  -- Calculations done based on case statement. Very convenient.
--FROM SQLTutorial.dbo.EmployeeDemographics
--JOIN SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

------------------------HAVING---------------------------------------------

--SELECT JobTitle, AVG(Salary)
--FROM SQLTutorial.dbo.EmployeeDemographics
--JOIN SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--GROUP BY JobTitle 
--HAVING AVG(Salary) > 45000 
--ORDER BY AVG(Salary);

-------------------------Advanced-------------------------------------------

-------------------------Temp Tables---------------------------------------

--CREATE TABLE #temp_Employee (    -- # sign is the only difference between a regular table.
--Employee int,
--JobTitle varchar(100),
--Salary int
--)

--SELECT *
--FROM #temp_Employee

--INSERT INTO #temp_Employee VALUES (
--'1001', 'HR', '45000'                -- Can insert manually.
--)

--INSERT INTO #temp_Employee        -- Or can insert based on a select statement. Much more useful.
--Select *
--FROM SQLTutorial.dbo.EmployeeSalary

-------------- Creating temp table for easier processing -------------

--DROP TABLE IF EXISTS #Temp_Employee2   -- Allows the statement to be run over and over. Great for when you need to use repeat processes.
--CREATE TABLE #Temp_Employee2 (
--JobTitle varchar(50),
--EmployeesPerJob int,
--AvgAge int,
--AvgSalary int)

--INSERT INTO #Temp_Employee2                             -- Temp table can allow you to further query this table without having to make the join everytime. 
--SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
--FROM SQLTutorial.dbo.EmployeeDemographics emp
--JOIN SQLTutorial.dbo.EmployeeSalary sal
--	ON emp.EmployeeID = sal.EmployeeID
--GROUP BY JobTitle

--SELECT *
--FROM #Temp_Employee2

--------------- String Functions:TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower ---------------

--CREATE TABLE EmployeeErrors (
--EmployeeID varchar(50)
--,FirstName varchar(50)
--,LastName varchar(50)
--);

--Insert into EmployeeErrors Values 
--('1001  ', 'Jimbo', 'Halbert')
--,('  1002', 'Pamela', 'Beasely')
--,('1005', 'TOby', 'Flenderson - Fired');

--SELECT *
--FROM EmployeeErrors;

----------- Using TRIM, LTRIM, RTRIM.

--SELECT EmployeeID, TRIM(EmployeeID) AS IDTRIM  -- Trims from all sides.
--FROM EmployeeErrors;

--SELECT EmployeeID, LTRIM(EmployeeID) AS IDTRIM  -- Trims only the left.
--FROM EmployeeErrors;

--SELECT EmployeeID, RTRIM(EmployeeID) AS IDTRIM  -- Trims only the right.
--FROM EmployeeErrors;

----------- Using Replace.

--SELECT LastName, REPLACE(LastName, '- Fired', '') AS LastNameFixed
--FROM EmployeeErrors;

---------- Using Substring.

--SELECT SUBSTRING(FirstName,1,3)
--FROM EmployeeErrors;

--SELECT SUBSTRING(err.FirstName,1,3), SUBSTRING(dem.FirstName,1,3)
--FROM EmployeeErrors err               -- Fuzzy match.
--JOIN EmployeeDemographics dem
--	ON SUBSTRING(err.FirstName,1,3) = SUBSTRING(dem.FirstName,1,3);

---------- Using Upper and lower.

--SELECT FirstName, LOWER(FirstName)  -- Makes all characters lower case.
--FROM EmployeeErrors;

--SELECT FirstName, UPPER(FirstName) -- Makes all characters upper case.
--FROM EmployeeErrors;

-----------------------------------Stored Procedures---------------------------

--CREATE PROCEDURE TEST
--AS                      -- Storing a select statement as 'TEST' procedure.
--SELECT *
--FROM EmployeeDemographics;

--EXEC TEST               -- Executing the stored procedure (the select statement).

--CREATE PROCEDURE Temp_Employee2 
--@JobTitle nvarchar(100)
--AS
--DROP TABLE IF EXISTS #temp_employee3
--Create table #temp_employee3 (
--JobTitle varchar(100),
--EmployeesPerJob int ,
--AvgAge int,
--AvgSalary int
--)


--Insert into #temp_employee3
--SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
--FROM SQLTutorial..EmployeeDemographics emp
--JOIN SQLTutorial..EmployeeSalary sal
--	ON emp.EmployeeID = sal.EmployeeID
--where JobTitle = @JobTitle --- make sure to change this in this script from original above
--group by JobTitle

--Select * 
--From #temp_employee3
--GO;

--exec Temp_Employee2 @jobtitle = 'Salesman'  -- jobtitle parameter is added to stored procedure.

-------------------------------Sub-Queries-----------------------------------------

--SELECT *
--FROM EmployeeSalary;

---------- Subquery in select.

--SELECT EmployeeID, Salary, (SELECT AVG(Salary) FROM EmployeeSalary) AS AllAvgSalary
--FROM EmployeeSalary;   -- Subquery works where group by will not.

---------- Subquery in WHERE.

--SELECT EmployeeID, JobTitle, Salary
--FROM EmployeeSalary
--WHERE EmployeeID IN (
--		SELECT EmployeeID
--		FROM EmployeeDemographics
--		WHERE Age > 30);