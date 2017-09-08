--������ ����
create sequence seq_app_d_idx;

select * from app_d
--���ڰ��� DB���̺� ����
create table app_d (
					app_d_idx 	  	   int,  		 --���繮��idx
					idx 	  	  	   int,  		 --���idx
					next_idx           int,          --���� ������ idx
					doc_idx		  	   int,  		 --��������idx (���� -1, �ް�-2, ����-3....)
					a_line_idx 	  	   int,  		 --���缱idx
					app_document_title varchar2(50), --���� ����
					app_one            int,			 --ù��° ������Ȯ��(0--���, 1--����, 2--�ݷ�)
					app_one_date       date,         --ù��° ���� Ȯ�� ��¥
					app_two            int,			 --�ι�° ������Ȯ��(0--���, 1--����, 2--�ݷ�)
					app_two_date       date,		 --�ι�° ���� Ȯ�� ��¥
					app_three          int,			 --����° ������Ȯ��(0--���, 1--����, 2--�ݷ�)
					app_three_date     date,		 --����° ���� Ȯ�� ��¥
					app_four           int,			 --�׹�° ������Ȯ��(0--���, 1--����, 2--�ݷ�)
					app_four_date      date,		 --�׹�° ���� Ȯ�� ��¥
					app_d_edate   	   date,  		 --����Ϸ���
					d_condition        int           --������� Ȯ��(1--������, 2--�ݷ�, 3--����Ϸ�)
);
--����Ű����
alter table app_d add constraint pk_seq_app_d_idx primary key (app_d_idx); 

create or replace view app_user_view
as
select a.*, u.c_name, u.name from 
(select * from app_list_view) a inner join user_view u on a.idx=u.idx

create or replace view app_list_view
as
select d.doc_title, a.* from
(select * from document_type) d inner join app_d a on d.doc_idx=a.doc_idx

---------------------------------------------�������� �ѹ��� ����ϼ���--------------------------------------------------
select * from app_d
select * from app_user_view
select * from app_line_view
select * from app_list_view
-----------------------------------------------�������� ���̺� ����----------------------------------------------------

drop sequence seq_app_d_idx;
drop table app_d;

----------------------------------------------------------------------------------------------------------------

--�ٸ� ���̺��� ����Ű�� ����
alter table app_d add constraint fk_app_d_user_idx foreign key(idx) references user_manager(idx)
alter table app_d add constraint fk_app_d_doc_idx foreign key(doc_idx) references document_type(doc_idx)
alter table app_d add constraint fk_app_a_line_idx foreign key(a_line_idx) references a_line(a_line_idx)


