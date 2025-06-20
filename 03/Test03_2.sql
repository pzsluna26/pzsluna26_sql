-- 3. . 다음은 demo_scott.sql 스크립트에 저장된 사원 데이터베이스입니다. 스크립트를 실행하면 예제 데이터베이스가 생성됩니다. 다음 질문에 대해 SQL 문을 작성하세요.
-- (1) 사원의 이름과 직위를 출력하시오. 단, 사원의 이름은 '사원이름', 직위는 '사원직위' 라는 열 이름으로 출력합니다.
select ename as '사원이름', job as '사원직위'
from emp;

-- (2) 30번 부서에 근무하는 모든 사원의 이름과 급여를 출력하시오.
select ename, sal
from emp
where emp.deptno=dept.deptno
	and dept.deptno = '30';

-- (3) 사원번호와 이름, 현재 급여, 증가한 급여(열 이름은 '증가액'), 10% 인상된 급여(열 이름은 '인상된 급여')를 사원번호순으로 출력하시오.

-- (4) 'S'로 시작하는 모든 사원의 이름과 부서번호를 출력하시오.

-- (5) 모든 사원의 최대 및 최소 급여, 합계 및 평균 급여를 출력하시오. 열 이름은 각각 MAX, MIN, SUM, AVG로 합니다. 단, 소수점 이하는 반올림하여 정수로 출력합니다.

-- (6) 업무 이름과 업무별로 동일한 업무를 하는 사원의 수를 출력하시오. 열 이름은 각각 '업무'와 '업무별 사원수'로 합니다.

-- (7) 사원의 최대 급여와 최소 급여의 차액을 출력하시오.

-- (8) 30번 부서의 구성원 수와 사원들의 급여 합계 및 평균을 출력하시오.

-- (9) 평균 급여가 가장 높은 부서의 번호를 출력하시오.

-- (10) 직책이 'SALESMAN'인 사원을 제외하고, 업무별 사원의 급여가 3,000 이상인 각 업무에 대해서 업무명과 업무별 평균 급여를 출력하시오. 단, 평균 급여를 기준으로 내림차순으로 정렬합니다.
select job, avg(sal)sal
from emp
where job != 'salesman' and 3000 <= sal
group by job
order by sal desc;

-- (11) 전체 사원 가운데 직속상관(MGR)이 있는 사원의 수를 출력하시오.
select count(*)
from emp
where mgr is not null;

-- (12) Emp 테이블에서 이름, 급여, 커미션(comm), 총액(sal + comm)을 구하여 총액이 많은 순서대로 출력하시오.
--      단, 커미션이 NULL인 사원은 제외합니다.
    
-- (13) 부서별로 같은 업무를 하는 사람의 인원수를 구하여 부서번호, 업무 이름, 인원수를 출력하시오.

-- (14) 사원이 한 명도 없는 부서의 이름을 출력하시오.
select *
from dept d
where not exists
(select 1 from emp e where e.deptno = d.deptno);

-- 14-2. 주문이 없는 고객
select cs.name
from customer cs
where not exists (select 1
				from orders od
				where cs.custid = od.custid);

-- (15) 같은 업무를 하는 사람의 수가 4명 이상인 업무와 해당 업무를 하는 인원수를 출력하시오.
select job, count(*)
from emp
group by job
having count(*) >= 4;


-- (16) 사원번호가 7400 이상 7600 이하인 사원의 이름을 출력하시오.
select *
from emp
where empno between 7400 and 7600;

-- (17) 사원의 이름과 그 사원이 속한 부서의 이름을 출력하시오.
select ename, dname
from dept_emp;
-- (18) 사원의 이름과 그 사원의 팀장(mgr)의 이름을 출력하시오.
select ename, (select ename from emp e2 where e2.empno=e1.mgr) as mgr_emp
from emp e1;

-- (19) 사원 'SCOTT'보다 급여를 많이 받는 사람의 이름을 출력하시오.
select ename
from emp 
where sal > (select sal from emp where ename = 'scott');

-- (20) 사원 'SCOTT'이 일하는 부서의 부서번호와, 'DALLAS'에 위치한 부서의 부서번호를 모두 출력하시오. (중복된 결과는 한 번만 출력)
select deptno
from dept
where deptno = (select deptno from emp where ename = 'scott')
union
select deptno
from dept
where loc = 'dallas';
