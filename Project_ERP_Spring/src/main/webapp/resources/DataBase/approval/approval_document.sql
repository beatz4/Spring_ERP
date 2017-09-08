--시퀀스 생성
create sequence seq_app_d_idx;

select * from app_d
--전자결재 DB테이블 생성
create table app_d (
					app_d_idx 	  	   int,  		 --결재문서idx
					idx 	  	  	   int,  		 --사번idx
					next_idx           int,          --다음 결재자 idx
					doc_idx		  	   int,  		 --문서서식idx (지출 -1, 휴가-2, 구매-3....)
					a_line_idx 	  	   int,  		 --결재선idx
					app_document_title varchar2(50), --문서 제목
					app_one            int,			 --첫번째 결재자확인(0--대기, 1--결재, 2--반려)
					app_one_date       date,         --첫번째 결재 확인 날짜
					app_two            int,			 --두번째 결재자확인(0--대기, 1--결재, 2--반려)
					app_two_date       date,		 --두번째 결재 확인 날짜
					app_three          int,			 --세번째 결재자확인(0--대기, 1--결재, 2--반려)
					app_three_date     date,		 --세번째 결재 확인 날짜
					app_four           int,			 --네번째 결재자확인(0--대기, 1--결재, 2--반려)
					app_four_date      date,		 --네번째 결재 확인 날짜
					app_d_edate   	   date,  		 --결재완료일
					d_condition        int           --결재상태 확인(1--결재대기, 2--반려, 3--결재완료)
);
--개인키설정
alter table app_d add constraint pk_seq_app_d_idx primary key (app_d_idx); 

create or replace view app_user_view
as
select a.*, u.c_name, u.name from 
(select * from app_list_view) a inner join user_view u on a.idx=u.idx

create or replace view app_list_view
as
select d.doc_title, a.* from
(select * from document_type) d inner join app_d a on d.doc_idx=a.doc_idx

---------------------------------------------위에까지 한번에 등록하세요--------------------------------------------------
select * from app_d
select * from app_user_view
select * from app_line_view
select * from app_list_view
-----------------------------------------------시퀀스및 테이블 삭제----------------------------------------------------

drop sequence seq_app_d_idx;
drop table app_d;

----------------------------------------------------------------------------------------------------------------

--다른 테이블의 개인키와 연결
alter table app_d add constraint fk_app_d_user_idx foreign key(idx) references user_manager(idx)
alter table app_d add constraint fk_app_d_doc_idx foreign key(doc_idx) references document_type(doc_idx)
alter table app_d add constraint fk_app_a_line_idx foreign key(a_line_idx) references a_line(a_line_idx)


