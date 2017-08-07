create sequence seq_t_expense_idx

--��������(����)���̺�
create table t_expense(
					 t_expense_idx 			int,       		--��������idx
					 d_expense_idx			int,			--���⹮��idx
					 t_expense_title		varchar2(20)	--����
)

--����Ű����
alter table t_expense add constraint pk_t_expense_idx primary key (t_expense_idx)

--�ܷ�Ű ����
alter table t_expense add constraint fk_d_expense_idx foreign key (d_expense_idx) references d_expense(d_expense_idx)


--sample date
insert into t_expense values(seq_t_expense_idx.nextVal, 1, '��ź�');
insert into t_expense values(seq_t_expense_idx.nextVal, 1, '�����Ļ���');
insert into t_expense values(seq_t_expense_idx.nextVal, 1, '��ۺ�');
insert into t_expense values(seq_t_expense_idx.nextVal, 1, '���޼�����');
insert into t_expense values(seq_t_expense_idx.nextVal, 1, '��ǰ');


select * from t_expense

commit

--����������, ���̺����, fk_d_expense_����
drop sequence seq_t_expense_idx;
drop table t_expense;
alter table t_expense drop constraint fk_d_expense_idx