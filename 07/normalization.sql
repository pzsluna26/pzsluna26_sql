SELECT * FROM ch07.studentcourse;

-- studentcourse ------------------------------------------------------------------------------------
start transaction;
delete from studentcourse 
where student_id = 402;

select *
from studentcourse;

delete from studentcourse
where student_id = 501
	and  course_name = '자료구조';
    
rollback;

start transaction;
insert into studentcourse
(student_id, student_name, department)
values
(503, '박세리', '체육학과');

select course_name, count(*)
from studentcourse
group by course_name;

start transaction;

-- 안전 모드 비활성화
set sql_safe_updates =0;

update studentcourse
set address = '대한민국 서울'
where student_id = 501;


-- summer -------------------------------------------------------------------------------------------
-- 안전 모드 활성화
set sql_safe_updates =1;

select price
from summer
where class = 'c';

select *
from summer
order by price desc
limit 1;

select count(*), sum(price)
from summer;

select * from summer;

start transaction;
set sql_safe_updates =0;
delete from summer
where sid = 200;
set sql_safe_updates =1;
rollback;

start transaction;
insert into summer (class, price)
values ('C++', 25000);

select count(*), sum(price)
from summer;


-- realestate -----------------------------------------------------------------------------------------
select 필지번호, 주민등록번호, count(*)
from realestate
group by 필지번호, 주민등록번호;

select *
from realestate;


create table owners
select 주민등록번호, 소유자이름, 전화번호
from realestate
group by 주민등록번호, 소유자이름, 전화번호;

create table parcel
select 필지번호, 주소, 공시지가
from realestate
group by 필지번호, 주소, 공시지가;


-- -----------------------------------------------------------------------------------------------------
rollback;

start transaction;

