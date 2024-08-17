USE mart;

--6강

SELECT * FROM product 
WHERE (카테고리 = '가구' OR 카테고리 = '옷') AND 가격 = 5000;

SELECT * FROM product 
WHERE NOT 카테고리='가구' AND NOT 가격 = 5000;

SELECT * FROM product p
WHERE p.카테고리 in ('가전','신발','식품');

-- Q1. 재고가 20이하인 상품 가나다순***
SELECT * FROM product p 
WHERE p.재고 <=20 ORDER BY 상품명 ASC;

-- Q2. 가격이 3000 미만 or 6000초과
SELECT * from product p 
WHERE 가격< 3000 or 가격 > 6000;

-- Q3. 카테고리 옷이 아닌것 & 가격 5천원
SELECT * FROM product p 
WHERE  NOT p.카테고리 = '옷'  AND 가격 = 5000;

-- Q4. 상품명이 셔츠,반팔티, 운동화가 아닌것
 SELECT * FROM product p 
 WHERE NOT 상품명 IN ('셔츠','반팔티','운동화');
 
--7강
--문자컬럼에서 LIKE %~~ 조건식
-- CHAR에서 쓸때는 주의 나머지는 공백으로 채워서 %소파로 안됨 %소파%로 안됨
SELECT * FROM product p
WHERE 상품명 LIKE '%소파%'; -- 성능저하 index를 못쓸수있음

SELECT * FROM product p
WHERE 상품명 LIKE '레드%'; 

SELECT * FROM product p
WHERE 상품명 LIKE '레드_'; -- _ 는  아무문자 한 글자


--Q1 상품명에 Green으로 시작 chair로끝나는
SELECT * FROM product p 
WHERE p.상품명 LIKE 'Green%chair';

--Q2 상품명에 '소파' 또는 'chair'가 들어간 상품명
SELECT * FROM product p 
WHERE p.상품명 LIKE '%소파%' OR 상품명 LIKE '%chair%';

--Q3 '소파'는 있고 '나무'는 없는것***
SELECT * FROM product p 
WHERE p.상품명 LIKE '%소파' AND NOT 상품명 LIKE '%나무%';

--8강--

SELECT * FROM card c ;
SELECT 사용금액 from card c ;

-- 함수사용은 함수(컬럼) 형식으로사용
SELECT 고객명,MAX(사용금액) from card c group by 고객명;
SELECT avg(결제횟수) from card c ; 
SELECT SUM(결제횟수) from card c  ;

--행의 갯수를 세는 함수
SELECT COUNT(사용금액) from card c ; 

--별칭
SELECT MAX(사용금액) 최대값 from card;


--일부행만 골라서 통계내기***
SELECT AVG(사용금액) from card WHERE card.고객등급 = 'vip';

--DISTINCT 중복데이타 제거하고 유니크한 값만 0이 여러개면 하나만 표현

SELECT DISTINCT 연체횟수 from card c;
SELECT AVG( DISTINCT 연체횟수) from card c;
--max값 빨리 구하기
SELECT 사용금액 from card order by 사용금액 desc LIMIT 1;-- 데이타가 많을때이게 더 빠름***

--Q1 최대 결제횟수, 최소 결제횟수
SELECT MAX(결제횟수), MIN(결제횟수) from card c; 

--Q2 고객등급 vip 사람들의 '평균 결제횟수'
-- 그사람들의 '사용금액 총 합계'

SELECT AVG(결제횟수), SUM(사용금액) from card c WHERE c.고객등급='vip'; 

--Q3 연체횟수가 1회 이하인 사람은 몇명?
SELECT COUNT(고객명) from card c WHERE c.연체횟수 <= 1; 
