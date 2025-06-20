-- union all 합집합
-- 3-32
select name
from customer
where address like '대한민국%'
union
select name
from customer
where custid in (select custid from orders);

-- 3-33. 주문이 있는 고객의 이름과 주소를 나타내시오
-- EXISTS는 **"서브쿼리의 결과가 하나라도 존재하면 true"**가 되는 조건입니다.
-- 즉, customer 테이블의 각 행에 대해, 해당 고객이 orders 테이블에 주문 기록이 있는지를 확인합니다.
select name, address
from customer cs
where exists (select *
				from orders od
                where cs.custid = od.custid);
                
-- 3-34. 