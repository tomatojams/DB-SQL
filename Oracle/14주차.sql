SELECT * FROM departments;

SELECT * FROM locations;

SELECT * FROM departments CROSS JOIN locations
SELECT * FROM departments, locations ;

SELECT * FROM departments INNER JOIN locations
ON departments.location_id = locations.location_id;

SELECT * FROM departments, locations
WHERE  departments.location_id = locations.location_id;

SELECT * FROM departments INNER JOIN locations
ON departments.location_id = locations.location_id
WHERE department_id <= 100;

SET serveroutput ON

BEGIN
   FOR outer IN (SELECT * FROM departments)
   LOOP
      FOR  inner  IN (SELECT * FROM locations WHERE  location_id = outer.location_id)
      LOOP
         DBMS_OUTPUT.PUT_LINE(outer.department_id || '  ' || outer.department_name || ' ' || inner.location_id || ' ' || inner.city);
      END LOOP;
  END LOOP;
END;




SELECT  l.location_id, l.city, l.state_province, c.country_id, c.country_name
FROM  locations l, countries c
WHERE l.country_id = c.country_id  ;

SELECT   e.employee_id, e.first_name, e.last_name, e.department_id,  d.department_name 
FROM  employees e, departments d
WHERE e.department_id = d.department_id ;

SELECT * FROM departments;

-- 해시 조인

DROP TABLE emp_temp;
DROP TABLE dept_temp;
DROP TABLE loc_temp;
DROP TABLE coun_temp;

CREATE TABLE   emp_temp AS SELECT * FROM employees;
CREATE TABLE   dept_temp AS SELECT * FROM departments;
CREATE TABLE   loc_temp AS SELECT * FROM locations;
CREATE TABLE   coun_temp AS SELECT * FROM countries;


SELECT * FROM loc_temp;
SELECT * FROM coun_temp;

SELECT  l.location_id, l.city, l.state_province, c.country_id, c.country_name
FROM  loc_temp l, coun_temp c
WHERE l.country_id = c.country_id AND l.location_id <=2000  ;

SELECT  * 
FROM dept_temp d, loc_temp l
WHERE d.location_id = l.location_id;

SELECT  * FROM emp_temp e, dept_temp d
WHERE e.department_id = d.department_id  ;

SELECT last_name FROM employees;

SELECT e.last_name, d.department_id, d.department_name 
FROM  dept_temp d,emp_temp e
WHERE d.department_id = e.department_id;








