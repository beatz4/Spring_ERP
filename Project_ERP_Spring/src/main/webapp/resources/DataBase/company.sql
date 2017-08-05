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
	name			varchar2(100),			-- ����(��) �̸�
	parent_idx		int not null,					-- ��� ������ �ε��� ( 4-1 �̸� 4���� �ȴ� ) tree������ ����
	description		varchar2(500)			-- ����
);

-- ���̺� ����
drop table company

-- �⺻Ű ����
alter table company add constraint pk_company_idx primary key(idx) 

-- sample data

-- 1
insert into company values( seq_company_idx.nextVal,
								'��ǥ',
								0,					-- ��ǥ���� ��� ������ �����Ƿ� 0�� �ش�.
								'��ǥ�ڸ��');
-- 2							
insert into company values( seq_company_idx.nextVal,
								'�δ�ǥ',
								1,					-- ��ǥ�� index : 1
								'�δ�ǥ���');

-- 3
insert into company values( seq_company_idx.nextVal,
								'������',
								0,					-- ��ǥ index(1) + �δ�ǥ index(2) : 12
								'�����μ�');
								
-- 4
insert into company values( seq_company_idx.nextVal,
								'���ߺ�',
								0,					-- ��ǥ���� ��� ������ �����Ƿ� 0�� �ش�.
								'���ߺμ�');
								
-- 5
insert into company values( seq_company_idx.nextVal,
								'�濵������',
								0,					-- ��ǥ���� ��� ������ �����Ƿ� 0�� �ش�.
								'�濵�����μ�');

-- 0:��ǥ, 3:������, 4:���ߺ�, 5:�濵������
insert into company values( seq_company_idx.nextVal,
								'�����μ�1',
								3,					-- ��ǥ���� ��� ������ �����Ƿ� 0�� �ش�.
								'����1��');
insert into company values( seq_company_idx.nextVal,
								'�����μ�2',
								3,					-- ��ǥ���� ��� ������ �����Ƿ� 0�� �ش�.
								'����2��');   
								
insert into company values( seq_company_idx.nextVal,
								'���ߺ�1',
								4,					-- ��ǥ���� ��� ������ �����Ƿ� 0�� �ش�.
								'����1��');
insert into company values( seq_company_idx.nextVal,
								'���ߺ�2',
								4,					-- ��ǥ���� ��� ������ �����Ƿ� 0�� �ش�.
								'����2��');
								
insert into company values( seq_company_idx.nextVal,
								'�濵������1',
								5,					-- ��ǥ���� ��� ������ �����Ƿ� 0�� �ش�.
								'�濵1��');
insert into company values( seq_company_idx.nextVal,
								'�濵������2',
								5,					-- ��ǥ���� ��� ������ �����Ƿ� 0�� �ش�.
								'�濵2��');



									
-- ��� ������ ����
delete from company;
									
-- ������ ��ȸ
select * from company order by idx

-- commit
commit
