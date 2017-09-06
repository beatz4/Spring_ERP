create sequence seq_d_expense_idx;

create table d_expense(
					d_expense_idx 	   int,      	 --���⹮�� idx
					idx                int,      	 --�ۼ��� idx
					next_idx           int,          --���� ������ idx
					app_d_idx 		   int,          --���缱 idx
					d_expense_regdate  date,     	 --�ۼ���¥
					d_expense_title    varchar2(50), --���⹮�� ����
					d_expense_date     date,         --��û��
					d_expense_acnumber varchar2(20), --���¹�ȣ
					d_expense_acname   varchar2(10), --������
					d_expense_total    varchar2(10), --�ѱݾ�
					d_expense_tpay     varchar2(10), --����Ÿ��
					app_one            int,			 --ù��° ������Ȯ��(0--���, 1--����, 2--�ݷ�)
					app_one_date       date,         --ù��° ���� Ȯ�� ��¥
					app_two            int,			 --�ι�° ������Ȯ��(0--���, 1--����, 2--�ݷ�)
					app_two_date       date,		 --�ι�° ���� Ȯ�� ��¥
					app_three          int,			 --����° ������Ȯ��(0--���, 1--����, 2--�ݷ�)
					app_three_date     date,		 --����° ���� Ȯ�� ��¥
					app_four           int,			 --�׹�° ������Ȯ��(0--���, 1--����, 2--�ݷ�)
					app_four_date      date,		 --�׹�° ���� Ȯ�� ��¥
					ip                 varchar2(50), --ip
					d_condition        int           --������� Ȯ��(1--������, 2--�ݷ�, 3--����Ϸ�)
);

--���� ���� primary-key ����
alter table d_expense add constraint pk_d_expense_idx primary key (d_expense_idx);

--���� ������ user_managerDB idx ����
alter table d_expense add constraint fk_d_expense_user_idx foreign key (idx) references user_manager(idx)


--���� ����DB�� document_type DB idx ����
alter table d_expense add constraint fk_d_expense_app_d_idx foreign key(app_d_idx) references app_d(app_d_idx)


--���õ�����
insert into d_expense values(seq_d_expense_idx.nextVal, 1, 1, sysdate, '', sysdate, '', '', '', 0, '')
select m.name, d.*

select * from D_expense
select * from d_expense where idx=1 and d_condition=2
commit

create or replace view d_expense_line_view
as
select a.*, d.* from
(select * from a_line)a inner join d_expense d on a.a_line_idx = d.app_d_idx

--������ ����, ���̺����, user_fk����, app_d_fk����
drop sequence seq_d_expense_idx;
drop table d_expense;
alter table d_expense drop constraint fk_d_expense_user_idx
alter table d_expense drop constraint fk_d_expense_app_d_idx
