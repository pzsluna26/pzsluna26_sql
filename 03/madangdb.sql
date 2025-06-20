-- 3.1 모든 도서의 이름과 가격을 검색하시오.
select bookname, price
from book;

-- 3.2 모든 도서의 도서이름, 출판사, 가격을 검색하시오.
select bookname, publisher, price
from book;

-- 3.3 도서 테이블에 있는 모든 출판사를 검색하시오.
select distinct publisher
from book;

select publisher
from book
group by publisher;

-- 3.4 가격이 20,000원 미만인 도서를 검색하시오.
select *
from book
where price < 20000;

-- 3.5 가격이 10,000원 이상 20,000원 이하인 도서를 검색하시오.
select booknambooke, price
from book
-- where 10000 <=  AND price <=20000 ;
where price BETWEEN 10000 AND 20000;

-- 3.6 출판사가 "굿스포츠" 혹은 "대한미디어"인 도서를 검색하시오.
select bookname, publisher
from book
-- where publisher in ('굿스포츠', '대한미디어');
WHERE PUBLISHER = '굿스포츠' OR PUBLISHER = '대한미디어';

-- 3.7 "축구의 역사"를 출간한 출판사를 검색하시오."
select publisher
from book
where bookname = '축구의 역사';

-- 3.8 도서이름에 "축구"가 포함된 출판사를 검색하시오.
select bookname, publisher
from book
where bookname LIKE '%축구%';

-- 3.9 도서이름의 왼쪽 두 번째 위치에 '구'라는 문자열을 갖는 도서를 검색하시오.
select *
from book
where bookname like '_구%';

-- 3-10 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색하시오.
select *
from book
where bookname like '축구%' AND price >= 20000;

-- 3-11 출판사가 "굿스포츠" 혹은 "대한미디어"인 도서를 검색하시오.
select *
from book
where publisher ='굿스포츠' or publisher ='대한미디어';

-- 3.12 도서를 이름순으로 검색하시오.
select *
from book
ORDER BY bookname ASC;

-- 3.13 도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색하시오.
select *
from book
order by price, BOOKNAME;

-- 3-14 도서를 가격의 내림차순으로 검색하시오. 가격이 같다면 출판사를 오름차순으로 출력하시오.
select *
from book
order by price desc, publisher asc;

