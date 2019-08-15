SELECT *
FROM "Employees";

CREATE VIEW Emp_Salaries AS
SELECT "Employees"."emp_no", "Employees"."last_name", "Employees"."first_name", "Employees"."gender", "Salaries"."salary"
FROM "Employees"
INNER JOIN "Salaries" ON
"Salaries"."emp_no" = "Employees"."emp_no";

CREATE VIEW Eighty_Six_Hires AS
SELECT "Employees"."emp_no", "Employees"."last_name", "Employees"."hire_date"
FROM "Employees"
WHERE EXTRACT(year FROM "hire_date") = 1986;

CREATE VIEW Dept_Emp_Detail AS
SELECT "Dept"."dept_no", "Dept"."dept_name", "Dept_Emp"."emp_no", "Employees"."last_name", "Employees"."first_name", "Dept_Emp"."from_date","Dept_Emp"."to_date"
FROM "Dept"
INNER JOIN "Dept_Emp" ON
"Dept_Emp"."dept_no" = "Dept"."dept_no"
INNER JOIN "Employees" ON
"Employees"."emp_no" = "Dept_Emp"."emp_no";

CREATE VIEW Mgr_Detail AS
SELECT Dept_Emp_Detail.dept_name,Dept_Emp_Detail.emp_no,Dept_Emp_Detail.last_name,Dept_Emp_Detail.first_name, Dept_Emp_Detail.from_date, Dept_Emp_Detail.to_date
FROM "Dept_Mgr"
LEFT JOIN Dept_Emp_Detail ON
Dept_Emp_Detail.emp_no = "Dept_Mgr"."emp_no";

CREATE VIEW Hercules_B_Emps AS
SELECT Dept_Emp_Detail.emp_no, Dept_Emp_Detail.first_name, Dept_Emp_Detail.last_name
FROM Dept_Emp_Detail
WHERE first_name= 'Hercules' AND last_name LIKE 'B%';

CREATE VIEW Sales_Team AS
SELECT Dept_Emp_Detail.emp_no, Dept_Emp_Detail.last_name, Dept_Emp_Detail.first_name, Dept_Emp_Detail.dept_name
FROM Dept_Emp_Detail
WHERE dept_name= 'Sales';

CREATE VIEW Sales_and_Dev_Teams AS
SELECT Dept_Emp_Detail.emp_no, Dept_Emp_Detail.last_name, Dept_Emp_Detail.first_name, Dept_Emp_Detail.dept_name
FROM Dept_Emp_Detail
WHERE dept_name= 'Sales' OR dept_name= 'Development';

CREATE VIEW Last_name_frequency AS
SELECT last_name, COUNT(last_name) AS "Last_Name_Count"
FROM Dept_Emp_Detail
GROUP BY last_name
ORDER BY last_name DESC