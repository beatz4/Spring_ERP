create sequence seq_grade_idx start with 1 increment by 1
drop sequence seq_grade_idx

create table grade (
	g_idx			int,				-- grade idx
	g_level			int,				-- 직책 등급
	g_position		varchar2(100)		-- 직책 이름
)

drop table grade

-- 기본키 설정
alter table grade add constraint pk_grade_g_idx
	primary key(g_idx)
	
-- default data : 사원,대리,과장,차장,부장,이사,대표
insert into grade values(seq_grade_idx.nextVal,1,'사원');
insert into grade values(seq_grade_idx.nextVal,2,'대리');
insert into grade values(seq_grade_idx.nextVal,3,'과장');
insert into grade values(seq_grade_idx.nextVal,4,'차장');
insert into grade values(seq_grade_idx.nextVal,5,'부장');
insert into grade values(seq_grade_idx.nextVal,6,'이사');
insert into grade values(seq_grade_idx.nextVal,7,'대표');

delete from grade

select * from grade order by g_idx desc

commit

