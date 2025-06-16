SELECT * FROM new_madangdb.new_book;
-- insert 추가
insert into new_book
(bookid, bname, pubname,price)
values
(4, '축구의 이해', '대한미디어', 22000);

insert into new_book
(bname, pubname)
value
('aaa','bbb');

-- update 변경
UPDATE `new_madangdb`.`new_book` 
SET `bookid` = '3', `bname` = '골프 바이블', `price` = '35000' 
WHERE (`bookid` = '3');

UPDATE `new_madangdb`.`new_book`
SET
`price` = 9000
WHERE `bookid` =1;

-- delete 삭제
DELETE FROM new_book
    WHERE bookid = 4;
