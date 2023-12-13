CREATE TABLE unique_test (
  col1   VARCHAR2(10) UNIQUE,
  col2   VARCHAR2(10),
  col3   VARCHAR2(10), 
  col4   VARCHAR2(10),
  
  CONSTRAINT "col2_UK" UNIQUE(col2),
  CONSTRAINT "col3col4_UK" UNIQUE(col3, col4)
);

select * from unique_test;

INSERT INTO unique_test (col1, col2, col3, col4)
VALUES ('A1','B1','C1','D1');

INSERT INTO unique_test (col1, col2, col3, col4)
VALUES ('A2','B2','C2','D2');

SELECT * FROM unique_test;  

INSERT INTO unique_test (col1, col2, col3, col4)
VALUES ('A2','B2','C2','D2');

UPDATE unique_test SET  col2 = 'B1'
WHERE col2 = 'B2';

CREATE TABLE pk_test (
  col1   VARCHAR2(10) Primary Key,
  col2   VARCHAR2(10)
);


select * from pk_test;

CREATE TABLE null_test (
  col1   VARCHAR2(10) NOT NULL,
  col2   VARCHAR2(10) NULL,
  col3   VARCHAR2(10) 
);

INSERT INTO null_test (col1, col2) VALUES ('A1','B1');
INSERT INTO null_test (col2, col3) VALUES ('B2','C2');


CREATE TABLE  emp_test (
   empid	         NUMBER(6,0)     NOT NULL  CHECK (empid>0),
   empname	 VARCHAR2(30)   NOT NULL,
   address        VARCHAR2(100)  NULL CHECK (address like 'S%'),
   grade		     NUMBER(10,2)    NULL ,
   gender         CHAR(2 CHAR)   NULL ,
   regdate        DATE                NULL ,

   CONSTRAINT  check_gender  CHECK (gender  IN  ('³²ÀÚ', '¿©ÀÚ'))
);

SELECT * FROM emp_test;
INSERT INTO emp_test (empid, empname, address, grade, gender, regdate)
VALUES (101, 'È«¼öÃ¶', 'SEOUL', NULL,'³²ÀÚ', NULL);

INSERT INTO emp_test (empid, empname, address )
VALUES (102, '±è¹ÎÃ¶', 'SEOUL');

INSERT INTO emp_test (empid, empname, address, grade, gender, regdate)
VALUES (103, 'ÀÌ³ª¶ó', 'PUSAN', NULL,'¿©ÀÚ', NULL);

DROP TABLE emp_test;

CREATE TABLE  emp_test (
   empid	   NUMBER(6,0)    NOT NULL  CHECK (empid>0),
   empname	 VARCHAR2(30)   NOT NULL,
   address   VARCHAR2(100)  NULL CHECK (address like 'S%'),
   grade		 NUMBER(10,2)   DEFAULT 3.9  NULL ,
   gender    CHAR(2 CHAR)   DEFAULT  '³²ÀÚ' NULL ,
   regdate   DATE           DEFAULT  SYSDATE NULL ,
   department_id  NUMBER(4,0),

   CONSTRAINT  check_gender  CHECK (gender  IN  ('³²ÀÚ', '¿©ÀÚ')),
   CONSTRAINT   fk_deptno  FOREIGN KEY (department_id)
                     REFERENCES  departments(department_id)
);

SELECT * FROM departments;

select * from emp_test;

INSERT INTO emp_test (empid, empname, address, grade, gender, regdate, department_id)
VALUES (101, 'È«¼öÃ¶', 'SEOUL', NULL,'³²ÀÚ', NULL, 10 );

INSERT INTO emp_test (empid, empname, address )
VALUES (102, '±è¹ÎÃ¶', 'SEOUL');

INSERT INTO emp_test (empid, empname, address, grade, gender, regdate, department_id)
VALUES (103, 'ÀÌ¼ö¹Î', 'SEOUL',DEFAULT ,'¿©ÀÚ',DEFAULT , 35 );

SELECT * FROM emp_test;

