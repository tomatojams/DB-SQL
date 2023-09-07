SELECT * FROM employees;

SELECT * FROM employees WHERE last_name  like 'K%';

SELECT * FROM employees WHERE email  like 'K%';

SELECT * FROM employees WHERE employee_id  = '101';


SELECT last_name, salary FROM employees 
WHERE salary > 2000 ORDER BY department_id, last_name;

CREATE INDEX emp_idx_test1 ON employees(department_id, last_name, salary); 

CREATE TABLE tbl_name (
   key1  VARCHAR2(10),
   key2  VARCHAR2(20),   
   col1  NUMBER  UNIQUE, 
   col2  VARCHAR2(100),
   
   CONSTRAINT pk_tbl_name PRIMARY KEY(key1, key2)
  );

CREATE UNIQUE INDEX idx_uni_test ON tbl_name(col2);

SELECT  index_name, table_name FROM  user_indexes;

DROP INDEX idx_uni_test;

CREATE TABLE   emp_temp
AS SELECT * FROM employees;

SELECT * FROM emp_temp;

ANALYZE INDEX idx_emp_temp VALIDATE STRUCTURE;

SELECT * FROM INDEX_STATS;

SELECT (del_lf_rows_len/lf_rows_len) * 100
FROM index_stats;

DELETE FROM emp_temp WHERE  employee_id <= 150;

ANALYZE INDEX idx_emp_temp VALIDATE STRUCTURE;

SELECT (del_lf_rows_len/lf_rows_len) * 100
FROM index_stats;


ALTER INDEX idx_emp_temp REBUILD;

ANALYZE INDEX idx_emp_temp VALIDATE STRUCTURE;
SELECT * FROM  index_stats;

SELECT (del_lf_rows_len/lf_rows_len) * 100
FROM index_stats;

