USE company;

-- 연산자
SELECT ename 이름, salary 급여, dno 직급 FROM employee
WHERE salary <= 4000;

SELECT ename, salary, dno FROM employee
WHERE salary >= 4000 AND salary <=5000;

SELECT ename, salary, dno FROM employee
WHERE salary BETWEEN 4000 AND 5000;

SELECT * FROM employee
WHERE ename LIKE '이%';

SELECT * FROM project
WHERE pname LIKE '%마케팅%';

SELECT * FROM employee WHERE superssn IS NULL;
SELECT * FROM employee WHERE dno =1 or dno = 5;
SELECT * FROM employee  WHERE dno IN (1,5);
SELECT * FROM employee  WHERE ename IN ('박현식','이지은');


-- 서브쿼리
SELECT ename, salary FROM employee  
WHERE salary > (SELECT avg(salary) FROM employee);

SELECT ename, salary FROM employee
WHERE salary > (SELECT avg(salary) FROM employee 종웝원);

SELECT ename, address, dno FROM employee  
WHERE dno = (SELECT dno FROM employee 
             WHERE ename = '박현식');
             
SELECT ename, address FROM employee  
WHERE ssn IN (SELECT essn FROM works_on WHERE pno = 20);

SELECT ename, address FROM employee  
WHERE ssn NOT IN (SELECT essn FROM works_on WHERE pno = 20);

SELECT ename, address FROM employee  
WHERE EXISTS (SELECT essn FROM works_on WHERE pno = 20);


SELECT ename, address, (SELECT count(essn) FROM dependent WHERE essn = ssn)
FROM employee;


SELECT max(salary) '최고연봉', avg(salary) '평균연봉' FROM employee;
SELECT pno '프로젝트번호', avg(hours) '평균투입시간'  FROM  works_on  GROUP BY pno;
SELECT pno '프로젝트번호', count(essn) '참여인원' FROM works_on  GROUP BY  pno;
SELECT pno '프로젝트번호', count(essn) '참여인원', avg(hours) '평균투입시간'  
FROM works_on  GROUP BY  pno;

--------------중요 HAVING------
SELECT pno '프로젝트번호', count(essn) '참여인원' FROM works_on  
GROUP BY  pno  HAVING count(essn) >= 3;



SELECT * FROM department CROSS JOIN project;
SELECT * FROM department, project;

SELECT * FROM department INNER JOIN project 
ON department.dnumber = project.dnum;

SELECT * FROM department, project 
WHERE department.dnumber = project.dnum;

SELECT * FROM department INNER JOIN project 
ON department.dnumber = project.dnum
WHERE plocation IN ('서울', '부산');

SELECT * FROM department NATURAL JOIN dept_locations
WHERE department.dnumber = dept_locations.dnumber;

SELECT ssn, ename FROM employee;
SELECT essn, dpntname FROM dependent;

SELECT essn, count(essn) FROM dependent GROUP BY essn;

SELECT e.ssn, e.ename, d.essn, d.dpntname 
FROM employee e LEFT OUTER JOIN dependent d 
ON e.ssn = d.essn;

SELECT e.ssn, e.ename, count(d.essn)
FROM employee e JOIN dependent d ON e.ssn = d.essn
GROUP BY e.ssn;

SELECT e.ssn, e.ename, count(d.essn)
FROM employee e LEFT OUTER JOIN dependent d ON e.ssn = d.essn
GROUP BY e.ssn;

SELECT '연봉 4천이상', avg(salary) 
FROM employee 
WHERE salary>=4000
UNION
SELECT '연봉 4천미만', avg(salary) 
FROM employee 
WHERE salary<4000;

-- 1/10
SELECT bdate, address FROM employee WHERE ename = '김유헌';

-- 2/10
SELECT ssn, dname
FROM employee JOIN department ON employee.dno = department.dnumber;

-- 3/10
SELECT ename, address FROM employee 
JOIN department ON employee.dno = department.dnumber
WHERE department.dname = '연구소';

SELECT e.ename, e.address FROM employee e JOIN department d
ON e.dno = d.dnumber
WHERE d.dname = '연구소';

-- 4/10
SELECT e.ename, e.salary, s.ename, s.salary FROM employee e JOIN employee s 
ON e.superssn = s.ssn;

SELECT e.ename, e.salary, s.ename, s.salary FROM employee e LEFT OUTER JOIN employee s 
ON e.superssn = s.ssn;

-- 5/10
SELECT salary FROM employee;
SELECT DISTINCT salary FROM employee;

-- 6/10
SELECT ssn, ename, address FROM employee
WHERE address like '%용인%';

-- 7/10
SELECT ename, salary FROM employee
WHERE employee.ssn IN (SELECT essn FROM works_on WHERE pno = '10');

UPDATE employee SET salary = salary * 1.1 
WHERE employee.ssn IN (SELECT essn FROM works_on WHERE pno = '10');

-- 8/10
SELECT * FROM employee WHERE salary>=4000 AND dno=5 ;

-- 9/10
SELECT e.ename, q.pname FROM employee e 
JOIN (SELECT * FROM project p JOIN works_on w ON p.pnumber = w.pno) q
ON e.ssn = q.essn
ORDER BY e.ename;

-- 10/10
SELECT p.pnumber, p.dnum, q.ename, q.address, q.bdate FROM project p 
JOIN (SELECT * FROM employee e JOIN department d ON e.ssn = d.mgrssn) q
ON p.dnum = q.dnumber
WHERE p.plocation = '서울';
