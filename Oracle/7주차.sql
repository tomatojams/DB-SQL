SELECT * FROM  employees ;
SELECT * FROM  employees WHERE employee_id= 200;
SELECT * FROM  employees  WHERE  email like 'SV%';
SELECT * FROM  employees  WHERE  substr(email, 1, 2) = 'SV';


SELECT * FROM  employees  WHERE  employee_id  between 150 and 200;
SELECT * FROM  employees  WHERE  employee_id  not between 150 and 200;

SELECT * FROM  employees  WHERE  substr(email, 1, 2)= 'SV';
SELECT * FROM  employees  WHERE  email like 'SV%';


CREATE INDEX idx_salary ON employees(salary);
SELECT *  FROM  employees  WHERE  salary * 12 = 57600;
SELECT *  FROM  employees  WHERE  salary = 57600/12;

SELECT * FROM  employees WHERE first_name || last_name = 'StevenKing';
SELECT * FROM  employees WHERE first_name = 'Steven' and  last_name = 'King';

SELECT e.employee_id, e.last_name, d.department_name 
FROM employees e JOIN  departments d  ON e.department_id = d.department_id
WHERE last_name = 'Khoo';