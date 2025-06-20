-- P.220 표 실습
SELECT MIN(val) FROM (SELECT 1 AS val UNION SELECT 2 UNION SELECT 3) AS t;

select char_length("안녕하세요");
select curdate();
select current_date();
select current_timestamp();
select curdate() as 대여일 ,adddate(curdate(), interval 14 day) AS 반납일;

-- -78 과 +78의 절대값을 구하시오.
select abs(-78);
select abs(78);

-- 4,875를 소수 첫째 자리까지 반올림한 값을 구하시오.
select round(4.875, 1);

-- 고객별 평균 주문 금액을 100원 단위로 반올림한 값을 구하시오.
select custid '고객번호', round(sum(saleprice)/count(*), -2) '평균금액'
from orders
group by custid;

-- 도서 제목에 야구가 포함된 도서를 농구로 변경한 후 도서 목록을 나타내시오.
select bookid, replace(bookname, '야구', '농구')
from book;

-- 굿스포츠에서 출판한 도서의 제목과 제목의 문자 수, 바이트 수를 나타내시오.
select bookname, char_length(bookname), b
-- 마당서점의 고객 중에서 성이 같은 사람이 몇 명이나 되는지 알고 싶다. 성별 인원수를 구하시오.

-- 마당서점은 주문일로부터 10일 후에 매출을 확정한다. 각 주문의 확정일자를 구하시오.

-- 마당 서점이 2024년 7월 7일에 주문받은 도서의 주문번호, 주문일, 고객번호, 도서번호를 모두 나타내시오. 단, 주문일은 '%Y-%m-%d' 형태로 표시한다.

-- DBMS 서버에 설정된 현재 날짜와 시간, 요일을 확인하시오.
select dayofweek(curdate()),
week(curdate()),
weekday(curdate()),
weekofyear(curdate()),
yearweek(curdate());

