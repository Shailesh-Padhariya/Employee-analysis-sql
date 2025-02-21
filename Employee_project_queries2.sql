
select * from employees;

select emp_name, salary from employees;

select distinct(job_name) from employees;

select emp_name, concat("$", round(1.15 * salary, 2)) as updated_salary from employees;

select concat(emp_name, " : ", job_name) as employee_and_job from employees;   

select concat(emp_name, " ( ", lower(job_name)," )") as employee_and_job from employees;  

SELECT DATE_FORMAT(hire_date, '%M %D, %Y') as hire_date
FROM employees;

select emp_name, length(trim(emp_name)) from employees;

select emp_id, emp_name, salary, commission from employees;

select distinct(dep_id), job_name from employees;

select * from employees where dep_id not in (2001);

SELECT * FROM employees WHERE hire_date < ("1991-01-01");

select round(avg(salary),2) as average_salary, job_name from employees where job_name = "Analyst";

SELECT * FROM employees WHERE emp_name = "BLAZE";

select * from employees where commission > salary;

select * from employees where (1.25 * salary) > 3000;

SELECT emp_name FROM employees WHERE length(emp_name)=6;

select * from employees where month(hire_date) = 01;

SELECT concat(e.emp_name,  " works for ", m.emp_name)
FROM employees e left join employees m on m.emp_id = e.manager_id;

select * from employees where job_name = "clerk";

SELECT * FROM employees WHERE datediff(curdate(), hire_date) > 27;

SELECT * FROM employees WHERE salary <3500;

SELECT emp_name, job_name, salary FROM employees WHERE job_name = 'ANALYST';

select * from employees where year(hire_date) = 1991;

SELECT emp_id, emp_name, hire_date, salary FROM employees 
WHERE hire_date <'1991-04-01';

select emp_name, job_name from employees where manager_id is null;

select * from employees where hire_date = "1991-05-01";

select emp_id, emp_name, salary, floor(datediff(curdate(), hire_date)/365) as experience from employees where manager_id = 68319;

SELECT emp_id, emp_name, salary, TIMESTAMPDIFF(year, hire_date, CURDATE()) AS experience FROM employees WHERE (salary/30) > 100;

SELECT emp_name, hire_date FROM employees WHERE Date_add(hire_date, interval 96 month) > '1999-12-31';

select * from employees where salary%2 = 1;

select * from employees where salary < 1000;

select * from employees where month(hire_date) = "04";

select * from employees where day(hire_date) < "19";

select * from employees where job_name = "salesman" and datediff(curdate(), hire_date) > 10;

SELECT * FROM employees WHERE year(hire_date) = "1991" AND (dep_id =3001 OR dep_id =1001);

SELECT * FROM employees WHERE dep_id=1001 OR dep_id=2001;

SELECT * FROM employees WHERE job_name ='CLERK' AND dep_id = 2001;

select emp_id, emp_name, salary, commission, job_name from employees where salary > commission and dep_id = 3001 and (12 * (salary + commission) < 34000);

select * from employees where job_name in ("clerk", "manager");

select * from employees where month(hire_date) <> 2;

select * from employees where year(hire_date) = 1991;

select * from employees where year(hire_date) = 1991 and month(hire_date) = "06";

SELECT * FROM employees WHERE 12*salary BETWEEN 24000 AND 50000;

select * from employees where hire_date in ("1991-05-01", "1991-02-20", "1991-12-03");

SELECT * FROM employees WHERE manager_id IN (63679, 68319, 65646, 69000);

SELECT * FROM employees WHERE hire_date > '1992-07-01';

SELECT * FROM employees WHERE year(hire_date) BETWEEN '1990' AND '1999';

SELECT * FROM employees WHERE job_name = 'MANAGER'AND dep_id in ( "1001", "2001");

select * from employees where month(hire_date) = "2" and salary between "1001" and "2001";

select * from employees where year(hire_date) <> "1991";

select e.*, d.dep_name from employees e join department d on e.dep_id = d.dep_id;


select 
e.emp_name,
e.job_name,
12* e.salary as "annual salary",
e.dep_id,
d.dep_name,
s.grade
from employees e
join department d on e.dep_id = d.dep_id
join salary_grade s on e.salary between s.min_salary and max_salary
where 12 * e.salary > "60000" or e.job_name <> "analyst";


select e.emp_id, e.emp_name, e.job_name, e.manager_id, e.salary, m.emp_name as manager, m.salary as manager_salary from employees e left join employees m on m.emp_id = e.manager_id
where e.salary > m.salary;
	
select e.emp_name, d.dep_name, e.salary, e.commission, d.dep_location from employees e join department d on e.dep_id = d.dep_id where d.dep_location = "perth" and e.salary between 2000 and 5000;

select s.grade, e.emp_name, e.dep_id from employees e join salary_grade s on e.salary between s.min_salary and s.max_salary where e.dep_id in ("1001" , "3001") and s.grade <> "4";

select e.*, m.emp_name as manager_name from employees e join employees m on m.emp_id = e.manager_id where m.emp_name = 'jonas';

select e.emp_name, e.salary, s.grade from employees e join salary_grade s on e.salary between s.min_salary and s.max_salary where e.emp_name = "Frank";

SELECT * FROM employees WHERE job_name IN ('MANAGER','ANALYST') AND salary BETWEEN 2000 AND 5000 AND commission IS NULL;

select e.emp_id, e.emp_name, e.salary, d.dep_location, floor(datediff(curdate(), hire_date)/365)  as experince 
from employees e join department d on e.dep_id = d.dep_id where  d.dep_location in ("perth", "melbourne") and datediff(curdate(), hire_date)/365 > 10;

select e.emp_id, e.emp_name, e.salary, d.dep_id, d.dep_location from employees e join department d on e.dep_id = d.dep_id where d.dep_location in ("perth", "melbourne") and e.salary between "2000" and "5000";

select e.emp_id, e.emp_name, e.dep_id, d.dep_name, d.dep_location, s.grade
from employees e join department d on  e.dep_id = d.dep_id
join salary_grade s on e.salary between s.min_salary and s.max_salary
where floor(datediff(curdate(), hire_date)) > 5 and s.grade in ("3", "4", "5") and d.dep_name = "marketing" ;

select e.*, m.emp_name as manager from employees e left join employees m on m.emp_id = e.manager_id  where e.hire_date < m.hire_date;

select e.*, s.grade from employees e join salary_grade s on e.salary between s.min_salary and s.max_salary where s.grade = "4";

select e.*, d.dep_name from employees e join department d on e.dep_id = d.dep_id where d.dep_name in ("Audit", "production") and e.emp_name not in ("marker", "Adelyn:") and e.hire_date > "1991-01-01";

SELECT *  FROM employees ORDER BY salary ASC;

SELECT * FROM employees ORDER BY dep_id ASC, job_name DESC;

SELECT DISTINCT(job_name) FROM employees ORDER BY job_name DESC;

select emp_id, emp_name, salary as monthly_salary, round(salary/30, 2) as daily_salary, 12* salary as annual_salary from employees order by annual_salary asc; 

SELECT * FROM employees WHERE job_name='CLERK' OR job_name='ANALYST' ORDER BY job_name DESC;

select e.emp_name, d.dep_location, d.dep_name from employees e join department d on e.dep_id = d.dep_id where e.emp_name = "clare";

SELECT * fROM employees WHERE hire_date IN ('1991-5-01','1991-12-03','1990-01-19') ORDER BY hire_date ASC;

SELECT * FROM employees WHERE salary < 1000 ORDER BY salary;

SELECT * FROM employees ORDER BY salary ASC;

SELECT * FROM employees  ORDER BY job_name ASC, emp_id DESC ;

SELECT DISTINCT(job_name) FROM employees WHERE dep_id IN (2001,3001) oRDER BY job_name DESC;

SELECT * FROM employees WHERE job_name NOT IN ('PRESIDENT', 'MANAGER') ORDER BY salary ASC;

SELECT * FROM employees WHERE (12*salary) < 25000 ORDER BY salary ASC;

select emp_id, emp_name, job_name, 12* salary as annual_salary, round(salary/30 , 2 )as daily_salary from employees where job_name = "salesman";

select emp_id, emp_name, hire_date, curdate(), floor(datediff(curdate(), hire_date)/365) as experience from employees order by experience; 

SELECT * FROM employees WHERE hire_date>('1991-6-30') AND year(hire_date)=1991 ORDER BY job_name ASC;

select e.*, d.dep_name, d.dep_location from employees e join department d on e.dep_id = d.dep_id where d.dep_name in ("audit", "finance") order by dep_id asc;















































