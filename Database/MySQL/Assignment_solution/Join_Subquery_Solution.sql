use humanresource;

-- 1.    Write a query to find the name (first_name, last_name) and the salary of the employees who have a higher salary than the employee whose last_name='Bull'.
SELECT * FROM humanresource.employees;
select concat(first_name,' ',last_name)as name, salary from employees  where salary > (select salary from employees where last_name='Bull');

-- 2.    Write a query to find the name (first_name, last_name) of all employees who works in the IT department.
select concat(first_name,' ',last_name) as name from employees where department_id in (select department_id from departments where department_name ='IT');

-- 3.    Write a query to find the name (first_name, last_name) of the employees who have a manager and worked in a USA based department.
select concat(first_name,' ',last_name) as name from employees  where manager_id in (select employee_id from employees where department_id
in (select department_id from departments where location_id in (select location_id from locations where country_id='US')));

-- 4.    Write a query to find the name (first_name, last_name) of the employees who are managers. 
select concat(first_name,' ',last_name) as name from employees where (employee_id in (select manager_id from employees));

-- 5.    Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary.
select concat(first_name,' ',last_name) as name , salary from employees where salary > (select avg(salary) from employees);

-- 6.    Write a query to find the name (first_name, last_name), and salary of the employees whose salary is equal to the minimum salary for their job grade.
select concat(first_name,' ',last_name) as name , salary from employees where employees.salary = (select min_salary from jobs where employees.job_id = jobs.job_id);
 
-- 7.    Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the average salary and works in any of the IT departments.

select concat(first_name,' ',last_name) as name, salary from employees where department_id in (select department_id from departments where department_id in(60,210,230)) 
and salary > (select avg(salary) from employees);

select concat(first_name,' ',last_name) as name, salary from employees where department_id in (select department_id from departments where department_name like 'IT%') 
and salary > (select avg(salary) from employees);

-- 8.    Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the earning of Mr. Bell.
select concat(first_name,' ',last_name) as name, salary from employees where salary > (select salary from employees where last_name = 'Bell');

-- 9.    Write a query to find the name (first_name, last_name), and salary of the employees who earn the same salary as the minimum salary for all departments.
select concat(first_name,' ',last_name) as name, salary from employees where salary = (select min(salary) from employees);

-- 10.          Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary of all departments.

select concat(first_name,' ',last_name) as name, salary from employees where salary > all(select avg(salary) from employees group by department_id);

-- 11.          Write a query to find the name (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results of the salary of the lowest to highest.

select concat(first_name,' ',last_name) as name , salary from employees where salary > all(select salary from employees where job_id like '%clerk') order by salary;

-- 12.           Write a query to find the name (first_name, last_name) of the employees who are not supervisors.

select b.first_name,b.last_name from employees b where not exists (select * from employees a where a.manager_id = b.employee_id);

-- 13.          Write a query to display the employee ID, first name, last name, and department names of all employees.

select e.employee_id, e.first_name, e.last_name, d.department_name from employees e left join departments d on e.department_id = d.department_id order by e.employee_id ;

select employee_id, first_name, last_name, (select department_name from departments d where e.department_id = d.department_id) as department_name from employees e order by employee_id;

-- 14.          Write a query to display the employee ID, first name, last name, salary of all employees whose salary is above average for their departments.

select employee_id, first_name, last_name, salary from employees as A where salary > (select avg(salary) from employees where department_id=A.department_id) ;


-- 15.          Write a query to fetch even numbered records from employees table.

create index ed on employees(employee_id);


select * from employees ;

SET @i = 0; 

SELECT i, employee_id
FROM (SELECT @i := @i + 1 AS i, employee_id FROM employees ) a 
WHERE  MOD(a.i, 2) = 0  ;


-- 16.          Write a query to find the 5th maximum salary in the employees table.
SELECT DISTINCT Salary FROM employees ORDER BY Salary desc LIMIT 1 OFFSET 4;
select distinct salary from employees e1 where 5 = (select count(distinct salary) from employees  e2 where e2.salary >= e1.salary);

-- 17.          Write a query to find the 4th minimum salary in the employees table

SELECT DISTINCT Salary FROM employees ORDER BY Salary LIMIT 1 OFFSET 3;
select distinct salary from employees e1 where 4 = (select count(distinct salary) from employees  e2 where e2.salary <= e1.salary);

-- 18.          Write a query to select last 10 records from a table.

select * from employees order by employee_id desc limit 10;

-- 19.          Write a query to list the department ID and name of all the departments where no employee is working.

select d.department_id, d.department_name from departments d left join employees e on d.department_id = e.department_id where e.employee_id is null;

-- 20.          Write a query to get 3 maximum salaries.

select distinct salary from employees ORDER BY salary desc limit 3;

-- 21.          Write a query to get 3 minimum salaries.

select distinct salary from employees ORDER BY salary limit 3;

-- 22.          Write a query to get nth maximum salaries of employees.

-- join

-- 1.    Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.

select l.location_id, l.street_address, l.city, l.state_province, c.country_name
from locations l
inner join countries c on l.country_id=c.country_id;  


-- 2.    Write a query to find the name (first_name, last name), department ID and name of all the employees.
SELECT e.first_name, e.last_name, d.department_id 
from employees e
join departments d on e.department_id=d.department_id;

-- 3.    Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.

select e.first_name, e.last_name, j.job_title, d.department_id
from employees e
join departments d on d.department_id = e.department_id
join jobs j on j.job_id = e.job_id
join locations l on d.location_id = l.location_id
where city = "LONDON";

-- 4.    Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).

select e.employee_id, e.last_name, emp.employee_id, emp.last_name
from employees e
join employees emp on emp.employee_id=e.manager_id;


-- 5.    Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones.
select first_name, last_name, hire_date from employees where hire_date > all(select hire_date from employees where last_name = "Jones");

SELECT e.first_name, e.last_name, e.hire_date 
FROM employees e 
JOIN employees emp 
ON (emp.last_name = 'Jones') 
WHERE emp.hire_date < e.hire_date;

-- 6.    Write a query to get the department name and number of employees in the department.

SELECT d.department_name, count(e.employee_id)
from departments d
join employees e on d.department_id=e.department_id
group by d.department_name;


-- 7.    Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90.

SELECT jd.employee_id, j.job_title, end_date-start_date as days 
FROM job_history jd
inner JOIN jobs j
on j.job_id=jd.job_id
WHERE department_id=90;


-- 8.    Write a query to display the department ID and name and first name of manager. 

select d.department_id, d.department_name, e.manager_id
from departments d
join employees e on d.department_id=e.department_id;


SELECT d.department_id, d.department_name, d.manager_id, e.first_name 
FROM departments d 
INNER JOIN employees e 
ON (d.manager_id = e.employee_id);



-- 9.    Write a query to display the department name, manager name, and city.








-- 10.        Write a query to display the job title and average salary of employees.





-- 11.        Write a query to display job title, employee name, and the difference between salary of the employee and minimum salary for the job.






-- 12.        Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary.






-- 13.        Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.




