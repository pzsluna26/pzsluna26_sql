use madangdb;

-- 방어코드
select ifnull(sum(saleprice),0)* count(*) QTY
from orders
where orderdate = '2025-06-30';

select case when orderdate is null then 1
			when orderdate = '2024-07-07' then 1
			else 0
		end
from orders;

-- 이름, 전화번호가 포함된 고객 목록을 나타내시오. 
select name, phone
from customer;

-- 단, 전화번호가 없는 고객은 '연락처 없음'으로 표시하시오.
select custid'고객ID', name'이름', ifnull(phone,'연락처없음')'전화번호'
from customer;

-- 고객 목록에서 고객번호, 이름, 전화번호를 앞의 2명만 나타내시오.
-- set @seq = 0;
-- select (@seq:=@seq+1) '순번',custid, name, phone
-- from customer
-- where @seq < 2;
-- 위 식과 같은 식임
select *
from customer
limit 2;

-- (1+2) +5 !! => 괄호 안 식에 또 쿼리 날리기. 쿼리를 날리면 테이블이 온다
select custid, name
from 
(
	select custid, name
    from customer
    where custid = 1
)A;