-- ex20_p214
-- 1. 성이 'Matos' 또는 'Taylor'인 직원의 성(last_name), 직무 ID(job_id), 입사일(hire_date)을 조회하시오. (단, 입사일이 빠른 순서로 정렬)
select last_name as '성', job_id as '직무ID', hire_date as '입사일'
from employees
where last_name in ('Matos', 'Taylor')
order by hire_date;

-- 2. 1994년도에 입사한 모든 직원의 성(last_name)과 입사일(hire_date)을 표시하는 보고서를 작성하시오.
select last_name as '성', hire_date as '입사일'
from employees
where hire_date like '1994%';

-- 3. 직무명(job_title)이 'Sales Representative' 또는 'Stock Clerk'인 직원 중,
--    급여(salary)가 2,500, 3,500, 7,000이 아닌 모든 직원의 성(last_name), 직무명(job_title), 급여(salary)를 출력하시오.
SELECT e.last_name AS '성', j.job_title AS '직무명', e.salary AS '급여'
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE j.job_title IN ('Sales Representative', 'Stock Clerk')
  AND e.salary NOT IN (2500, 3500, 7000);


-- 4. 전체 관리자(manager)의 수를 출력하시오. 열의 제목은 'NumberofManagers'로 지정하고,
--    중복되는 관리자는 한 번만 세도록 하시오.
select  count(distinct manager_id) as 'NumberofManagers'
from employees;

-- 5. 관리자별로 소속된 직원들의 최소 급여를 구하되,
--    그 최소 급여가 6,000 이상인 관리자의 관리자 ID(manager_id)와 최소 급여(salary)를 출력하시오.
--    (단, 관리자가 없는 직원은 결과에서 제외하며, 급여가 낮은 순으로 정렬)
select manager_id as '관리자ID', min(salary) as '최소급여'
from employees
where manager_id is not null
group by manager_id
having min(salary) >= 6000
order by min(salary);

-- 6. 각 직원의 성(last_name)과 사원 번호(employee_id),
--    그리고 그 직원의 관리자 성(last_name)과 관리자 번호(manager_id)를 함께 표시하는 보고서를 작성하시오.
--    열의 제목은 각각 Employee, Emp#, Manager, Mgr#로 지정하시오.
select e.last_name as 'Employee', 
	   e.employee_id as 'Emp#', 
       m.last_name as 'Manager', 
       m.manager_id as 'Mgr#'
from employees e
join employees m on e.employee_id = m.employee_id;

-- 7. 직원 'Abel'과 동일한 부서에서 근무하는 모든 직원의 성(last_name)과 부서 번호(department_id)를 출력하시오.
--    (단, 'Abel' 자신은 결과에서 제외)
SELECT last_name, first_name, department_id
FROM employees
WHERE last_name LIKE '%abel%';

-- 8. 'Executive' 부서에 속한 모든 직원의 부서 번호(department_id), 성(last_name), 직무 ID(job_id)를 출력하시오.

-- 9. 'King'에게 직접 또는 간접적으로 보고하는 모든 직원의 성(last_name)과 급여(salary)를 조회하시오.

-- 10. 'ST_CLERK' 직무 ID를 가진 직원이 한 명도 없는 부서의 부서 ID(department_id)를 모두 조회하시오.
--     (단, 직원이 한 명도 소속되지 않은 부서도 결과에 포함하시오.)
select d.department_id
from departments d
where not exists (
	select 1 from employees e where e.department_id = d.department_id
    and e.job_id = 'ST_CLERK');
    
    select count(*)
    from hr.departments d;