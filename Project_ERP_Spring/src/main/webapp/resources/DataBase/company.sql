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
	parent_idx		int,					-- ��� ������ �ε��� ( 4-1 �̸� 4���� �ȴ� ) tree������ ����
	description		varchar2(500)			-- ����
);

-- ���̺� ����
drop table company

-- �⺻Ű ����
alter table company add constraint pk_company_idx primary key(idx) 

-- sample data
insert into company values( seq_company_idx.nextVal,
								'��ǥ',
								null,					-- ��ǥ���� ��� ������ �����Ƿ� null�� �ش�.
								'��ǥ�ڸ��');

									
-- ��� ������ ����
delete from company;
									
-- ������ ��ȸ
select * from company order by idx

-- commit
commit
