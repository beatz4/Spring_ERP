create sequence seq_a_line_idx 

create table a_line (
						a_line_idx 			int,           --���缱idx
						idx          		int,           --�����ȣ
                        a_line_name 		varchar2(100), --���缱��
                        a_line_regdate      date           --��������
)

--����Ű ����
alter table a_line add constraint pk_a_line_idx primary key (a_line_idx)

--�ܺ�Ű ����
alter table eap_line add constraint fk_eap_line_idx foreign key (idx) references user_manager(idx) 

--������ ������ ���̺� ����
drop sequence seq_a_line_idx 
drop table a_line

insert into a_line values(seq_a_line_idx.nextVal, 3, '��������', sysdate);
