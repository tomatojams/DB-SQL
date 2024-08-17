use mart;
SELECT * FROM card;
-- 12강

-- if 사용법
SELECT 사용금액, if( 사용금액> 300000, '우수', '거지') FROM card;

-- if(사용금액> 300,000, '우수', '거지')

SELECT 사용금액, 
CASE 
	WHEN 사용금액>300000 THEN '우수' 
	WHEN 사용금액>100000 THEN '준수' 
	ELSE '그지'
END 평가
FROM card;

-- 등급별 점수를 차등줘서 합계
SELECT sum(
CASE 
	WHEN 고객등급 = 'vip' THEN 3 
	WHEN 고객등급 = '패밀리' THEN 2 
	ELSE 1
END) 점수
FROM card ;

-- Q1 
SELECT sum(
CASE 
	WHEN 사용금액 > 300000 THEN 사용금액*1.5
	ELSE 사용금액 * 1.1
END
) 총합계
FROM card;

-- Q2***

SELECT 고객명, 사용금액,고객등급 FROM card 
WHERE 고객등급 != CASE 
	WHEN 사용금액 >= 300000 THEN 'vip'
	WHEN 사용금액 >= 200000 THEN '로열'
	ELSE '패밀리'
END;


-- 13강
-- CREATE DATABASE 테스트;
-- DROP DATABASE 테스트;

-- 테이블 생성과 함께 칼럼생성
CREATE TABLE 테스트.new_table (
id int,
이름 varchar(100) DEFAULT '아무개',
나이 int
);

-- DROP TABLE new_table;

-- 테이블 수정 (주석처리 주의)
ALTER TABLE `테스트`.`new_table` ADD `여자친구` varchar(100);

ALTER TABLE `테스트`.`new_table` MODIFY COLUMN `여자친구` int;
ALTER TABLE `테스트`.`new_table` DROP COLUMN `여자친구`;

-- q1
USE 테스트;
CREATE TABLE 테스트.목록 (유저이름 varchar(100), 전화번호 varchar(100));

-- q2
ALTER TABLE 목록 ADD 나이 int ;

-- q3
ALTER TABLE 테스트.목록 MODIFY COLUMN 나이 bigint DEFAULT 1;

-- q4
DROP TABLE 목록;