-- ex19_p214

-- 3. employees와 departments테이블에 저장된 투플의 개수를 출력하시오.
select *
from employees, departments;

-- 4.employees 테이블에 대한 employee_id,last_name, job_id, hire_date 를 출력하시오
select e.employee_id, e.last_name, e.job_id, e.hire_date
from employees e
join job_history j on e.employee_id=j.employee_id;

-- 5. employees 테이블에서 salary가 12000이상인 직원의 last_name과 salary를 출력하시오
select last_name, salary
from employees
where salary >= 12000;

-- 6.부서번호(department_id)가 20 혹은 50인 직원의 last_name과 department_id 를 last_name에 대하여 오름차순으로 출력하시오.
select last_name, department_id
from employees
where department_id = 20 or department_id = 50;

-- 7. last_name의 세번째에 a가 들어가는 직원의 last_name을 출력하시오.
select last_name
from employees
where last_name like '__a';

-- 8. 같은 일을 하는 사람의 수를 세어 출력하시오.
select job_id, count(*)
from employees
group by job_id;

-- 9. toronto에서 일하는 직원의 last_name, job, department_id, department_name 을 출력하시오.
select e.last_name, e.job_id, d.department_id, d.department_name
from employees e
join departments d on e.department_id=d.department_id
join locations l on d.location_id = l.location_id
where l.city='toronto';