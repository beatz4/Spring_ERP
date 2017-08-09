-- ���� ���� sql

-- ������ ����
create sequence seq_company_idx START WITH 1 INCREMENT BY 1
drop sequence seq_company_idx

-- ������ �ʱ�ȭ : �������� nextVal�� �̿��� 0���� ���߾��ش�
select seq_company_idx.nextval from dual
ALTER SEQUENCE seq_company_idx INCREMENT BY 1

-- ���̺� ����
create table company (
	idx				int,					-- �Ϸ� ��ȣ
	id				int unique,
	name			varchar2(100),			-- ����(��) �̸�
	parent_idx		int,					-- ��� ������ �ε��� ( 4-1 �̸� 4���� �ȴ� ) tree������ ����
	description		varchar2(500)			-- ����
);

-- ���̺� ����
drop table company

-- �⺻Ű ����
alter table company add constraint pk_company_idx primary key(idx) 

-- sample data

-- 1
insert into company values( seq_company_idx.nextVal,
								1,
								'��ǥ',
								0,					-- ��ǥ���� ��� ������ �����Ƿ� 0�� �ش�.
								'��ǥ�ڸ��');

-- 2
insert into company values( seq_company_idx.nextVal,
								2,
								'������',
								0,					-- ��ǥ index(1) + �δ�ǥ index(2) : 12
								'�����μ�');
								
-- 3
insert into company values( seq_company_idx.nextVal,
								3,
								'���ߺ�',
								0,					-- ��ǥ���� ��� ������ �����Ƿ� 0�� �ش�.
								'���ߺμ�');
								
-- 4
insert into company values( seq_company_idx.nextVal,
								4,
								'�濵������',
								0,					-- ��ǥ���� ��� ������ �����Ƿ� 0�� �ش�.
								'�濵�����μ�');

-- 1:��ǥ, 2:������, 3:���ߺ�, 4:�濵������
insert into company values( seq_company_idx.nextVal,
								101,
								'��ǥ�̻�',
								1,					-- ��ǥ���� ��� ������ �����Ƿ� 0�� �ش�.
								'CEO');
								
insert into company values( seq_company_idx.nextVal,
								201,
								'�����μ�1',
								2,					-- ��ǥ���� ��� ������ �����Ƿ� 0�� �ش�.
								'����1��');
insert into company values( seq_company_idx.nextVal,
								202,
								'�����μ�2',
								2,					-- ��ǥ���� ��� ������ �����Ƿ� 0�� �ش�.
								'����2��');   
								
insert into company values( seq_company_idx.nextVal,
								301,
								'���ߺ�1',
								3,					-- ��ǥ���� ��� ������ �����Ƿ� 0�� �ش�.
								'����1��');
insert into company values( seq_company_idx.nextVal,
								302,
								'���ߺ�2',
								3,					-- ��ǥ���� ��� ������ �����Ƿ� 0�� �ش�.
								'����2��');
								
insert into company values( seq_company_idx.nextVal,
								401,
								'�濵������1',
								4,					-- ��ǥ���� ��� ������ �����Ƿ� 0�� �ش�.
								'�濵1��');
insert into company values( seq_company_idx.nextVal,
								402,
								'�濵������2',
								4,					-- ��ǥ���� ��� ������ �����Ƿ� 0�� �ش�.
								'�濵2��');



									
-- ��� ������ ����
delete from company;
									
-- ������ ��ȸ
select * from company order by idx

-- commit
commit
