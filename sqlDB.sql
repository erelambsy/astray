drop database if exists sqldb;
create database sqldb; 

use sqldb;
create table usertbl
(userID  char(8) not null primary key,
name     varchar(10) not null,
birthyear int not null,
addr    char(2) not null,
mobile1 char(3),
mobile2 char(8),
height  smallint,
mdate   DATE
);

create TABLE buytbl
( num    int AUTO_INCREMENT not null PRIMARY key,
userID  char(8) not null,
prodName char(6) not null,
groupName char(4),
price int not null,
amount smallint not null,
foreign key (userID) references usertbl(userID)
);

insert into usertbl values('LSG','이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
insert into usertbl values('KBS','김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
insert into usertbl values('KKH','김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
insert into usertbl values('JYP','조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
insert into usertbl values('SSK','성시경', 1979, '서울', NULL, NULL, 186, '2013-12-12');
insert into usertbl values('LJB','임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
insert into usertbl values('YJS','윤종신', 1969, '경남', NULL, NULL, 170, '2005-5-5');
insert into usertbl values('EJW','은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
insert into usertbl values('JKW','조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
insert into usertbl values('BBK','바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');
insert into buytbl values(NULL, 'KBS', '운동화', NULL, 30, 2);
insert into buytbl values(NULL, 'KBS', '노트북', '전자' ,1000, 1);
insert into buytbl values(NULL, 'JYP', '모니터', '전자' ,200, 1);
insert into buytbl values(NULL, 'BBK', '모니터', '전자' ,200, 5);
insert into buytbl values(NULL, 'KBS', '청바지', '의류' ,50, 3);
insert into buytbl values(NULL, 'BBK', '메모리', '전자' ,80, 10);
insert into buytbl values(NULL, 'SSK', '책', '서적' ,15, 5);
insert into buytbl values(NULL, 'EJW', '책', '서적' ,15, 2);
insert into buytbl values(NULL, 'EJW', '청바지', '의류' ,50, 1);
insert into buytbl values(NULL, 'BBK', '운동화', NULL ,30, 2);
insert into buytbl values(NULL, 'EJW', '책', '서적' ,15, 1);
insert into buytbl values(NULL, 'BBK', '운동화', NULL ,30, 2);

SELECT*from usertbl;
SELECT*from buytbl;

SELECT*from testtbl2;
SELECT*from testtbl3;
SELECT*from testtbl4;
SELECT*from testtbl5;

delete from testtbl4 where fname='Aamer';

delete from testtbl4 where fname='Aamer' limit 5;

use sqldb;
create TABLE bigtbl1(SELECT*from employees.employees);
create TABLE bigtbl2(SELECT*from employees.employees);
create TABLE bigtbl3(SELECT*from employees.employees);

SELECT*from  bigtbl1;
SELECT*from  bigtbl2;

delete from bigtbl1;
drop table bigtbl2;
truncate table bigtbl3;

SELECT*from  bigtbl3;


use sqldb;
create table membertbl (select userID, name, addr from usertbl limit 3);
alter table membertbl
  add CONSTRAINT pk_membertbl primary key(userID); 	
select*from membertbl;
insert into membertbl values('BBK', '비비코', '미국');
insert into membertbl values('SJH', '서장훈', '서울');
insert into membertbl values('HJY', '현주엽', '경기');


insert into membertbl values('BBK', '비비코', '미국')
   on duplicate key update name= '비비코', addr='미국';
insert into membertbl values('DJM', '동짜몽', '일본')
   on duplicate key update name= '동짜몽', addr='일본';
SELECT*from  membertbl;

select cast('2024-04-23 11:23:29.123' as date)as 'date';
select cast('2024-04-23 11:23:29.123' as time)as 'time';
select cast('2024-04-23 11:23:29.123' as datetime)as 'datetime';

use sqldb;
select userid as '사용자', sum(price*amount) as '총구매액'
from buytbl group by userid;

select* from abc order by total desc;

with abc(userid, total)
as
(select userid , sum(price*amount) 
from buytbl group by userid)
select* from abc order by total desc;

select addr, max(height) from usertbl GROUP BY addr;

WITH cte_usertbl(addr, maxheight) 
as
(select addr, max(height) from usertbl group by addr)
select avg(maxheight*1.0) as '각 지역멸 최고키의 평균' from cte_usertbl;

with
AAA(컬럼들)
AS (AAA의 쿼리문),
  BBB(컬럼들)
    as (BBB의 쿼리문),
  CCC(컬럼들)
    AS (CCC의 쿼리문)
 select* from [AAA 또는 BBB 또는 CCC]; 


