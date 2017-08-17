--시퀀스 생성
create sequence seq_app_d_idx

--전자결재 DB테이블 생성
create table app_d (
					app_d_idx 	  int,  --결재문서idx
					idx 	  	  int,  --사번idx
					doc_idx 	  int,  --문서서식idx
					a_line_idx 	  int,  --결재선idx
					app_d_regdate date, --작성일
					app_d_edate   date  --결재완료일
)
--개인키설정
alter table app_d add constraint pk_seq_app_d_idx primary key (app_d_idx) 

--다른 테이블의 개인키와 연결
alter table app_d add constraint fk_app_d_user_idx foreign key(idx) references user_manager(idx)
alter table app_d add constraint fk_app_d_doc_idx foreign key(doc_idx) references document_type(doc_idx)
alter table app_d add constraint fk_app_a_line_idx foreign key(a_line_idx) references a_line(a_line_idx)

--시퀀스및 테이블 삭제
drop sequence seq_app_d_idx
drop table app_d

--샘플데이터 추가
insert into app_d values(seq_app_d_idx.nextVal, 3, 1, 1, sysdate, sysdate);
drop view app_doc_line
create or replace view app_doc_line
as
select final.*, LINE.a_line_name from
(select expense.*, doc.doc_title from 
(select da.company_name, da.user_name, d.* from inner join app_d d on da.idx=d.idx) expense 
inner join DOCUMENT_TYPE doc on expense.doc_idx = doc.doc_idx) final 
inner join a_line line on final.a_line_idx = line.a_line_idx

(select c.name company_name , u.name user_name, u.idx from USER_MANAGER u inner join company c on u.c_idx = c.idx )

select * from app_doc_line where idx = 3

d.app_d_idx, u.name, d.app_d_regdate, d.app_d_edate
 ,line.a_line_name, 

