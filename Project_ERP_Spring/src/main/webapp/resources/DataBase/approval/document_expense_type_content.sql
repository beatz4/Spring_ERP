create sequence seq_c_expense_idx
drop sequence seq_c_expense_idx
create table c_expense(
						c_expense_idx 			int,   			--���������� �ϳ��� ���� idx
						t_expense_idx 			int,   			--�������� idx
						c_expense_date      	date,      		--������
					 	c_expense_content		varchar2(50),	--����
						c_expense_customer		varchar2(10),	--�ŷ�ó
					 	c_expense_money			int,			--�ݾ�
					 	c_expense_mepay			varchar2(20),	--��������
					 	c_expense_et			varchar2(50),	--���
					 	c_expense_proof			varchar2(100)	--����������	
)

alter table c_expense add constraint pk_c_expense_idx primary key (c_expense_idx)

drop table c_expense

alter table c_expense add constraint fk_t_expense_idx foreign key (t_expense_idx) references t_expense(t_expense_idx)
alter table c_expense drop constraint fk_t_expense_idx 

insert into c_expense values(seq_c_expense_idx.nextVal,1,sysdate,'','',0,'','','')

select d.*, t.*, c.* from d_expense d 
inner join t_expense t on d.d_expense_idx = t.d_expense_idx 
inner join C_EXPENSE c on t.t_expense_idx = c.t_expense_idx

commit

