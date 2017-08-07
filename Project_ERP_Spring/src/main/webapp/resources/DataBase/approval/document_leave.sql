create sequence seq_d_leave_idx

--휴가결재문서
create table d_leave(
					 d_leave_idx     int,        --휴가문서 일련번호
					 idx     		 int,    	 --사번
					 app_d_idx 		 int,    	 --휴가결재문서 일련번호
					 d_leave_regdate date,   	 --작성일
					 d_leave_date    int,    	 --총휴가일
					 ip              varchar(20) --ip
)

alter table d_leave add constraint pk_d_leave_idx primary key (d_leave_idx)

drop table d_leave