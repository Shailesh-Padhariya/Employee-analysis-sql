
create table department ( 
dep_id Int,  
dep_name varchar(14),  
dep_location varchar(15),  
constraint pk_department_dep_id  primary key (dep_id)  
);

create table employees(  
emp_id Integer,  
emp_name varchar(15),  
job_name varchar(10),  
manager_id Integer ,  
hire_date date,  
salary decimal (10,2),  
commission decimal (7,2),  
dep_id Int,  
constraint pk_employees_emp_id  primary key (emp_id),  
constraint fk_employees_dep_id foreign key (dep_id ) references department (dep_id)  
); 

create table salary_grade(  
grade Integer  ,  
min_salary integer,  
max_salary integer
);


insert into department values (1001,'FINANCE', 'SYDNEY');
insert into department values (2001,'AUDIT', 'MELBOURNE');
insert into department values (3001,'MARKETING', 'PERTH');
insert into department values (4001,'PRODUCTION', 'BRISBANE');


insert into employees values (68319, 'KAYLING', 'PRESIDENT',NULL,'1991-11-18', 6000,NULL,1001);
insert into employees values (66928, 'BLAZE', 'MANAGER',68319,'1991-05-01', 2750,NULL,3001);
insert into employees values (67832, 'CLARE', 'MANAGER',68319,'1991-06-09', 2550,NULL,1001);
insert into employees values (65646, 'JONAS', 'MANAGER',68319,'1991-04-02', 2957,NULL,2001);
insert into employees values (64989, 'ADELYN', 'SALESMAN',66928,'1991-02-20', 1700,400,3001);
insert into employees values (65271, 'WADE', 'SALESMAN',66928,'1991-02-22', 1350,600,3001);
insert into employees values (66564, 'MADDEN', 'SALESMAN',66928,'1991-09-28', 1350,1500,3001);
insert into employees values (68454, 'TUCKER', 'SALESMAN',66928,'1991-09-08', 1600,0,3001);
insert into employees values (68736, 'ADNRES', 'CLERK',67858,'1997-05-23', 1200,NULL,2001);
insert into employees values (69000, 'JULIUS', 'CLERK',66928,'1991-12-03', 1050,NULL,3001);
insert into employees values (69324, 'MARKER', 'CLERK',67832,'1992-01-23', 1400,NULL,1001);
insert into employees values (67858, 'SCARLET', 'ANALYST',65646,'1997-04-19', 3100,NULL,2001);
insert into employees values (69062, 'FRANK', 'ANALYST',65646,'1991-12-03', 3100,NULL,2001);
insert into employees values (63679, 'SANDRINE', 'CLERK',69062,'1990-12-18', 900,NULL,2001);

insert into salary_grade values (1,800,1300);
insert into salary_grade values (2,1301,1500);
insert into salary_grade values (3,1501,2100);
insert into salary_grade values (4,2101,3100);
insert into salary_grade values (5,3101,9999);

