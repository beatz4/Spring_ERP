--������ ����
create sequence seq_app_d_idx

--���ڰ��� DB���̺� ����
create table app_d (
					app_d_idx 	   int,  --���繮��idx
					idx 	  	   int,  --���idx
					doc_idx 	   int,  --��������idx
					a_line_idx 	   int,  --���缱idx
					app_d_regdate date, --�ۼ���
					app_d_edate   date  --����Ϸ���
					
)
--����Ű����
alter table app_d add constraint pk_seq_app_d_idx primary key (app_d_idx) 

--�ٸ� ���̺��� ����Ű�� ����
alter table app_d add constraint fk_app_d_user_idx foreign key(idx) references user_manager(idx)
alter table app_d add constraint fk_app_d_doc_idx foreign key(doc_idx) references document_type(doc_idx)
alter table app_d add constraint fk_app_a_line_idx foreign key(a_line_idx) references a_line(a_line_idx)

--�������� ���̺� ����
drop sequence seq_app_d_idx
drop table app_d

--���õ����� �߰�
insert into app_d values(seq_app_d_idx.nextVal, 3, 1, 1, sysdate, sysdate);

select final.app_d_idx, final.name, final.doc_title, line.a_line_name, final.app_d_regdate, final.app_d_edate from
(select da.*, doc.doc_title from
(select d.*, u.name
from app_d d 
inner join USER_MANAGER u on d.idx = u.idx) da 
inner join DOCUMENT_TYPE doc on da.doc_idx = doc.doc_idx) final 
inner join a_line line on final.a_line_idx = line.a_line_idx


d.app_d_idx, u.name, d.app_d_regdate, d.app_d_edate
 ,line.a_line_name, 

