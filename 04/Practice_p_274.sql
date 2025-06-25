-- p.274
-- 문자열 처리 문제
-- (1) 사원(employees)의 이름이 8자 이상인 사원의 정보를 출력하시오.
select *
from employees
where char_length(concat(last_name,first_name)) >= 8; 

-- (2) 이름의 첫 글자가 대문자인 사원의 정보를 출력하시오.
select *
from employees
-- where first_name REGEXP '^[A-Z]';
-- where first_name between 'A' and 'Z';
where ascii(left(first_name,1)) between ascii('A') and ascii('Z');

-- (3) 사원의 성의 2번째 문자가 'c'인 사원의 이름과 이름의 길이를 출력하시오.
select concat(last_name,first_name)'이름',char_length(last_name)'이름의 길이'
from employees
where last_name like '_c%';

-- (4) 주소 중 거리 이름의 문자 길이가 최소인 지역(locations)을 출력하시오.
select city
from locations
where char_length(street_address) = (
	select min(char_length(street_address))
	from locations);

-- (5) 이름이 'A', 'J', 'M'으로 시작하는 사원의 이름과 이름의 길이를 출력하시오.
select concat(first_name, last_name) '이름' , char_length(concat(first_name, last_name)) '이름의 길이'
from employees
where first_name REGEXP '^[AJM]';



-- DATE타입 처리 문제
-- (6) 1987년에 입사한 사원의 이름을 나타내시오.
select *
from employees
where hire_date between '1987-01-01' and  '1987-12-31';


-- (7) 사원의 이름, 입사년도, 근무년수를 출력하시오.



-- (8) '1987-06-01'과 '1987-07-30' 사이에 입사한 사원의 이름과 입사일을 나타내시오.
select *
from employees
where hire_date between '1987-06-01' and  '1987-07-30';


-- (9) 6월에 입사한 사원의 이름과 성을 출력하시오.
select *
from employees
where month(hire_date) = 6;


-- (10) 부서별, 연도별 입사한 사원의 수를 구하시오.
select department_id, year(hire_date), count(*)
from employeesphonebook
group by department_id, year(hire_date)
order by department_id;
