USE academy;

INSERT INTO student ( st_id, st_name, st_sex, st_phn_mbl, st_addr, st_birth, dept_id)
             VALUES ('ST001', '최현주','F', '010-1234-1234','서울','1973/01/21','SE');
INSERT INTO student ( st_id, st_name, st_sex, st_phn_mbl, st_addr, st_birth, dept_id)
             VALUES ('ST002', '강하늘','M', '010-2222-2344','서울','1990/11/30','BZ');
INSERT INTO student ( st_id, st_name, st_sex, st_phn_mbl, st_addr, st_birth, dept_id)
             VALUES ('ST003', '이성민','M', '010-3293-9345','서울','1978/06/30','SE');
INSERT INTO student ( st_id, st_name, st_sex, st_phn_mbl, st_addr, st_birth, dept_id)
             VALUES ('ST004', '박정수','F', '010-8323-8342','경기','2000/07/12','EE');
INSERT INTO student ( st_id, st_name, st_sex, st_phn_mbl, st_addr, st_birth, dept_id)
             VALUES ('ST005', '홍민호','M', '010-2342-6547','대전','1985/03/03','BZ');

SELECT * FROM student;

INSERT INTO course (co_num, co_name, co_location) VALUES ('IT111','컴퓨터학개론','인촌관' );
INSERT INTO course (co_num, co_name, co_location) VALUES ('IT222', '데이터베이스시스템', '화정관');
INSERT INTO course (co_num, co_name, co_location) VALUES ('BZ001', '경영학원론', '고려대');
INSERT INTO course (co_num, co_name, co_location) VALUES ('MD123', '웹디자인기초', '화정관');

SELECT * FROM course;


INSERT INTO enrol (st_id, co_num, grade, mid, final) VALUES ('ST001', 'IT111', 'A', 90, 95);
INSERT INTO enrol (st_id, co_num, grade, mid, final) VALUES ('ST001', 'IT222', 'B', 80, 87);
INSERT INTO enrol (st_id, co_num, grade, mid, final) VALUES ('ST001', 'BZ001', 'A', 92, 100);
INSERT INTO enrol (st_id, co_num, grade, mid, final) VALUES ('ST002', 'IT111', 'C', 75, 75);
INSERT INTO enrol (st_id, co_num, grade, mid, final) VALUES ('ST002', 'BZ001', 'A', 96, 95);
INSERT INTO enrol (st_id, co_num, grade, mid, final) VALUES ('ST003', 'IT222', 'A', 90, 100);
INSERT INTO enrol (st_id, co_num, grade, mid, final) VALUES ('ST003', 'BZ001', 'B', 84, 80);
INSERT INTO enrol (st_id, co_num, grade, mid, final) VALUES ('ST004', 'IT111', 'B', 80, 84);
INSERT INTO enrol (st_id, co_num, grade, mid, final) VALUES ('ST004', 'IT222', 'C', 80, 78);
INSERT INTO enrol (st_id, co_num, grade, mid, final) VALUES ('ST005', 'MD123', 'C', 74, 78);

SELECT * FROM enrol;

-- 삭제 명령어
DELETE FROM enrol WHERE st_id = 'ST001';
DELETE FROM student WHERE st_sex = 'M' ;

-- 테이블 복구

-- 수정 명령어
UPDATE  student SET st_addr = '부산' WHERE st_name = '최현주' ;
SELECT * FROM student;

SELECT * FROM enrol;
UPDATE enrol SET mid = mid + 1 ;

SELECT * FROM enrol;
UPDATE enrol SET final = final - 5 ;

-- 테이블 복구

-- 조회 명령어
SELECT * FROM student WHERE st_sex ='M' and dept_id = 'SE' ; 

SELECT st_id '학번', st_name '이름' FROM student;

SELECT dept_id FROM student;

SELECT DISTINCT dept_id FROM student;

SELECT * FROM student ORDER BY st_name ASC;

SELECT * FROM student ORDER BY st_name DESC;

SELECT * FROM enrol ORDER BY grade ASC;

SELECT *, mid+final '총점' FROM enrol WHERE co_num = 'IT111';

SELECT st_name '이름', st_phn_mbl '연락처' FROM student WHERE dept_id = 'BZ'  ;

SELECT * FROM enrol WHERE co_num = 'IT111' AND mid >=90 ;

SELECT count(st_id) '학생수' FROM student;

SELECT avg(mid) '중간평균', avg(final) '기말평균' FROM enrol ;

SELECT co_num '과목번호', sum(final) '과목별 총점' FROM enrol GROUP BY co_num ;