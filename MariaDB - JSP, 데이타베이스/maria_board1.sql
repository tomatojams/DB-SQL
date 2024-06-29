# show databases;
# use myboard;
#
# SELECT * FROM myboard;
# SELECT * FROM chat;

create database company;
use company;

CREATE TABLE R1
(

    A  char(1),
    B	char(1),
    C   char(1)

);

CREATE TABLE R2
(

    C  char(1),
    D	char(1),
    E   char(1)

);
insert INTO R1 (A,B,C) values('1','a','x');
insert INTO R1 (A,B,C) values('2','b','x');
insert INTO R1 (A,B,C) values('1','c','y');
insert INTO R2 (C,D,E) values('x','k','3');
insert INTO R2 (C,D,E) values('x','a','3');
insert INTO R2 (C,D,E) values('z','y','2');

drop table A;
drop table B;

select * from R1;
select * from R2;

SELECT B FROM R1 JOIN R2 ON R1.C = R2.C

WHERE R1.B = 'a' ;

select * from Product;
select * from Manufacture;
select * from Employee;
select * from Customer;
select * from Purchase;
select * from Manufacturing;

CREATE TABLE Product
(

    Pd_num varchar(10) primary key,
    Pd_name varchar(20) not null,
    Pd_Des text,
    Pd_price double,
    Sp_price double,
    Date_man datetime,
    Date_ex datetime,
    Category varchar(10)

);
CREATE TABLE Manufacture
(

    Ma_num varchar(10) primary key,
    Ma_name varchar(20) not null,
    Ma_address varchar(50),
    Ma_zip char(10),
    Ma_call char(13),
    Ma_em	char(20),
    Ma_home	varchar(30)

);

CREATE TABLE Employee
(

    Em_num char(10) primary key,
    Em_name char(10) not null,
    Em_sex	char(1) check(Em_sex IN('M','F')),
    Em_bel	char(10),
    Em_syear datetime

);

CREATE TABLE Customer
(

    Co_num char(10) primary key,
    Co_name char(10) not null,
    Co_hcall	char(13),
    Co_ccall	char(13),
    Co_add1	varchar(10),
    Co_add2 varchar(40),
    Co_birth	datetime,
    Co_job	char(10)

);


CREATE TABLE Purchase
(

    Pd_num varchar(10),
    Co_num char(10),
    P_total int,
    P_totpr double,
    P_date datetime,

    primary key (Pd_num, Co_num),
    foreign key (Pd_num) references Product(Pd_num),
    foreign key (Co_num) references Customer(Co_num)

);

CREATE TABLE Manufacturing
(

    Pd_num varchar(10),
    Ma_num char(10),
    M_price Double,
    M_date datetime,

    primary key (Pd_num, Ma_num),
    foreign key (Pd_num) references Product(Pd_num),
    foreign key (Ma_num) references Manufacture(Ma_num)

);


INSERT INTO Product ( Pd_num,Pd_name,Pd_Des,Pd_price,Sp_price,Date_man,Date_ex,Category)
values('PD001','사과', '맛있음', 3000, 1500, '2023/01/22','2023/05/22', 'food');
INSERT INTO Product ( Pd_num,Pd_name,Pd_Des,Pd_price,Sp_price,Date_man,Date_ex,Category)
values('PD002','우유', '맛있음', 4000, 2000, '2023/04/22','2023/05/22', 'food');
INSERT INTO Product ( Pd_num,Pd_name,Pd_Des,Pd_price,Sp_price,Date_man,Date_ex,Category)
values('PD003','가지', '맛있음', 1000, 500, '2023/05/22','2023/05/27', 'food');
INSERT INTO Product ( Pd_num,Pd_name,Pd_Des,Pd_price,Sp_price,Date_man,Date_ex,Category)
values('PD004','버섯', '맛있음', 3000, 1500, '2023/04/22','2023/05/22', 'food');
INSERT INTO Product ( Pd_num,Pd_name,Pd_Des,Pd_price,Sp_price,Date_man,Date_ex,Category)
values('PD005','고사리', '맛있음', 2000, 1000, '2023/03/22','2023/05/22', 'food');
INSERT INTO Product ( Pd_num,Pd_name,Pd_Des,Pd_price,Sp_price,Date_man,Date_ex,Category)
values('PD006','파인애플', '맛있음', 5000, 3500, '2023/05/22','2023/05/27', 'food');
INSERT INTO Product ( Pd_num,Pd_name,Pd_Des,Pd_price,Sp_price,Date_man,Date_ex,Category)
values('PD007','호두', '맛있음', 2000, 500, '2023/01/22','2023/07/22', 'food');
INSERT INTO Product ( Pd_num,Pd_name,Pd_Des,Pd_price,Sp_price,Date_man,Date_ex,Category)
values('PD008','인절미', '맛있음', 7000, 3000, '2023/03/22','2023/08/22', 'food');
INSERT INTO Product ( Pd_num,Pd_name,Pd_Des,Pd_price,Sp_price,Date_man,Date_ex,Category)
values('PD009','두부', '맛있음', 3000, 1500, '2023/05/22','2023/05/29', 'food');
INSERT INTO Product ( Pd_num,Pd_name,Pd_Des,Pd_price,Sp_price,Date_man,Date_ex,Category)
values('PD010','천사채', '맛있음', 4000, 1500, '2023/04/22','2023/05/22', 'food');


INSERT INTO Manufacture ( 	Ma_num ,Ma_name ,Ma_address,Ma_zip ,Ma_call ,Ma_em	,Ma_home)
values( 'Ma001', '인천사', '경기 구리 구로빌딩 567', '12010', '312-123-2344', 'inchenFac@naver.com', 'www.inchoenfac.com');
INSERT INTO Manufacture ( 	Ma_num ,Ma_name ,Ma_address,Ma_zip ,Ma_call ,Ma_em	,Ma_home)
values( 'Ma002', '아님식품', '경기 남양주 153-4', '12030', '312-1456-2354', 'anmi@naver.com', 'www.ami.com');
INSERT INTO Manufacture ( 	Ma_num ,Ma_name ,Ma_address,Ma_zip ,Ma_call ,Ma_em	,Ma_home)
values( 'Ma003', '오남식품', '서울 구로구 123-5', '12040', '02-123-2344', 'onam@naver.com', 'www.onam.com');
INSERT INTO Manufacture ( 	Ma_num ,Ma_name ,Ma_address,Ma_zip ,Ma_call ,Ma_em	,Ma_home)
values( 'Ma004', '이원사',' 경기 남양주시 진접 135-4', '12060', '312-133-2454', 'ion@naver.com', 'www.ion.com');
INSERT INTO Manufacture ( 	Ma_num ,Ma_name ,Ma_address,Ma_zip ,Ma_call ,Ma_em	,Ma_home)
values( 'Ma005', '구리식품', '경기 구리시 145-5', '12050', '312-723-2544', 'kuri@naver.com', 'www.kuri.com');


INSERT INTO Employee ( Em_num ,Em_name ,Em_sex, Em_bel,Em_syear)
values('Em001', '김지한', 'M', '기획부', '2020/08/22');
INSERT INTO Employee ( Em_num ,Em_name ,Em_sex, Em_bel,Em_syear)
values('Em002', '서민정', 'F', '마케팅', '2021/05/22');
INSERT INTO Employee ( Em_num ,Em_name ,Em_sex, Em_bel,Em_syear)
values('Em003', '이미연', 'F', '회계부', '2020/07/24');
INSERT INTO Employee ( Em_num ,Em_name ,Em_sex, Em_bel,Em_syear)
values('Em004', '공수래', 'M', '기획부', '2019/01/05');
INSERT INTO Employee ( Em_num ,Em_name ,Em_sex, Em_bel,Em_syear)
values('Em005', '채소민', 'F', '마케팅', '2021/09/08');
INSERT INTO Employee ( Em_num ,Em_name ,Em_sex, Em_bel,Em_syear)
values('Em006', '김연지', 'F', '회계부', '2015/01/09');
INSERT INTO Employee ( Em_num ,Em_name ,Em_sex, Em_bel,Em_syear)
values('Em007', '김상수', 'M', '기획부', '2018/02/15');
INSERT INTO Employee ( Em_num ,Em_name ,Em_sex, Em_bel,Em_syear)
values('Em008', '박보영', 'F', '마케팅', '2022/08/12');
INSERT INTO Employee ( Em_num ,Em_name ,Em_sex, Em_bel,Em_syear)
values('Em009', '이창민', 'M', '회계부', '2021/05/13');
INSERT INTO Employee ( Em_num ,Em_name ,Em_sex, Em_bel,Em_syear)
values('Em010', '고양심', 'M', '기획부', '2020/08/17');

insert INTO Customer ( 	Co_num ,Co_name ,Co_hcall,Co_ccall,Co_add1,Co_add2,Co_birth,Co_job)
values('Co001', '김지한', '03183923830','010-3677-7509', '경기', '구리 1530','1974/02/25','프리랜서');
INSERT INTO Customer ( 	Co_num ,Co_name ,Co_hcall,Co_ccall,Co_add1,Co_add2,Co_birth,Co_job)
values('Co002', '서민정', '0318303830', '010-3357-4409', '경기', '냠양주 333', '1999/03/25','교사');
INSERT INTO Customer ( 	Co_num ,Co_name ,Co_hcall,Co_ccall,Co_add1,Co_add2,Co_birth,Co_job)
values('Co003', '이미연', '02183923830','010-4457-7449', '서울', '구로구 353', '2001/02/15','화가');
INSERT INTO Customer ( 	Co_num ,Co_name ,Co_hcall,Co_ccall,Co_add1,Co_add2,Co_birth,Co_job)
values('Co004', '공밀래', '02183932230','010-4456-7734', '서울', '강남구 423', '2003/02/02','경비');
INSERT INTO Customer ( 	Co_num ,Co_name ,Co_hcall,Co_ccall,Co_add1,Co_add2,Co_birth,Co_job)
values('Co005', '상록수', '03183934832','010-7745-4549', '경기','구리 6423', '1998/01/21','경찰');
INSERT INTO Customer ( 	Co_num ,Co_name ,Co_hcall,Co_ccall,Co_add1,Co_add2,Co_birth,Co_job)
values('Co006', '이현민', '03135623831','010-4675-6759', '부산','남포동 524', '1999/05/20','사업가');
INSERT INTO Customer ( 	Co_num ,Co_name ,Co_hcall,Co_ccall,Co_add1,Co_add2,Co_birth,Co_job)
values('Co007', '고밍정', '03135623830','010-3467-7765', '부산','조도 5232', '2001/06/27','자영업');
INSERT INTO Customer ( 	Co_num ,Co_name ,Co_hcall,Co_ccall,Co_add1,Co_add2,Co_birth,Co_job)
values('Co008', '엄친아', '02183923340','010-8736-7067', '대구','달성 356', '1994/07/21','회사원');
INSERT INTO Customer ( 	Co_num ,Co_name ,Co_hcall,Co_ccall,Co_add1,Co_add2,Co_birth,Co_job)
values('Co009', '박민영', '02183334830','010-4574-6754', '서울','강남구 352', '1999/09/10','회사원');
INSERT INTO Customer ( 	Co_num ,Co_name ,Co_hcall,Co_ccall,Co_add1,Co_add2,Co_birth,Co_job)
values('Co010', '김연수', '03183345383','010-9805-6766', '경기','구리시 2321', '1998/12/25','교사');

INSERT INTO purchase ( Pd_num,Co_num,P_total,P_totpr, P_date)
values('PD001','Co001', 15, 45000, '2023/05/22' );
INSERT INTO purchase ( Pd_num,Co_num,P_total,P_totpr, P_date)
values('PD002','Co001', 10, 40000, '2023/06/22' );
INSERT INTO purchase ( Pd_num,Co_num,P_total,P_totpr, P_date)
values('PD003','Co001', 15, 15000, '2023/03/22' );
INSERT INTO purchase ( Pd_num,Co_num,P_total,P_totpr, P_date)
values('PD001','Co002', 10, 30000, '2023/01/22' );
INSERT INTO purchase ( Pd_num,Co_num,P_total,P_totpr, P_date)
values('PD007','Co007', 15, 30000, '2023/05/22' );
INSERT INTO purchase ( Pd_num,Co_num,P_total,P_totpr, P_date)
values('PD001','Co004', 5, 6500, '2023/02/22' );
INSERT INTO purchase ( Pd_num,Co_num,P_total,P_totpr, P_date)
values('PD001','Co005', 10, 3000, '2023/03/22' );
INSERT INTO purchase ( Pd_num,Co_num,P_total,P_totpr, P_date)
values('PD002','Co006', 2, 8000, '2023/05/22' );
INSERT INTO purchase ( Pd_num,Co_num,P_total,P_totpr, P_date)
values('PD001','Co007', 3, 9000, '2023/03/10' );
INSERT INTO purchase ( Pd_num,Co_num,P_total,P_totpr, P_date)
values('PD001','Co008', 15, 45000, '2023/05/22' );


INSERT INTO Manufacturing ( Pd_num ,Ma_num ,M_price ,M_date )
values('PD001','Ma001',1500,'2023/01/22');
INSERT INTO Manufacturing ( Pd_num ,Ma_num ,M_price ,M_date )
values('PD002','Ma002',2000,'2023/01/22');
INSERT INTO Manufacturing ( Pd_num ,Ma_num ,M_price ,M_date )
values('PD003','Ma003',500,'2023/01/22');
INSERT INTO Manufacturing ( Pd_num ,Ma_num ,M_price ,M_date )
values('PD004','Ma001',1500,'2023/01/22');
INSERT INTO Manufacturing ( Pd_num ,Ma_num ,M_price ,M_date )
values('PD005','Ma002',1000,'2023/01/22');
INSERT INTO Manufacturing ( Pd_num ,Ma_num ,M_price ,M_date )
values('PD006','Ma005',3500,'2023/01/22');
INSERT INTO Manufacturing ( Pd_num ,Ma_num ,M_price ,M_date )
values('PD007','Ma003',500,'2023/01/22');
INSERT INTO Manufacturing ( Pd_num ,Ma_num ,M_price ,M_date )
values('PD008','Ma002',3000,'2023/01/22');
INSERT INTO Manufacturing ( Pd_num ,Ma_num ,M_price ,M_date )
values('PD009','Ma005',1500,'2023/01/22');
INSERT INTO Manufacturing ( Pd_num ,Ma_num ,M_price ,M_date )
values('PD010','Ma001',1500,'2023/01/22');



select * from customer where Co_add2 like '%구리%';

select Co_add1 as '지역', count(Co_num) as '고객수' from Customer
group by Co_add1;

select * from Customer where Co_name = '김지한';
select * from purchase where Co_num = 'Co001';

select * from (select Pd_name, Pd_price from Product) as PD, (select * from purchase) as Pu where Pu.Co_num = 'Co001';

select Pr.Pd_name as '상품명', Pr.Pd_price as '판매가격', Pu.P_total as'구매수량',pu.P_date as'구매일' from
    (select Pd_name, Pd_price, Pd_num from Product) As Pr join (select *  from Purchase where Co_num = 'Co001') As Pu
                                                               on Pr.Pd_num = Pu.Pd_num
where Pr.Pd_name = '사과';

select Pr.Pd_name as 품목,Pu.SU as 판매개수,Pu.SU* Pr.Pd_price as '판매금액합계' from
    (select Pd_num, sum(P_total) as SU from Purchase group by Pd_num) as Pu join
    (select Pd_name,Pd_num, Pd_price from Product) as Pr on Pu.Pd_num = Pr.Pd_num;

select * from Manufacturing;