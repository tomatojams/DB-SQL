CREATE  TABLE  employees_temp ( 
      employee_id    NUMBER(6)
    , first_name     VARCHAR2(20)
    , last_name      VARCHAR2(25)  NOT NULL
    , email          VARCHAR2(25)  NOT NULL
    , phone_number   VARCHAR2(20)
    , hire_date      DATE    NOT NULL
    , job_id         VARCHAR2(10)   NOT NULL
    , salary         NUMBER(8,2)
    , commission_pct  NUMBER(2,2)
    , manager_id      NUMBER(6)
    , department_id   NUMBER(4)
) 
TABLESPACE  USERS
PCTFREE  10
PCTUSED  40
INITRANS 1
MAXTRANS 100;


create table test_jobs
as
select * from jobs;

select * from test_jobs;




create table emp_jobs
as
select e.first_name, e.last_name, j.job_title 
from employees e, jobs j
where e.job_id = j.job_id;

select * from emp_jobs;
