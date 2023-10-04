select now();

select now(), now()::date-'1 day'::interval;

show timezone;

select current_date, current_time, timeofday();

select now(), current_timestamp, timestamp 'now';

select date_part('year', timestamp '2020-07-30 20:38:40');

select date_part('year', current_timestamp);

select extract('isoyear' from date '2006-01-01');

select extract('isoyear' from current_timestamp);

select date_trunc('year', timestamp '2020-07-30 20:38:40');

select date_trunc('year', current_timestamp);

select date_part('month', timestamp '2020-07-30 20:38:40');

select date_part('month', current_timestamp);

select extract('month' from timestamp '2020-07-30 20:38:40');

select extract('month' from interval '2 years 3 months');

select extract('month' from interval '2 years 13 months');

select date_trunc('month', timestamp '2020-07-30 20:38:40');

select date_part('day', timestamp '2020-07-30 20:38:40');

select date_trunc('day',timestamp '2020-07-30 20:38:40');

select date_part('hour', timestamp '2013-07-30 20:38:40');

select date_part('hour', interval '4 hours 3 minutes');

select date_trunc('hour', timestamp '2020-07-30 20:38:40');

select date_part('minute', timestamp '2020-07-30 20:38:40');

select date_trunc('minute', timestamp '2020-07-30 20:38:40');

select date_part('second', timestamp '2013-07-30 20:38:40');

select extract('second' from time '17:12:28.5');

select date_trunc('second',timestamp '2013-07-30 20:38:40');


select EMP_NAME, to_char((current_timestamp - ENT_DATE),'w') weeks
from <filenm>.TB_EMP
where ORG_CD='10';

select emp_name, ent_date,
	to_char(ent_date,'yyyy') 입사년,
	to_char(ent_date,'mm') 입사월,
	to_char(ent_date,'dd') 입사일
from <filenm>.tb_emp;

select emp_name, ent_date,
extract('year' from ent_date) 입사년,
extract('month' from ent_date) 입사월,
extract('day' from ent_date) 입사일
from <filenm>.tb_emp;

select to_date('05 Dec 2000', 'DD Mon YYYY');

select to_number('12,454.8-','99G999D9S');

select to_timestamp('05 Dec 2000', 'DD Mon YYYY');

select cast(123.4 as varchar(10))
	,cast('123.5' as numeric)
	,cast(1234.5678 as dec(6,2))
	,cast(current_timestamp as date)
	,to_char(current_timestamp, 'yyyy-m-dd hh24:mi:ss')
	,to_char(1234.56, 'L9,999.99')
	,to_number('$12,345','$99,999')
	,to_date('2014/03/01 21:30:18','yyyy/mm/dd hh24:mi:ss')
	,to_timestamp('2014/03/01 21:30:18','yyyy/mm/dd hh24:mi:ss');

select emp_name,
	case when salary > 50000000
	then salary
	else 50000000
	end as revised_salary
from <filenm>.tb_emp;

select org_name,
case org_name
when '영업1팀' then '지사'
when '영업2팀' then '지사'
when '영업3팀' then '지사'
when '경영관리팀' then '본사'
else '지점'
end as AREA
	from <filenm>.tb_org;
	
select emp_name,
	   case   when salary >= 90000000 then 'high'
		      when salary >= 60000000 then 'mid'
		      else 'low'
	   end    as salary_grade
from <filenm>.tb_emp;

select emp_name, salary,
	case when salary >= 50000000
			then 20000000
		else(case when salary >= 20000000
					then 10000000
				else salary*0.5
			end)
	end as bonus
from <filenm>.tb_emp;

-- coalesce 함수
select emp_name, position,
-- 			NVL(POSITION, '없음'), -- oracle null 체크합수
		coalesce(position,'없음') -- null 체크함수
from <filenm>.tb_emp;

select emp_name, position,
		case when position is null
	then '없음'
			else position
		end as 직책
from <filenm>.tb_emp

select coalesce(salary,0) sal
from cslee.tb_emp
where emp_name='김태진';

select max(salary) sal
from <filenm>.tb_emp
where emp_name='김태진';

select coalesce(max(salary), 9999) sal
from <filenm>.tb_emp
where emp_name='김태진';

select count(*) "전체건수"
	,count(position) "직책건수"
	,count(distinct position)"직책종류"
	,max(salary)"최대"
	,min(salary)"최소"
	,avg(salary)"평균"
from <filenm>.tb_emp;

select position "직책",
count(*) "인원수",
min(salary) "최소",
max(salary) "최대",
avg(salary) "평균"
from <filenm>.tb_emp
group by position;

select org_cd "부서",
count(*) "인원수",
avg(salary) "평균"
from <filenm>.tb_emp
group by org_cd
having count(*) >= 4

select org_cd "부서",
max(salary) "최대"
from <filenm>.tb_emp
group by org_cd
having min(salary) <= 40000000;

select org_cd, position, avg(salary)
from <filenm>.tb_emp
where position in ('과장','대리','사원')
group by org_cd, position;

select org_cd
,avg(case position when '과장' then salary end) "과장"
,avg(case position when '대리' then salary end) "대리"
,avg(case position when '사원' then salary end) "사원"
from <filenm>.tb_emp
where position in ('과장','대리','사원')
group by org_cd;

select org_cd,
sum(coalesce((case position when '팀장' then 1 else 0 end),0)) "팀장",
sum(coalesce((case position when '과장' then 1 else 0 end),0)) "과장",
sum(coalesce((case position when '대리' then 1 else 0 end),0)) "대리",
sum(coalesce((case position when '사원' then 1 else 0 end),0)) "사원"
from <filenm>.tb_emp
group by org_cd;

select org_cd,
coalesce (sum(case position when '팀장' then 1 end),0) "팀장",
coalesce (sum(case position when '과장' then 1 end),0) "과장",
coalesce (sum(case position when '대리' then 1 end),0) "대리",
coalesce (sum(case position when '사원' then 1 end),0) "사원"
from <filenm>.tb_emp
group by org_cd;

select tb_emp.emp_name, tb_emp.org_cd
	,tb_org.org_cd, tb_org.org_name
from <filenm>.tb_emp, <filenm>.tb_org
where <filenm>.tb_emp.org_cd=<filenm>.tb_org.org_cd;

select tb_emp.emp_no,
	tb_emp.emp_name,
	tb_emp.org_cd,
		tb_org.org_name,
		tb_emp.position
from <filenm>.tb_emp,
	 <filenm>.tb_org
where <filenm>.tb_emp.org_cd=<filenm>.tb_org.org_cd;

select e.emp_no,
	e.emp_name,
	e.org_cd,
		o.org_name,
		e.position
from <filenm>.tb_emp as e,
	 <filenm>.tb_org as o
where e.org_cd=o.org_cd
 and e.position='팀장'
order by o.org_name;

select a.accno,
	c.cust_name,
	p.prod_name,
	a.cont_amt,
	e.emp_name
from <filenm>.tb_accnt a, <filenm>.tb_cust c, <filenm>.tb_prod p, <filenm>.tb_emp e
where a.cust_no=c.cust_no
and a.prod_cd=p.prod_cd
and a.manager=e.emp_no;

select e.emp_name 사원명,
	e.salary 연봉,
	s.grade 급여등급
from <filenm>.tb_emp e, <filenm>.tb_grade s
where e.salary
between s.low_sal and s.high_sal;

select emp.emp_no, emp.emp_name, org.org_name
from <filenm>.tb_emp emp, <filenm>.tb_org org
where emp.org_cd=org.org_cd;

select emp.emp_no, emp.emp_name, org.org_name
from <filenm>.tb_emp emp
inner join <filenm>.tb_org org
on emp.org_cd=org.org_cd;

select emp.emp_no, emp.emp_name, org.org_name
from <filenm>.tb_emp emp
join <filenm>.tb_org org
on emp.org_cd=org.org_cd;

select acc.accno, acc.cust_no, cust.cust_name
from <filenm>.tb_accnt acc
inner join <filenm>.tb_cust cust
on (cust.cust_no=acc.cust_no);

select e.emp_name, e.org_cd, o.org_cd, o.org_name
from <filenm>.tb_emp e
join <filenm>.tb_org o
  on (e.org_cd=o.org_cd)
where e.org_cd='10';

select a.accno 계좌번호, c.cust_name 고객명, p.prod_name 상품명
	, a.cont_amt 계약금액, e.emp_name 담당자명
from <filenm>.tb_accnt a, <filenm>. tb_cust c, <filenm>.tb_prod p, <filenm>.tb_emp e
where a.cust_no=c.cust_no
and a.prod_cd=p.prod_cd
and a.manager=e.emp_no;

select a.accno 계좌번호, c.cust_name 고객명, p.prod_name 상품명
	,a.cont_amt 계약번호, e.emp_name 담당자명
from <filenm>.tb_accnt a
inner join <filenm>.tb_cust c on a.cust_no=c.cust_no
inner join <filenm>.tb_prod p on a.prod_cd=p.prod_cd
inner join <filenm>.tb_emp e on a.manager=e.emp_no;

select count(emp_name) from <filenm>.tb_emp;

select count(org_name) from <filenm>.tb_org;

select e.emp_name, o.org_name
from <filenm>.tb_emp e cross join <filenm>.tb_org o
order by emp_name;

select count(e.emp_name)
from <filenm>.tb_emp e cross join <filenm>.tb_org o;

select e.emp_no 사번, e.emp_name 사원명,
	   e.position 직책, o.org_name 부서명
from <filenm>.tb_emp e left outer join <filenm>.tb_org o
		 on e.org_cd=o.org_cd
where e.position='사원';

select e.emp_no 사번, e.emp_name 사원명, e.position 직책, o.org_name 부서명
from <filenm>.tb_org o right outer join <filenm>.tb_emp e
		on e.org_cd=o.org_cd
where e.position='사원';

select a.org_cd, a.org_name, b.org_cd, b.org_name
from <filenm>.tb_org a full outer join <filenm>.tb_org b
on a.org_cd=b.org_cd;

select a.org_cd, a.org_name, b.org_cd, b.org_name
from <filenm>. tb_org a left outer join <filenm>.tb_org b
on a.org_cd=b.org_cd
union
select a.org_cd, a.org_name, b.org_cd, b.org_name
from <filenm>.tb_org a right outer join <filenm>.tb_org b
on a.org_cd=b.org_cd;
