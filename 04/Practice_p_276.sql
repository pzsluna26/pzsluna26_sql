-- p.276
-- 이름이 'Scarlett'인 배우의 정보를 나타내시오.
select *
from actor
where first_name = 'Scarlett';

-- 성이 'Johansson'인 배우의 정보를 나타내시오.
select *
from actor
where last_name = 'Johansson';

-- 배우의 성에서 중복을 제거하고 모두 나타내시오.
select last_name
from actor
group by last_name;

-- 배우의 성이 중복이 없는 경우를 모두 나타내시오.
select last_name
from actor
group by last_name
having count(*) = 1;

-- 배우의 성이 중복이 있는 경우를 모두 나타내시오.
select last_name
from actor
group by last_name
having count(*) > 1;

-- 영화에 가장 많이 등장하는 배우를 찾으시오.
SELECT a.actor_id, a.first_name, a.last_name, COUNT(*) AS film_count
FROM actor a
JOIN film_actor f ON a.actor_id = f.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY film_count DESC
LIMIT 1;


-- 7번. 대여점 1번에서 'Academy Dinosaur'가 있는지 확인하시오.
select i.*
from inventory i
join film f on f.film_id = i.film_id 
where f.title = 'Academy Dinosaur' 
	and store_id=1;
    
-- 7번 응용. 그냥 유무만 확인하고싶을 때의 쿼리
SELECT EXISTS (
  SELECT 1
  FROM inventory i
  JOIN film f ON f.film_id = i.film_id
  WHERE f.title = 'Academy Dinosaur' AND i.store_id = 1
) AS is_available;

-- 8번. Mary Smith가 'Academy Dinosaur'를 1번 지점인 from Mike Hillyer에서 대여했다는 내용을 삽입하시오.
INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id)
SELECT
  NOW(),
  i.inventory_id,
  c.customer_id,
  s.staff_id
FROM inventory i
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON c.first_name = 'Mary' AND c.last_name = 'Smith'
JOIN staff s ON s.first_name = 'Mike' AND s.last_name = 'Hillyer'
WHERE f.title = 'Academy Dinosaur' AND i.store_id = 1
LIMIT 1;

-- 'Academy Dinosaur'는 언제까지 대여 중인지 나타내시오.
select rental_date'대여일', return_date'반납일'
from rental;

-- sakila db 영화의 평균 시간을 나타내시오.
select avg(length)
from film;

-- sakila db 영화의 평균 시간을 카테고리별로 나타내시오.
select fc.category_id, round(avg(length),0)
from film f
join film_category fc on f.film_id = fc.film_id
group by fc.category_id;

-- 다음과 같이 질의 했을 때 결과가 없는 이유를 살펴보시오.
select *
from film 
NATURAL JOIN inventory;
