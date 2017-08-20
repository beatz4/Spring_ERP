-- ������ ����
create sequence seq_user_idx START WITH 1 INCREMENT BY 1
drop sequence seq_user_idx

-- ������ �ʱ�ȭ : �������� nextVal�� �̿��� 0���� ���߾��ش�
select seq_user_idx.nextval from dual
ALTER SEQUENCE seq_user_idx INCREMENT BY 1

-- ���̺� ����
create table user_manager (
	idx			int,					-- �Ϸ� ��ȣ (���)
	name		varchar2(100),			-- �̸�
	regnumber	varchar2(100),			-- �ֹι�ȣ (-����)
	id			varchar2(100),			-- ���̵�
	password	varchar2(100),			-- ��й�ȣ
	address		varchar2(500),			-- �ּ�
	email		varchar2(100),			-- �̸���
	phone		varchar2(200),			-- ��ȭ��ȣ
	regdate		date,					-- ���� ����
	g_idx		int,					-- �ܷ�Ű (grade)
	c_idx		int						-- �ܷ�Ű (company : �Ҽ� ����(��))
)

update user_manager set 
 		    name =  'ȫ�浿',
 			regnumber = '990101-1122112',
 			password = '1111',
 			address = '���ѹα�',
 			email = 'admin@erp.com',
 			phone = '010-000-1111',
 			g_idx = 4,
 			c_idx = 1
 			where idx= 4


-- ���̺� ����
drop table user_manager

-- �⺻Ű ����
alter table user_manager add constraint pk_user_manager_idx primary key(idx) 

-- sample data
insert into user_manager values( seq_user_idx.nextVal,
									'������',
									'990101-1122112',
									'admin',
									'admin',
									'����Ư���ð�����',
									'admin@erp.com',
									'010-000-1111',
									sysdate,
									1,
									1);

insert into user_manager values( seq_user_idx.nextVal,
									'�׽�Ʈ',
									'990101-1122112',
									'test',
									'test',
									'���ѹα�',
									'admin@erp.com',
									'010-000-1111',
									sysdate,
									4,
									1);
									
insert into user_manager values( seq_user_idx.nextVal,
									'����1',
									'990101-1122112',
									'user1',
									'1111',
									'���ѹα�',
									'admin@erp.com',
									'010-000-1111',
									sysdate,
									4,
									1)
									
									
-- ��� ������ ����
delete from user_manager;
									
-- ������ ��ȸ
select * from user_manager order by idx

-- commit
commit

-- view ��ȸ
select * from user_view order by idx desc

-- view ����
drop view user_view

-- �ܷ�Ű view
create or replace view user_view
as
	select
	   u.*,
	   g.g_level, g.g_position, c.name c_name
   from user_manager u left outer join company c on c.idx = u.c_idx
		left outer join grade g on u.g_idx = g.g_idx