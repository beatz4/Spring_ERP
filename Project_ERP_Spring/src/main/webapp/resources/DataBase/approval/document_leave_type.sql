create sequence seq_t_leave_idx

--��������(�ް�)���̺�
create table t_leave(
					 t_leave_idx 			int,       		--��������idx
					 d_leave_idx			int,			--���⹮��idx
					 t_leave_title			varchar2(20)	--����
)

--����Ű����
alter table t_leave add constraint pk_t_leave_idx primary key (t_leave_idx)

--�ܷ�Ű ����
alter table t_leave add constraint fk_d_leave_idx foreign key (d_leave_idx) references d_leave(d_leave_idx)


--sample date


select * from t_leave

commit

--����������, ���̺����, fk_d_leave_����
drop sequence seq_t_leave_idx;
drop table t_leave;
alter table t_leave drop constraint fk_d_leave_idx