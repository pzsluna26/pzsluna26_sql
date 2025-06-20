
-- 평균 주문금액 이하의 주문에 대해서 주문번호와 금액을 나타내시오.
select orderid, saleprice
from orders
where saleprice <= (select avg(saleprice)
					from orders);

-- 각 고객의 평균 주문금액보다 큰 금액의 주문 내역에 대해서 주문번호, 고객번호, 금액을 나타내시오.
select orderid '주문번호', custid '고객번호', saleprice '금액'
from orders 
where saleprice >= (select avg(o.saleprice)
					from orders o
					join customer c on o.custid = c.custid);
                    
-- 대한민국에 거주하는 고객에게 판매한 도서의 총판매액을 구하시오.
select sum(saleprice)
from orders o
join customer c on o.custid = c.custid
where c.address like '대한민국%';

-- 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 판매금액을 보이시오.alter
select custid'주문번호', saleprice'판매금액'
from orders
where saleprice > (select max(saleprice)
					from orders
                    where custid='3');
                    
-- EXISTS 연산자를 사용하여 대한민국에 거주하는 고객에게 판매한 도서의 총판매액을 구하시오.
select sum(saleprice)
from orders o
join customer c on c.custid = o.custid
where exists(select custid
			from customer
			where address like '대한민국%');
            
-- 마당 서점의 고객별 판매액을 나타내시오 (고객이름과 고객별 판매액 출력)
-- 주문안한 고객은 테이블에 반영이 안되는 문제가 발생! => left outer join 사용하기!
-- 박세리가 주문을 안했어서 null 로 표시됨 => ifnull()로 null을 0으로 바꿔주기!
select c.custid'고객번호', c.name'고객이름', ifnull(sum(saleprice),0)'판매액'
from customer c left outer join orders o
	on o.custid = c.custid
group by c.custid;

-- orders 테이블에 각 주문에 맞는 도서이름을 입력하시오.alter
select o.orderid'주문번호', b.bookname'도서이름'
from orders o
join book b on o.bookid = b.bookid;

-- 고객번호가 2 이하인 고객의 판매액을 나타내시오 (고객이름과 고객별 판매액 출력)

-- ----------------------------------------------------------------------------------------
-- 복습
select c.custid, c.name, sum(o.saleprice) total
from book b, orders o, customer c
where b.bookid = o.bookid
	and o.custid = c.custid
group by c.custid;