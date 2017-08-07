create sequence seq_c_leave_idx

create table c_leave(
					c_leave_idx int,       --�Ϸù�ȣ
					t_leave_idx int,       --�ް��������� �Ϸù�ȣ
					c_leave_date int,      --�ް��ϼ�
					c_leave_sdate date,    --������
					c_leave_edate date,    --��������
					c_leave_et  varchar(100) -- �߰�����

)

alter table c_leave add constraint pk_c_leave_idx primary key (c_leave_idx)

alter table c_leave add constraint fk_t_leave_idx foreign key (t_leave_idx) references t_leave(t_leave_idx)


