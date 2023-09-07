UPDATE  employees
SET  salary = 7000
WHERE  last_name = 'Banda';

SELECT last_name, salary 
FROM employees
WHERE  last_name = 'Banda';

COMMIT;

UPDATE  employees
SET  salary = 12000
WHERE  last_name = 'Banda';

SELECT last_name, salary 
FROM employees
WHERE  last_name = 'Banda';

ROLLBACK;

SELECT last_name, salary 
FROM employees
WHERE  last_name = 'Banda';

SELECT last_name, salary 
FROM employees
WHERE  last_name = 'Greene';

SELECT last_name, salary 
FROM employees
WHERE  last_name = 'Banda';

UPDATE  employees
SET  salary = 10000
WHERE  last_name = 'Banda';

commit;


