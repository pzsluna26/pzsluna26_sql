-- view 생성
-- 4-20.
create view vw_Customer
as select *
from customer
where address like '%대한민국%';

-- 4-21
create view vw_Order(orderid, custid, name, bookid, bookname, saleprice, orderdate)
as select o.orderid, o.custid, c.name, o.bookid, b.bookname, o.saleprice, o.orderdate
from orders o, customer c, book b
where o.custid = c.custid and o.bookid = b.bookid;
-- ----------------------------------------------------------------------------------------------------------
-- 4. 뷰 만들기 (가상 테이블)
-- : 기존 테이블들을 기반으로 특정 목적을 위한 가상의 테이블인 뷰(VIEW)를 생성하고 관리하는 문제입니다.

-- 판매가격이 20,000원 이상인 도서의 도서번호, 도서이름, 고객이름, 출판사, 판매가격을 보여주는 highorders 뷰를 생성하시오. (문제 12-1)
create view highorders (bookid, bookname, name, publisher, saleprice)
as select b.bookid, b.bookname, c.name, b.publisher, o.saleprice
from orders o, customer c, book b
where o.custid = c.custid 
	and o.bookid = b.bookid
	and saleprice >= 20000;

-- 생성된 highorders 뷰를 이용하여 판매된 도서의 이름과 고객의 이름을 출력하는 SQL 문을 작성하시오.
select bookname, name
from highorders;

-- highorders 뷰의 정의를 변경하여 판매가격 속성을 제외하시오. (문제 12-3)
DROP VIEW IF EXISTS saleprice;
create view highorders (bookid, bookname, name, publisher)
as select b.bookid, b.bookname, c.name, b.publisher
from orders o, customer c, book b
where o.custid = c.custid and o.bookid = b.bookid