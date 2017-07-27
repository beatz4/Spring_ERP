-- ������ ����
create sequence seq_message_send_idx START WITH 1 INCREMENT BY 1
-- ������ ����
drop sequence seq_message_send_idx

-- ������ �ʱ�ȭ : �������� nextVal�� �̿��� 0���� ���߾��ش�
select seq_message_send_idx.nextval from dual
alter sequence seq_message_send_idx increment by 1

-- ���̺� ����
create table message_send(
	idx			int,				--�Ϸù�ȣ
	msg_idx		int,				--�ܷ�Ű
	send_id		varchar2(100),		--�������
	recv_id		varchar2(100),		--�޴»��
	title		varchar2(200),		--����
	content		varchar2(3000),		--����
	send_date	varchar2(100),		--������¥
	recv_date	varchar2(100),		--������¥
	send_state	varchar2(10),		--�о����� ����
	msg_box		varchar2(10),		--������ ����
	ip			varchar2(100)		--ip
)
-- ���̺� ����
drop table message_send

-- �⺻Ű ����
alter table message_send add constraint pk_message_send_idx primary key(idx)

--�ܷ�Ű
alter table message_send add constraint fk_message_send_idx foreign key(msg_idx) references user_manager(idx) on delete cascade

-- sample data
insert into message_send values( seq_message_send_idx.nextVal,
							2,
							'admin',
							'test',
							'�ȳ��ϽŰ�',
							'test ����ξ��ϳ�',
							'������¥',
							'������¥',
							'�̼���',
							'nobox',
							'127.0.0.4');
							
insert into message_send values( seq_message_send_idx.nextVal,
							3,
							'test',
							'admin',
							'�ȳ��ϽŰ�',
							'admin ����ξ��ϳ�',
							'������¥',
							'������¥',
							'�̼���',
							'nobox',
							'127.0.0.3');

-- ��� ������ ����
delete from message_send;
							
-- message���̺� ��ȸ
select * from message_send

-- commit
commit

