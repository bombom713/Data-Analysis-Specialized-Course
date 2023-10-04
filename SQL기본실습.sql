select emp_name 사원이름, org_cd 소속, position 직무, salary 연봉
from <filenm>.tb_emp
where position='대리';

select count(*) from <filenm>.tb_emp;


select emp_name 사원이름, org_cd 소속, position 직무, salary 연봉
from <filenm>.tb_emp;

select emp_name 사원이름, org_cd 소속, position 직무, salary 연봉
from <filenm>.tb_emp
where salary>=50000000;

select emp_name 사원이름, org_cd 소속, position 직책, salary 연봉
from <filenm>.tb_emp
where (org_cd='08' or org_cd='09' or org_cd='10')
and position='사원'
and salary>=40000000
and salary<=50000000;

select emp_name 사원이름, org_cd 소속, position 직책, salary 연봉
from <filenm>.tb_emp
where org_cd in ('08','09','10')
and position='사원'
and salary between 40000000 and 50000000;

select emp_name 사원이름, salary 연봉
from <filenm>.tb_emp
where salary between 40000000 and 50000000;

select emp_name, org_cd, position
from <filenm>.tb_emp
where org_cd in ('06','07')
and position in ('팀장','과장');

select emp_name, org_cd, position
from <filenm>.tb_emp
where (org_cd, position)
in (('06','팀장'),('07','과장'));

select emp_name 사원이름, org_cd 팀코드, position 직책, ent_date 입사일자
from <filenm>.tb_emp
where emp_name like '김%';

select emp_name 사원이름, org_cd 팀코드, position 직책, ent_date 입사일자
from <filenm>.tb_emp
where emp_name like '_승%';

select emp_name 사원이름, org_cd 소속, position 직책, gender 성별
from <filenm>.tb_emp
where gender=null;

select emp_name 사원이름, org_cd 소속, position 직책, gender 성별
from <filenm>.tb_emp
where gender is null;

select emp_name 사원이름, org_cd 소속, position 직책
from <filenm>.tb_emp
where org_cd='10'
and not position='팀장';

select emp_name 사원이름, org_cd 소속, position 직책
from <filenm>.tb_emp
where org_cd is not null;

select org_cd 부서, emp_name 사원이름, ent_date 입사일
from <filenm>.tb_emp
order by org_cd, ent_date desc;

select emp_name, emp_no, org_cd
from <filenm>.tb_emp
order by emp_name asc, emp_no asc, org_cd desc;

select emp_name 사원이름, emp_no 사원번호, org_cd 부서코드
from <filenm>.tb_emp
order by 사원이름, 사원번호, 부서코드 desc;

select emp_name, emp_no, org_cd
from <filenm>.tb_emp
order by 1 asc, 2 asc, 3 desc;

select emp_name 사원이름, emp_no 사원번호, org_cd 부서코드
from <filenm>.tb_emp
order by emp_name, 2, 부서코드 desc;
