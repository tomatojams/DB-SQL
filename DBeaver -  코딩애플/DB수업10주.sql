-- 10주차
CREATE DATABASE academy;
USE academy;

CREATE TABLE student
(
   st_name    VARCHAR(20)   NOT NULL,
   st_id      VARCHAR(10)   PRIMARY KEY,
   st_sex     CHAR(1)     NOT NULL,
   st_phn_mbl CHAR(13)   UNIQUE,
   st_addr    CHAR(50),
   st_birth   DATE,    -- DATETIME을 DATE로 변경
   dept_id    CHAR(2)
);

CREATE TABLE course
(
   co_num     CHAR(5)   PRIMARY KEY,
   co_name    VARCHAR(20)   NOT NULL UNIQUE,
   co_location VARCHAR(20)
);

CREATE TABLE enrol
(
   st_id    VARCHAR(10),
   co_num   CHAR(5),
   grade    CHAR(2),
   mid      INT,
   final    INT,

   PRIMARY KEY (st_id, co_num),
   FOREIGN KEY (st_id) REFERENCES student(st_id),
   FOREIGN KEY (co_num) REFERENCES course(co_num)
);

SHOW TABLES;

-- 11주차(데이터 입력)
INSERT INTO student (st_id, st_name, st_sex, st_phn_mbl, st_addr, st_birth, dept_id)
             VALUES ('ST001', '최현주', 'F', '010-1234-1234', '서울', '1973-01-21', 'SE'); -- 날짜 형식 수정
INSERT INTO student (st_id, st_name, st_sex, st_phn_mbl, st_addr, st_birth, dept_id)
             VALUES ('ST002', '강하늘', 'M', '010-2222-2344', '서울', '1990-11-30', 'BZ'); -- 날짜 형식 수정
INSERT INTO student (st_id, st_name, st_sex, st_phn_mbl, st_addr, st_birth, dept_id)
             VALUES ('ST003', '이성민', 'M', '010-3293-9345', '서울', '1978-06-30', 'SE'); -- 날짜 형식 수정
INSERT INTO student (st_id, st_name, st_sex, st_phn_mbl, st_addr, st_birth, dept_id)
             VALUES ('ST004', '박정수', 'F', '010-8323-8342', '경기', '2000-07-12', 'EE'); -- 날짜 형식 수정
INSERT INTO student (st_id, st_name, st_sex, st_phn_mbl, st_addr, st_birth, dept_id)
             VALUES ('ST005', '홍민호', 'M', '010-2342-6547', '대전', '1985-03-03', 'BZ'); -- 날짜 형식 수정

SELECT * FROM student;

INSERT INTO course (co_num, co_name, co_location) VALUES ('IT111','컴퓨터학개론','인촌관' );
INSERT INTO course (co_num, co_name, co_location) VALUES ('IT222', '데이터베이스시스템', '화정관');
INSERT INTO course (co_num, co_name, co_location) VALUES ('BZ001', '경영학원론', '고려대');
INSERT INTO course (co_num, co_name, co_location) VALUES ('MD123', '웹디자인기초', '화정관');

SELECT * FROM course;


INSERT INTO enrol (st_id, co_num, grade, mid, final) 
            VALUES ('ST001', 'IT111', 'A', 90, 95);
INSERT INTO enrol (st_id, co_num, grade, mid, final) 
            VALUES ('ST001', 'IT222', 'B', 80, 87);
INSERT INTO enrol (st_id, co_num, grade, mid, final) 
            VALUES ('ST001', 'BZ001', 'A', 92, 100);
INSERT INTO enrol (st_id, co_num, grade, mid, final) 
            VALUES ('ST002', 'IT111', 'C', 75, 75);
INSERT INTO enrol (st_id, co_num, grade, mid, final) 
            VALUES ('ST002', 'BZ001', 'A', 96, 95);
INSERT INTO enrol (st_id, co_num, grade, mid, final) 
            VALUES ('ST003', 'IT222', 'A', 90, 100);
INSERT INTO enrol (st_id, co_num, grade, mid, final) 
            VALUES ('ST003', 'BZ001', 'B', 84, 80);
INSERT INTO enrol (st_id, co_num, grade, mid, final) 
            VALUES ('ST004', 'IT111', 'B', 80, 84);
INSERT INTO enrol (st_id, co_num, grade, mid, final) 
            VALUES ('ST004', 'IT222', 'C', 80, 78);
INSERT INTO enrol (st_id, co_num, grade, mid, final) 
            VALUES ('ST005', 'MD123', 'C', 74, 78);
SELECT * FROM enrol;
