1>
SELECT JOB_TITLE, JOB_ID, MIN_SALARY from JOBS;
SELECT '직업:',job_title,',',job_id,',',min_salary from JOBS;
select job_title as 직업명, JOB_ID as 직업코드, min_salary as 최소급여 from JOBS;
2>
select employee_id,SALARY from EMPLOYEES where SALARY>= 9000;
select employee_id,SALARY from EMPLOYEES where SALARY>= 9000 and EMPLOYEE_ID>=200;
select employee_id,SALARY from EMPLOYEES where SALARY>= 15000 or EMPLOYEE_ID>=200;
3>
select employee_id,SALARY, MANAGER_ID from EMPLOYEES where MANAGER_ID = '';
select employee_id,SALARY, MANAGER_ID from EMPLOYEES where MANAGER_ID is null;
select employee_id,SALARY, MANAGER_ID from EMPLOYEES where MANAGER_ID in ('100','110','120');
4>
select EMPLOYEE_ID,SALARY from EMPLOYEES where SALARY >= 15000 or EMPLOYEE_ID >= 200
order by SALARY;
select EMPLOYEE_ID,SALARY from EMPLOYEES where SALARY >= 15000 or EMPLOYEE_ID >= 200
order by SALARY desc;
select EMPLOYEE_ID, SALARY, manager_id from EMPLOYEES where SALARY >= 15000 or EMPLOYEE_ID >= 200
order by MANAGER_ID asc, SALARY desc;
5>
select JOB_ID from EMPLOYEES order by JOB_ID;
select distinct JOB_ID from EMPLOYEES order by JOB_ID;
select count(JOB_ID), count(distinct JOB_ID) from EMPLOYEES;
6>
select avg(SALARY), sum(SALARY), count(SALARY) from EMPLOYEES;
select JOB_ID, avg(SALARY), sum(SALARY), count(SALARY) from EMPLOYEES group by JOB_ID;
select JOB_ID, avg(SALARY), sum(SALARY), count(SALARY) from EMPLOYEES group by JOB_ID having count(SALARY) >= 5;