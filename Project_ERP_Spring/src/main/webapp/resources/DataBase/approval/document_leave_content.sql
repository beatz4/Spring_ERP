create sequence seq_c_leave_idx

create table c_leave(
					c_leave_idx int,       --일련번호
					t_leave_idx int,       --휴가계정과목 일련번호
					c_leave_date int,      --휴가일수
					c_leave_sdate date,    --시작일
					c_leave_edate date,    --마지막일
					c_leave_et  varchar(100) -- 추가내용

)

alter table c_leave add constraint pk_c_leave_idx primary key (c_leave_idx)

alter table c_leave add constraint fk_t_leave_idx foreign key (t_leave_idx) references t_leave(t_leave_idx)


