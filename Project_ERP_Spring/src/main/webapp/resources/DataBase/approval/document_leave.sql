create sequence seq_d_leave_idx

--�ް����繮��
create table d_leave(
					 d_leave_idx     int,        --�ް����� �Ϸù�ȣ
					 idx     		 int,    	 --���
					 app_d_idx 		 int,    	 --�ް����繮�� �Ϸù�ȣ
					 d_leave_regdate date,   	 --�ۼ���
					 d_leave_date    int,    	 --���ް���
					 ip              varchar(20) --ip
)

alter table d_leave add constraint pk_d_leave_idx primary key (d_leave_idx)

drop table d_leave