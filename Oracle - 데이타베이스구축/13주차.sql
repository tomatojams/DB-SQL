   SET serveroutput ON;
   
   -- 커서 정의
   DECLARE
         CURSOR  emp_csr  IS
               SELECT  employee_id  FROM  employees
               WHERE  department_id = 100;
               
        emp_id  employees.employee_id%TYPE;
        
    BEGIN
        OPEN  emp_csr;
        LOOP
            FETCH   emp_csr   INTO  emp_id;
            EXIT WHEN  emp_csr%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(emp_id);
        END LOOP;
        CLOSE  emp_csr;
    END;
    
    
  -- FOR .. LOOP 문 이용
   DECLARE
         CURSOR  emp_csr  IS
               SELECT  employee_id  FROM  employees
               WHERE  department_id = 100;
     
    BEGIN
        FOR  item  IN  emp_csr  LOOP
            DBMS_OUTPUT.PUT_LINE( item.employee_id);
        END LOOP;
    END;


-- 묵시적 커서 사용 예

-- employees_temp 테이블이 있는 경우 삭제함    
DROP TABLE employees_temp;

-- employees_temp 테이블 생성
CREATE TABLE employees_temp AS
  SELECT * FROM employees;

DECLARE
  mgr_no NUMBER(6) := 122;
BEGIN
  DELETE FROM employees_temp WHERE manager_id = mgr_no; 
  -- DELETE 명령문으로 영향 받은 레코드의 수를 출력
  DBMS_OUTPUT.PUT_LINE
    ('Number of employees deleted: ' || TO_CHAR(SQL%ROWCOUNT));
END;
    
-- 저장프로시저 정의
    
CREATE  PROCEDURE emp_register
IS
BEGIN
    INSERT INTO 
       employees (employee_id, first_name, last_name, email, hire_date,job_id)
    VALUES  (EMPLOYEES_SEQ.NEXTVAL,'HONGSEOK', 'NA',
      'hsna99@cuk.edu',sysdate,'IT_PROG');
END;

EXEC    emp_register;

SELECT * FROM employees WHERE  last_name = 'NA';


-- 저장프로시저 정의  : IN 파라미터
 CREATE  PROCEDURE   emp_register1
      (f_name  VARCHAR2, l_name  VARCHAR2, e_mail VARCHAR2, j_id  VARCHAR2)
IS
BEGIN
    INSERT INTO employees (employee_id, first_name, last_name, email, hire_date,job_id)
    VALUES (EMPLOYEES_SEQ.NEXTVAL, f_name,  l_name,  e_mail, sysdate, j_id);
    COMMIT;
END;


EXEC    emp_register1('gildong', 'hong', 'hdg@gmail.com', 'IT_PROG');

SELECT * FROM employees;

-- 저장프로시저 정의  : OUT 파라미터

CREATE PROCEDURE emp_register2   
 (f_name  VARCHAR2, l_name  VARCHAR2, e_mail VARCHAR2, j_id  VARCHAR2,  emp_id  OUT  NUMBER)
IS
BEGIN
    emp_id := EMPLOYEES_SEQ.NEXTVAL;
    INSERT INTO employees (employee_id, first_name, last_name, email, hire_date,job_id)
    VALUES (emp_id, f_name,  l_name,  e_mail, sysdate, j_id);
    COMMIT;
END;


--  프로시저 실행

DECLARE
      e_id  NUMBER;
BEGIN
    emp_register2('MANHO', 'KANG', 'kmh@gmail.com', 'IT_PROG', e_id);
    DBMS_OUTPUT.PUT_LINE(e_id);
END;

SELECT * FROM employees;


-- 함수 정의

CREATE   FUNCTION   emp_salaries (emp_id  NUMBER)
RETURN  NUMBER  IS
nSalaries  NUMBER(9);
BEGIN
    nSalaries := 0;
    SELECT   salary    INTO  nSalaries   FROM employees
    WHERE   employee_id  =  emp_id;
    RETURN  nSalaries;
END;


SELECT     emp_salaries (100)  FROM  dual;


CREATE FUNCTION   get_dep_name (dept_id  NUMBER)
RETURN  VARCHAR2  IS
sDeptname   VARCHAR2(30);
BEGIN
    SELECT   department_name    INTO  sDeptname   FROM departments
    WHERE   department_id  =  dept_id;
    RETURN  sDeptname ;
END;

SELECT get_dep_name(100) FROM dual;





    

