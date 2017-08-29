-- ������ ����
create sequence seq_file_board_idx;

-- ������ ����
drop sequence seq_file_board_idx;

-- ���̺� ����
create table file_board(
	idx			int,				--�Ϸù�ȣ
	title		varchar2(200),		--����
	write_id	varchar2(100),		--�ۼ���
	write_date	date,				--�ۼ�����
	readhit		int,				--��ȸ��
	ip			varchar2(100)		--�ۼ���IP
);

-- ���̺� ����
drop table file_board;

-- �⺻Ű ����
alter table file_board add constraint pk_file_board_idx primary key(idx);

-- sample data
insert into file_board values( seq_file_board_idx.nextVal,
							   '����Ʈ���� �ڷ�',
							   'test',
							   '2017/08/29',
							   0,
							   '192.168.0.16'
								);
								
-- ��� ������ ����
delete from file_board;

-- file_board���̺� ��ȸ
select * from file_board order by desc;

-- commit
commit
								
								
								
								
								
								
								
								