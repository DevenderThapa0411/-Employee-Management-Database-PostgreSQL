CREATE TABLE employees(
	employee_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	department VARCHAR(50),
	salary DECIMAL(10,2)CHECK(salary>0),
	joining_date DATE NOT NULL,
	age INT CHECK(age>=18)
);
DROP TABLE employees;

INSERT INTO employees(first_name,last_name,department,salary,joining_date,age)
VALUES 
('amit','sharma','IT',60000.00,'2022-05-01',29),
('neha','patel','HR',55000.00,'2021-08-15',32),
('ravi','kumar','finance',70000.00,'2020-03-10',35),
('anjali','verma','IT',65000.00,'2019-11-22',28),
('suresh','reddy','Operations',50000.00,'2023-01-10',26);

SELECT*FROM employees;

--1) retrieve all employees first_name and their department
  	SELECT first_name, department FROM employees;
	  
--2) update the salary of all employee in the IT department by increasing it by 10%
    UPDATE employees
	SET salary = salary + (salary*0.1)
	WHERE department='IT';
	
--3) delete all employees who are older than 34 years 
 	DELETE FROM employees
	WHERE age >34;
	
--4) add a new column email to the employee table
	ALTER TABLE employees
	ADD COLUMN email VARCHAR(100);
	
--5) rename the department column to dept_name 
	ALTER TABLE employees
	RENAME COLUMN department TO dept_name;
	
--6) retrieve the names of employees who joined after january 1,2021
    SELECT first_name,last_name FROM employees
	WHERE joining_date> '2021-01-01';
	
--7) change the data type of the salary cclumn to INTEGER
	ALTER TABLE employees
	ALTER COLUMN salary TYPE INTEGER USING salary::INTEGER;
	
--8) list all employees with their age and salary in descending order of salary 
	SELECT first_name,last_name ,age, salary FROM employees
	ORDER BY salary DESC;
	
--9) insert a new employee with the following details ('raj','singh','marketing',60000,'2023-09-15',30)
	INSERT INTO employees(first_name,last_name,dept_name,salary,joining_date,age)
	VALUES 
	 ('raj','singh','marketing',60000,'2023-09-15',30);   --here email not mentioned jabki we update new column ;it works cause we didn't mentioned constraints in 4th query
--10)update age of employee +1 to every employee
    UPDATE employees
	SET age=age+1;
	
	