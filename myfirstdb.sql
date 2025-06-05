select *
from phonebook;
update phonebook
set home='051-999-9999', company='051-999-9998'
where id='3';
update phonebook
set home='051-888-8888', company='051-888-8888'
where id='5';
update phonebook
set home='051-888-1111', company='051-888-1111'
where id ='6';
delete from phonebook
where id = '7';