insert into  new_book
(bookid, bname, pubname, price)
values
(1, 'AAA','BBB', 10000);

insert into new_order
(oderid, custid, bookid, saleprice, orderdate)
values
(1,1,1,20000,curdate()); -- curdate() => 현재날짜를 반환하는 함수

insert into new_customer
(custid, name, address, phone)
value
(1,'KKK', 'DDDDD', '01011111111');