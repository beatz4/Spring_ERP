create sequence seq_a_line_idx 

create table a_line (
						a_line_idx 			int,           --���缱idx
						idx          		int,           --���缱 ���� �����ȣ
						idx_one				int,           --���� ������
						idx_two             int,           --�ι�° ������
						idx_three           int,           --����° ������
						idx_four           	int,           --����������
                        a_line_name 		varchar2(100), --���缱��
                        a_line_regdate      date           --��������
)

select * from A_LINE
select * from 
select idx, name, g_position from user_view where idx = (select idx_one from A_LINE) a

(select u.idx idx, u.name user_one_name ,u.g_position user_one_position from user_view u inner join a_line line on u.idx = line.idx_one) inner join
--����Ű ����
alter table a_line add constraint pk_a_line_idx primary key (a_line_idx)

--�ܺ�Ű ����
alter table eap_line add constraint fk_eap_line_idx foreign key (idx) references user_manager(idx) 

--������ ������ ���̺� ����
drop sequence seq_a_line_idx 
drop table a_line

insert into a_line values(seq_a_line_idx.nextVal, 3, '��������', sysdate);
