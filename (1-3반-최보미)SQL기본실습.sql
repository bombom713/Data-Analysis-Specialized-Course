select emp_name ����̸�, org_cd �Ҽ�, position ����, salary ����
from cslee.tb_emp
where position='�븮';

select count(*) from cslee.tb_emp;


select emp_name ����̸�, org_cd �Ҽ�, position ����, salary ����
from cslee.tb_emp;

select emp_name ����̸�, org_cd �Ҽ�, position ����, salary ����
from cslee.tb_emp
where salary>=50000000;

select emp_name ����̸�, org_cd �Ҽ�, position ��å, salary ����
from cslee.tb_emp
where (org_cd='08' or org_cd='09' or org_cd='10')
and position='���'
and salary>=40000000
and salary<=50000000;

select emp_name ����̸�, org_cd �Ҽ�, position ��å, salary ����
from cslee.tb_emp
where org_cd in ('08','09','10')
and position='���'
and salary between 40000000 and 50000000;

select emp_name ����̸�, salary ����
from cslee.tb_emp
where salary between 40000000 and 50000000;

select emp_name, org_cd, position
from cslee.tb_emp
where org_cd in ('06','07')
and position in ('����','����');

select emp_name, org_cd, position
from cslee.tb_emp
where (org_cd, position)
in (('06','����'),('07','����'));

select emp_name ����̸�, org_cd ���ڵ�, position ��å, ent_date �Ի�����
from cslee.tb_emp
where emp_name like '��%';

select emp_name ����̸�, org_cd ���ڵ�, position ��å, ent_date �Ի�����
from cslee.tb_emp
where emp_name like '_��%';

select emp_name ����̸�, org_cd �Ҽ�, position ��å, gender ����
from cslee.tb_emp
where gender=null;

select emp_name ����̸�, org_cd �Ҽ�, position ��å, gender ����
from cslee.tb_emp
where gender is null;

select emp_name ����̸�, org_cd �Ҽ�, position ��å
from cslee.tb_emp
where org_cd='10'
and not position='����';

select emp_name ����̸�, org_cd �Ҽ�, position ��å
from cslee.tb_emp
where org_cd is not null;

select org_cd �μ�, emp_name ����̸�, ent_date �Ի���
from cslee.tb_emp
order by org_cd, ent_date desc;

select emp_name, emp_no, org_cd
from cslee.tb_emp
order by emp_name asc, emp_no asc, org_cd desc;

select emp_name ����̸�, emp_no �����ȣ, org_cd �μ��ڵ�
from cslee.tb_emp
order by ����̸�, �����ȣ, �μ��ڵ� desc;

select emp_name, emp_no, org_cd
from cslee.tb_emp
order by 1 asc, 2 asc, 3 desc;

select emp_name ����̸�, emp_no �����ȣ, org_cd �μ��ڵ�
from cslee.tb_emp
order by emp_name, 2, �μ��ڵ� desc;