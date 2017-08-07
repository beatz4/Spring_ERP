create sequence seq_t_leave_idx

--계정과목(휴가)테이블
create table t_leave(
					 t_leave_idx 			int,       		--계정과목idx
					 d_leave_idx			int,			--지출문서idx
					 t_leave_title			varchar2(20)	--제목
)

--개인키설정
alter table t_leave add constraint pk_t_leave_idx primary key (t_leave_idx)

--외래키 설정
alter table t_leave add constraint fk_d_leave_idx foreign key (d_leave_idx) references d_leave(d_leave_idx)


--sample date


select * from t_leave

commit

--시퀀스삭제, 테이블삭제, fk_d_leave_삭제
drop sequence seq_t_leave_idx;
drop table t_leave;
alter table t_leave drop constraint fk_d_leave_idx