-- 9강
use mart;
-- 문자연결 concat(컬럼1,컬럼2, 특정문자)
SELECT concat(고객명,' ', 고객등급) from card c ;
-- 공백제거 TRIM
SELECT TRIM(고객명)from card;
-- 단어바꾸기 (컬럼명,바꿀문자, 교체문자)
SELECT REPLACE (고객등급,'패','훼') from card c;
-- 특정 문자 추출 (컬럼, 몇번째부터, 몇글짜)
SELECT SUBSTR(고객등급, 2, 2) from card c ;
-- 일부문자 교체 (컬럼, 몇째글자부터, 몇자, 바꿀단어)
SELECT INSERT(고객명,1,4,'hello' ) from card c ;

-- Q1 공백제거
select replace(고객명, ' ','') from card c ;
-- Q2 문자열 추출
select right (번호,4) from table;
select substr(번호, 10,4) from table;

-- 10강

-- 서브쿼리 -> 1. 문자나 숫자 들어가는 자리 2. 단 하나의 결과값 문자나 숫자에만 쓸수있음. 
-- 서브쿼리의 반환값이 하나의 값이어야함
-- 소괄호 붙일것
select *  from card where 사용금액 > (select avg(사용금액) from card)  ;

-- 숫자나문자 하나를 대신하기때문에 이렇게 숫자대신 쓸수있음
select 사용금액 / (select avg(사용금액) from card) from card c ;

-- IN 안에서는 한개의 결과값 문자가 아닌 여러개를 가진 칼럼값을 쓸수있음
select * from card c where 고객명 In(select 이름 from blacklist b  );

-- Q
select 고객명, 사용금액 from card where 고객명 in (select 이름 from blacklist b);

-- Q1 고객등급이 패밀리 사람들의 평균 연체횟수보다 높은사람***
select count(*) from card c where c.연체횟수 > (select avg(연체횟수) from card c2 where c.고객등급 = '패밀리'); 

-- Q2 개인의 사용금액이 평균 사용금액과의 차이가 얼마인지
select 고객명, 사용금액, 사용금액 -(select avg(사용금액)from card) DIFF from card;

-- 11강

-- group by는 앞뒤로 같은 칼럼을 씀***
-- 그룹지어주기때문에 같은값이 많은 것들에 쓰임. (카테고리컬럼)***
-- 카테고리에서 다시 필터링하려면  having*** <- group by 뒤에서 ,group by 의 결과만 필터링

-- where은 select from결과 필터링*** <- 따라서 from 다음에 붙음

select 고객등급, avg(사용금액) from card c  where 연체횟수 =0  group by 고객등급;
select 고객등급, avg(사용금액) from card c group by 고객등급 having 고객등급 = 'vip';

-- order by는 정렬이라 맨마지막에 거의 쓰임

-- Q1  테이블에서 연체횟수마다 몇명이 있는지 출력해봅시다.  보기좋게 연체횟수 기준으로 정렬도 합시다. 
select 연체횟수, count(고객명) 몇명이냐면 from card c group by 연체횟수 order by 연체횟수 asc;

-- Q2 Q1에서 출력한 결과가 너무 길어서 몇명이냐면 컬럼의 값이 1명인 행은 안보이게 필터링해봅시다. 
-- group by의 결과 필터링이므로 having
select 연체횟수, count(고객명) 몇명이냐면 from card c group by 연체횟수 having count(고객명) >1 order by 연체횟수 asc;

-- Q3
-- order by는 새로 생성한 컬럼으로도 정렬가능하다
select 고객등급, max(사용금액) as 최대, min(사용금액) as 최소, max(사용금액)/min(사용금액) as 몇배 from card c group by 고객등급 order by 몇배 desc;
--