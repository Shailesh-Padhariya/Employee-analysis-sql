

select * from employees where emp_id in(select manager_id from employees);

select emp_id, emp_name, job_name, hire_date, floor(datediff(curdate(), hire_date)/365) as "experience" from employees where emp_id in(select manager_id from employees);

select e.emp_id, e.emp_name, e.salary, e.job_name, d.dep_name, d.dep_location , floor(datediff(curdate(), e.hire_date)/365) as experience
from employees e join department d on e.dep_id = d.dep_id where job_name in("MANAGER", "Analyst") and d.dep_location in("sydney" , "perth") 
and floor(datediff(curdate(), e.hire_date)/365) > 5 and e.commission is null order by d.dep_location asc;

select e.emp_id, e.emp_name, e.job_name, e.salary, d.dep_name, d.dep_location , e.dep_id , 12* e.salary as "annual_salary"
from employees e join department d on e.dep_id = d.dep_id 
where (d.dep_location = "sydney" or d.dep_name = "finance") and  emp_id in (select emp_id from employees e where  (12 * e.salary > 28000) and e.salary not in ("3000", "2800") and job_name not in( "'MANAGER'") 
and (e.emp_id like "__3%" or e.emp_id like "__7%")) order by e.dep_id asc, e.job_name desc;

select e.*, s.grade from employees e join salary_grade s on e.salary between s.min_salary and s.max_salary where s.grade in (2, 3);

select e.*, s.grade from employees e join salary_grade s on e.salary between s.min_salary and s.max_salary where s.grade in (4, 5) and e.job_name in ("Analyst", "Manager");

SELECT * FROM employees WHERE salary >
(SELECT salary FROM employees WHERE emp_name = 'JONAS');

SELECT * FROM employees WHERE job_name in (select job_name from employees where emp_name = "frank");

SELECT * FROM employees WHERE hire_date <(SELECT hire_date FROM employees WHERE emp_name = 'ADELYN');

select * from employees where dep_id = 2001 and job_name in (select job_name from employees where dep_id = 1001);

select * from employees where salary in (select salary from employees where emp_name in ("sandrine", "frank")) order by salary desc;

select * from employees where job_name in (select job_name from employees where emp_name = "marker") or salary > (select salary from employees where emp_name = "adelyn");

select * from employees where salary > (select max(salary+commission) from employees where job_name = "salesman");

select e.*, d.dep_location from employees e join department d on e.dep_id = d.dep_id where dep_location in ("perth", "brisbane") and e.hire_date < (select hire_date from employees where emp_name = "blaze");

select e.*, s.grade, d.dep_name, floor(datediff(curdate(), hire_date)/365) as experience from employees e join department d on e.dep_id = d.dep_id 
join salary_grade s on e.salary between s.min_salary and s.max_salary
where s.grade in (3, 4) and d.dep_name in ("Finance", "Audit") and 
salary >  (select salary from employees where emp_name = "adelyn") and
hire_date < (select hire_date from employees where emp_name = "frank")
order by e.hire_date;

select * from employees where job_name in (select job_name from employees where emp_name in ("sandrine", "adelyn"));

select job_name, dep_id from employees where dep_id = 1001 and job_name not in (select job_name from employees where dep_id = 2001);

select emp_name, salary from employees where salary in (select max(salary) from employees);


select * from employees where salary in
(select max(salary) from employees e join department d on e.dep_id = d.dep_id where d.dep_name = "marketing");

select * from employees where hire_date in
(select max(e.hire_date) from employees e join department d on e.dep_id = d.dep_id join salary_grade s on e.salary between s.min_salary and s.max_salary where s.grade = 3 and d.dep_location = "perth");

select e.emp_id, e.emp_name, d.dep_location, e.salary, e.hire_date, s.grade 
from employees e join department d on e.dep_id = d.dep_id join salary_grade s on e.salary between s.min_salary and s.max_salary where s.grade = 3 and d.dep_location = "perth"
order by hire_date desc; 


select * from employees where hire_date < (select max(hire_date) from employees where manager_id in (select emp_id from employees where emp_name = "kayling"));

select * from employees where job_name in (select job_name from employees where hire_date in (select min(hire_date) from employees where year(hire_date) = 1991));

select * from employees where hire_date in 
(select min(hire_date) from employees e join salary_grade s on e.salary between s.min_salary and s.max_salary where s.grade in (4, 5) 
and manager_id in (select emp_id from employees where emp_name = "kayling"));

select sum(salary) from employees where job_name = "manager";

select sum(e.salary) from employees e join salary_grade s on e.salary between s.min_salary and s.max_salary where s.grade = 3;

select * from employees where dep_id = 1001 and salary > (select avg(salary) from employees where dep_id = 2001);

select d.dep_id, d.dep_name, count(e.emp_id) from department d join employees e on d.dep_id = e.dep_id group by d.dep_id
having count(e.emp_id) = (select max(emp_count) from (select count(emp_id) as emp_count from employees group by dep_id) as dept_count);

select * from employees where manager_id in (select emp_id from employees where emp_name = "jonas");

select * from employees where dep_id not in (select dep_id from department where dep_name = "marketing");

select e.emp_name, e.job_name , d.dep_name from employees e join department d on e.dep_id= d.dep_id where e.job_name = "manager";

SELECT e.emp_name, e.dep_id, e.salary FROM employees e WHERE e.salary IN (SELECT max(salary) FROM employees GROUP BY dep_id) ;

select * from employees where salary >= (select round((max(salary) + min(salary))/2, 2) from employees);

select *, floor(datediff(curdate(), hire_date)/365) as experience from employees where job_name = "salesman" and floor(datediff(curdate(), hire_date)/365) > 10;

SELECT e.* FROM employees e
JOIN employees m ON e.manager_id = m.emp_id
where e.salary < m.salary and e.salary > ANY (
SELECT salary
FROM employees
WHERE emp_id IN (
SELECT manager_id
FROM employees));

select e.emp_name, d.avg_salary as average_dep_salary, e.salary as emp_salary from employees e 
join (select round(avg(salary),2) as avg_salary, dep_id from employees  group by dep_id) d on e.dep_id = d.dep_id;

SELECT * FROM employees ORDER BY salary LIMIT 5;


select * from employees where manager_id not in (select emp_id from employees where job_name = "president");

SELECT emp_name, salary, commission, (salary + COALESCE(commission, 0)) AS netpay
FROM employees
ORDER BY netpay DESC
LIMIT 1;

select dep_name from department where length(dep_name) in (select count(emp_id) from employees  group by dep_id);

select dep_name from department where dep_id in (select max(dep_id) from employees);

select * from employees where hire_date in (select hire_date from employees  group by hire_date having count(emp_id) > 1);

select d.dep_name from department d join employees e on e.dep_id = d.dep_id group by e.dep_id having count(e.dep_id) > 
(select avg(my_count)  from (select (count(emp_id)) as my_count from employees group by dep_id) as avg_count);


select m.emp_name, count(*) from employees e join employees m on e.manager_id = m.emp_id group by m.emp_name having count(*) =
(select max(my_count) from (select count(emp_id) as my_count from employees group by manager_id) as max_employee);
	
select m.* from employees m where salary < any (select e.salary from employees e where e.manager_id = m.emp_id);

select * from employees where manager_id in (select emp_id from employees where emp_name = "blaze");

select * from employees where emp_id in (select manager_id from employees);

(select manager_id from employees where emp_name = "Jonas");

select * from employees where manager_id in (select emp_id from employees where emp_name = "jonas") or emp_id in (select manager_id from employees where emp_name = "Jonas") ;

select * from employees where salary in (select min(salary) from employees group by dep_id) order by salary asc;

select * from employees  where hire_date in (select max(hire_date) from employees group by dep_id) order by hire_date;

select * from employees e where hire_date < (select max(hire_date) from employees where dep_id = e.dep_id) order by hire_date;

SELECT emp_name, salary, dep_id  FROM employees e  WHERE salary > (SELECT AVG(salary)  FROM employees WHERE dep_id = e.dep_id) order by dep_id asc;

select * from employees where commission is not null order by salary desc limit 1;

select * from employees where dep_id != 1001 and (job_name, salary) in (select job_name, salary from employees where dep_id = 3001);

select dep_id, emp_name, job_name , salary, (salary+commission) as net_salary
from employees where job_name = "salesman" and (salary+commission) in (select max(salary + commission) from employees where commission is not null);

SELECT dep_id, emp_name, salary, job_name, salary+commission "Net Salary"
FROM employees e
WHERE 2-1 = (
  SELECT count(distinct c.salary+c.commission)
  FROM employees c WHERE c.salary+c.commission>e.salary+e.commission);

select emp_name, dep_id, hire_date from employees e where 2-1 = 
(select count(c.hire_date) from employees c where c.hire_date > e.hire_date);

select * from employees where salary < (select avg(salary) from employees group by dep_id order by avg(salary) limit 1) order by salary;

SELECT * FROM department ;

select * from employees where dep_id in (select dep_id from department where dep_location = "perth");

select * from employees where emp_id in 
(select e.emp_id from  salary_grade s join employees e on e.salary between s.min_salary and s.max_salary where s.grade in (2,3))
 and dep_id in (select dep_id from department where dep_location = "perth");
 
select * from employees where job_name in (select job_name from employees where emp_name = "Adelyn") or salary > (select salary from employees where emp_name = "wade");
 
SELECT * FROM employees WHERE dep_id = 1001 AND salary > (SELECT salary FROM employees WHERE emp_name = 'ADELYN');

select * from employees where hire_date < (select hire_date from employees where emp_name = "kayling") and  hire_date > (select hire_date from employees where emp_name = "sandrine");

select e.emp_name, e.emp_id, e.salary, e.dep_id ,d.dep_location, d.dep_name 
from employees e join department d on e.dep_id = d.dep_id where e.dep_id in (select dep_id from employees where emp_name = "kayling");


select e.* from employees e join department d on e.dep_id = d.dep_id join salary_grade s on e.salary between s.min_salary and s.max_salary  where s.grade in 
(select s.grade from salary_grade s join employees e on e.salary between s.min_salary and s.max_salary where e.emp_name = "tucker") 
or e.hire_date < (select hire_date from employees where emp_name = "sandrine") and dep_location in ("sydeny" , "perth");

select e.* from employees e 
join employees m where e.salary = m.salary and e.emp_id <> m.emp_id;

select *, (salary+commission) as net_salary from employees where job_name = "salesman" and dep_id in (select dep_id from department where dep_name = "marketing");

select * from employees where dep_id = 3001 order by hire_date desc limit 1;

select * from employees where salary in (select max(e.salary) from employees e join department d on e.dep_id = d.dep_id where d.dep_location = "perth") and hire_date < 
(select max(e.hire_date) from employees e join salary_grade s on e.salary between s.min_salary and s.max_salary where s.grade = 2); 

select * from employees where manager_id in (select emp_id from employees where emp_name = "kayling") order by salary desc limit 1;

select emp_name, salary, commission, (salary+commission) as net_pay from employees where commission is not null order by net_pay desc limit 1; 

select e.* from employees e join employees m on e.manager_id = m.emp_id where e.salary > m.salary; 

select job_name, avg(salary) from employees where job_name <> "president" group by job_name ;

SELECT count(*) FROM employees WHERE emp_id IN (SELECT manager_id FROM employees);

select * from department where dep_id not in (select distinct dep_id from employees);












 
 


 































