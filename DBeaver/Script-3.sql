SELECT * FROM r1 r;

SELECT * FROM r2 r;

SELECT B FROM company.r1 JOIN company.r2 ON  r1.C = r2.C WHERE r1.B = 'a';

DROP TABLE r1;
DROP TABLE company.r2 ;

SELECT * FROM r2;






