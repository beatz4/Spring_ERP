create sequence seq_t_expense_idx

--계정과목(지출)테이블
create table t_expense(
					 t_expense_idx 			int,       		--계정과목idx
					 d_expense_idx			int,			--지출문서idx
					 t_expense_title		varchar2(20)	--제목
)

--개인키설정
alter table t_expense add constraint pk_t_expense_idx primary key (t_expense_idx)

--외래키 설정
alter table t_expense add constraint fk_d_expense_idx foreign key (d_expense_idx) references d_expense(d_expense_idx)


--sample date
insert into t_expense values(seq_t_expense_idx.nextVal, 1, '통신비');
insert into t_expense values(seq_t_expense_idx.nextVal, 1, '복리후생비');
insert into t_expense values(seq_t_expense_idx.nextVal, 1, '운송비');
insert into t_expense values(seq_t_expense_idx.nextVal, 1, '지급수수료');
insert into t_expense values(seq_t_expense_idx.nextVal, 1, '상품');


select * from t_expense

commit

--시퀀스삭제, 테이블삭제, fk_d_expense_삭제
drop sequence seq_t_expense_idx;
drop table t_expense;
alter table t_expense drop constraint fk_d_expense_idx