create sequence seq_d_expense_idx;

create table d_expense(
					d_expense_idx 	   int,      	 --���⹮�� idx
					idx                int,      	 --�ۼ��� idx
					app_d_idx          int,          --���繮��idx
					d_expense_regdate  date,     	 --�ۼ���¥
					d_expense_date     date,         --��û��
					d_expense_acnumber varchar2(20), --���¹�ȣ
					d_expense_acname   varchar2(10), --������
					d_expense_total    varchar2(10), --�ѱݾ�
					d_expense_tpay     varchar2(10), --����Ÿ��
					ip                 varchar2(50)  --ip
);

--���� ���� primary-key ����
alter table d_expense add constraint pk_d_expense_idx primary key (d_expense_idx);


create or replace view d_expense_line_view
as
select a.*, d.* from
(select * from a_line)a inner join d_expense d on a.a_line_idx = d.app_d_idx;


-------------------------------------�������� �ѹ��� ����ϼ��� --------------------------------------------------------


-------------------------������ ����, ���̺����, user_fk����, app_d_fk����---------------------------------------------
drop sequence seq_d_expense_idx;
drop table d_expense;
alter table d_expense drop constraint fk_d_expense_user_idx;
alter table d_expense drop constraint fk_d_expense_app_d_idx
--------------------------------------------------------------------------------------------------------------

--���� ������ user_managerDB idx ����
alter table d_expense add constraint fk_d_expense_user_idx foreign key (idx) references user_manager(idx)

--���� ����DB�� document_type DB idx ����
alter table d_expense add constraint fk_d_expense_app_d_idx foreign key(app_d_idx) references app_d(app_d_idx)

commit




