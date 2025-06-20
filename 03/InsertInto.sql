insert into  new_book
(bname, pubname)
values
('AAA','BBB');

select curdate();

insert into new_orders
(orderid, custid, bookid, saleprice, orderdate)
values
(1,2,1,20000, curdate()); -- curdate() => 현재날짜를 반환하는 함수

insert into new_customer
(custid, name, address, phone)
value
(2,'KKK', 'DDDDD', '01011111111');