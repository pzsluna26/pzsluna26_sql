-- p.319 7번
call GetBookFromPublisher();

select bookname
from book b
where b.price > (select avg(b1.price)
				from book b1
                where b1.publisher = b.publisher);
                
call get_books_more_than_avg();
select c.name , count(*) '구매량', ifnull(sum(o.saleprice),0) '총구매액'
from customer c left outer join orders o	
		on c.custid = o.custid
        group by c.custid
        order by 총구매액 desc;
        