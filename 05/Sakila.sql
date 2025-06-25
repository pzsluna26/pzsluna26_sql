-- 1. 기본 조회 및 필터링 (Basic Retrieval & Filtering)
-- 문제 2: 특정 지역 고객 대상 마케팅**
-- **시나리오:** 캐나다에 거주하는 고객들을 대상으로 새로운 프로모션 이벤트를 진행하기로 했습니다. 이들에게 발송할 이메일 목록이 필요합니다.
-- **요구사항:** `customer`, `address`, `city`, `country` 테이블을 참조하여, 국가(country)가 'Canada'인 모든 고객의 이름과 이메일 주소를 조회하세요.
select cu.*
from customer cu, country c, city ci, address a
where country = 'Canada'
	and c.country_id = ci.country_id
    and ci.city_id = a.city_id
    and a.address_id = cu.address_id;



-- 2. 조인 및 관계 (Joins & Relationships)
-- 문제 3: 특정 고객의 대여 기록 조회**
-- **시나리오:** 고객 'MARY SMITH'가 자신의 전체 대여 기록과 각 영화에 대해 얼마를 지불했는지 확인을 요청했습니다.
-- **요구사항:** 고객 'MARY SMITH'가 대여한 모든 영화의 제목, 대여 날짜, 지불 금액을 조회하세요.
select *
from customer cu, rental r, inventory i, film f, payment p
WHERE cu.first_name = 'MARY' AND cu.last_name = 'SMITH';
 
SELECT f.title, r.rental_date, p.amount
FROM customer cu
JOIN rental r ON cu.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN payment p ON r.rental_id = p.rental_id
WHERE cu.first_name = 'MARY' AND cu.last_name = 'SMITH';



-- 3. 집계 및 그룹화 (Aggregation & Grouping)
-- 문제 2: VIP 고객 선정**
-- **시나리오:** 연말을 맞아, 올해 가장 많은 금액을 지출한 상위 5명의 우수 고객(VIP)을 선정하여 특별 선물을 증정하려고 합니다.
-- **요구사항:** 총 지출액을 기준으로 상위 5명의 고객 이름과 총 지출 금액을 조회하세요.
select concat(first_name, ' ',last_name)'full_name', sum(p.amount)'total_spent'
from payment p
join customer cu on cu.customer_id = p.customer_id
group by cu.customer_id
order by sum(amount) desc
limit 5;



### 4. 데이터 조작 및 날짜 함수 (Data Manipulation & Date Functions)
-- **문제 1: 주간 대여 트렌드 분석**
-- **시나리오:** 요일별 대여 패턴을 분석하여 주말과 주중의 직원 스케줄을 효율적으로 조정하려고 합니다.
-- **요구사항:** 각 요일(월요일, 화요일, ...)별로 총 몇 건의 대여가 발생했는지 계산하세요.
select dayofweek(rental_date) weekday, min(case when dayofweek(rental_date) =1 then 'Sun'
										when dayofweek(rental_date) = 2 then 'Mon'
                                        when dayofweek(rental_date) = 3 then 'Tue'
                                        when dayofweek(rental_date) = 4 then 'Wed'
                                        when dayofweek(rental_date) = 5 then 'Thu'
                                        when dayofweek(rental_date) = 6 then 'Fri'
                                        when dayofweek(rental_date) = 7 then 'Sat'
END) weekday_name,
  COUNT(*) AS rental_count
FROM rental
GROUP BY dayofweek(rental_date)
ORDER BY weekday;




### 5. 문자열 조작 (String Manipulation)
-- **문제 2: 고객 전체 이름 목록 만들기**
-- **시나리오:** 고객 관리 시스템에 `first_name`과 `last_name`을 합친 '전체 이름(Full Name)' 필드가 필요합니다.
-- **요구사항:** `customer` 테이블에서 `first_name`과 `last_name`을 합쳐 'Full Name'이라는 하나의 열로 표시하세요. (예: 'MARY SMITH')
select concat(first_name, ' ', last_name)'Full Name'
from customer;




### 6. 서브쿼리 (Subqueries)
-- **문제 2: 특정 카테고리 영화를 대여한 고객 찾기**
-- **시나리오:** '액션(Action)' 영화 팬들을 대상으로 신작 액션 영화 홍보 이메일을 보내려고 합니다.
-- **요구사항:** 'Action' 카테고리의 영화를 한 번이라도 대여한 적이 있는 모든 고객의 이름과 이메일 주소를 조회하세요. (중복 제외)
select concat(first_name, last_name)fullname, email
from category c, film_category fc, inventory i, rental r, customer cu
where c.name = 'Action'
	and c.category_id = fc.category_id
    and fc.film_id = i.film_id
    and i.inventory_id = r.inventory_id
    and r.customer_id = cu.customer_id
group by cu.customer_id;




-- 7. 데이터 조작 (DML: INSERT, UPDATE, DELETE)
-- **문제 1: 신규 대여 및 결제 기록 생성**
-- **시나리오:** 고객 'MARY SMITH' (customer_id: 1)가 1번 매장(store_id: 1)에서 직원 'Mike Hillyer' (staff_id: 1)를 통해 영화 'ACADEMY DINOSAUR'의 재고품(inventory_id: 1)을 대여했습니다. 이 영화의 대여료는 4.99입니다. 대여와 동시에 결제가 완료되었으며, 이 사실을 시스템에 기록해야 합니다.
-- **요구사항:**
-- 1. `rental` 테이블에 위의 정보를 바탕으로 새로운 대여 기록을 추가하세요. `rental_date`는 현재 시간으로 설정하고 `return_date`는 `NULL`로 둡니다.
-- 2. 동시에 `payment` 테이블에 해당 대여(`rental_id` 참조)에 대한 결제 기록을 추가하세요. `payment_date`는 현재 시간으로 설정하고, `amount`는 4.99로, `staff_id`와 `customer_id`는 대여 기록과 동일하게 설정합니다.
start transaction;
set @cnt=0;
select count(*) into @cnt
from rental r
where r.inventory_id = 1
	and return_date is null;
    
    commit;;
    rollback;
    select'ok';

select @cnt;

if @cnt = 0 then
insert into rental(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
	values(16100, now(), 1248, 1, null, 1, '2006-02-15');
    
set @rental_id =0;
select last_insert_id() into @rental_id;
select rental_id;
    
    
    
    
-- **문제 2: 영화 반납 정보 업데이트**
-- **시나리오:** 고객이 대여했던 영화를 반납했습니다. 시스템에 해당 영화의 반납 상태를 업데이트해야 합니다.
-- **요구사항:** 가장 최근에 대여된(가장 큰 `rental_id`를 가진) 영화가 반납되었다고 가정하고, 
-- 해당 대여 건의 `return_date`를 현재 시간으로 업데이트하여 반납 처리를 완료하세요.
update rental
set return_Date = now()
where customer_id = 1
	and 



-- **문제 3: 신규 고객 정보 등록**
-- **시나리오:** 새로운 고객 'John Doe'가 1번 매장에 가입했습니다. 그의 정보를 시스템에 등록해야 합니다.
-- **요구사항:** `customer` 테이블에 다음 정보를 가진 새로운 고객을 추가하세요. 
-- (이름: John Doe, 이메일: john.doe@example.com, 주소 ID: 5, 매장 ID: 1)    



### 8. 뷰 만들기 (View Creation)
-- **문제 3: 활성 고객 연락처 목록 뷰**
-- **시나리오:** 고객 서비스팀에서 현재 활동 중인 고객들에게 연락하기 위해, 이름, 이메일, 전화번호, 주소 정보가 포함된 최신 목록이 정기적으로 필요합니다.
-- **요구사항:** 현재 활동 중인(`active = 1`) 고객의 전체 이름, 이메일, 전화번호, 전체 주소(주소, 도시, 국가)를 포함하는 `active_customer_list`라는 이름의 뷰(VIEW)를 생성하세요.
select concat(first_name, ' ',  last_name) fullname, email,
concat(country, ' ', city, ' ', address) address_name
from country c, city ci, address a, customer cu
where cu.active = 1
and c.country_id = ci.country_id
and ci.city_id = a.city_id
and a.address_id = cu.address_id;

