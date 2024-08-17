-- create database shop;

-- drop database shop;
use shop;
-- insert into item(id,title,price) values (1, '셔츠', 7000);
-- insert into item(id,title,price) values (2, '바지', 5000);
-- insert into item(id,title,price) values (3, '자켓', 6000); 
-- insert into item(id,title,price) values (4, 'TV',23000); 
-- insert into item(id,title,price) values (5, '선풍기', 36000); 
-- insert into item(id,title,price) values (6, '사이다', 16000); 

INSERT INTO board (id, date, title) VALUES (1, CAST('2024-01-01 00:00:00' AS DATETIME(6)), '오늘은 좋은날');
INSERT INTO board (id, date, title) VALUES (2, CAST('2024-02-01 00:00:00' AS DATETIME(6)), '안녕 오늘 이벤트야');
INSERT INTO board (id, date, title) VALUES (3, CAST('2024-03-01 00:00:00' AS DATETIME(6)), '드디어 이벤트다');