-- ������ ����
create sequence seq_message_idx
-- ������ ����
drop sequence seq_message_idx

-- ���̺� ����
create table message(
	idx			int,					--�Ϸù�ȣ
	msg_idx		int,					--�ܷ�Ű(ȸ��)
	send_id		varchar2(100),			--�������
	recv_id		varchar2(100),			--�޴»��
	title		varchar2(200),			--����
	content		varchar2(3000),			--����
	send_date	varchar2(100),			--������¥
	recv_date	varchar2(100),			--������¥
	send_state	varchar2(10),			--�о����� ����
	msg_box		varchar2(10),			--������ ����
	ip			varchar2(100)			--ip
)
-- ���̺� ����
drop table message

-- �⺻Ű ����
alter table message add constraint pk_message_idx primary key(idx)

--�ܷ�Ű ����
-- user�� ���� �Ǹ� message�� �ڵ����� ���� �������ֱ� ���� �ܷ�Ű
alter table message add constraint fk_message_idx foreign key(msg_idx) references user_manager(idx) on delete cascade

-- sample data
insert into message values( seq_message_idx.nextVal,
							2,
							'admin',
							'test',
							'�ȳ��ϽŰ�',
							'test ����ξ��ϳ�',
							'������¥',
							'������¥',
							'�̼���',
							'box',
							'127.0.0.4');
							
insert into message values( seq_message_idx.nextVal,
							3,
							'test',
							'admin',
							'�ȳ��ϽŰ�',
							'admin ����ξ��ϳ�',
							'������¥',
							'������¥',
							'�̼���',
							'box',
							'127.0.0.3');

-- ��� ������ ����
delete from message;
							
-- message���̺� ��ȸ
select * from message where recv_id='test' and msg_box='box' order by idx desc

-- commit
commit

-- Pagingó���ϱ� ���� SQL
select *
from
	(
		select
			rank() over(order by idx desc) rank,
			m.*
		from
			(select * from message where recv_id='test' and msg_box='nobox')m
	)	
	where rank between 1 and 10

--��ü���ڵ��
select nvl(count(*),0) from message where recv_id='test' and msg_box='nobox'

-- poplist ����¡
select *
from
	(
		select
			rank() over(order by idx ) rank,
			p.*
		from
			(select * from user_view)p
	)	
	where rank between 1 and 10

--��ü���ڵ��
select nvl(count(*),0) from user_view























