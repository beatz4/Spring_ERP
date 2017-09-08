create sequence seq_d_expense_idx;

create table d_expense(
					d_expense_idx 	   int,      	 --지출문서 idx
					idx                int,      	 --작성자 idx
					app_d_idx          int,          --결재문서idx
					d_expense_regdate  date,     	 --작성날짜
					d_expense_date     date,         --요청일
					d_expense_acnumber varchar2(20), --계좌번호
					d_expense_acname   varchar2(10), --예금주
					d_expense_total    varchar2(10), --총금액
					d_expense_tpay     varchar2(10), --지급타입
					ip                 varchar2(50)  --ip
);

--지출 문서 primary-key 생성
alter table d_expense add constraint pk_d_expense_idx primary key (d_expense_idx);


create or replace view d_expense_line_view
as
select a.*, d.* from
(select * from a_line)a inner join d_expense d on a.a_line_idx = d.app_d_idx;


-------------------------------------위에까지 한번에 등록하세요 --------------------------------------------------------


-------------------------시퀀스 삭제, 테이블삭제, user_fk삭제, app_d_fk삭제---------------------------------------------
drop sequence seq_d_expense_idx;
drop table d_expense;
alter table d_expense drop constraint fk_d_expense_user_idx;
alter table d_expense drop constraint fk_d_expense_app_d_idx
--------------------------------------------------------------------------------------------------------------

--지출 문서와 user_managerDB idx 연결
alter table d_expense add constraint fk_d_expense_user_idx foreign key (idx) references user_manager(idx)

--지출 문서DB와 document_type DB idx 연결
alter table d_expense add constraint fk_d_expense_app_d_idx foreign key(app_d_idx) references app_d(app_d_idx)

commit




