create sequence seq_doc_idx 

--문서서식테이블
create table document_type(
							doc_idx int,             --서식idx
							idx     int,             --작성자idx
							doc_title varchar2(100), --서식제목
							regdate date             --작성날짜					
)

--개인키설정
alter table document_type add constraint pk_doc_idx primary key (doc_idx)

--외부키연결
alter table document_type add constraint fk_doc_user_idx foreign key (idx) references user_manager(idx)

--sample데이터
insert into document_type values(seq_doc_idx.nextVal, '지출결의서', 1, sysdate)

--시퀀스 삭제, 테이블삭제, fk삭제(fk 삭제를 안할시 전 테이블연결때문에 삭제가 안됨)
drop sequence seq_doc_idx;
drop table document_type;
alter table document_type drop constraint fk_doc_user_idx

commit



--sampledata
insert into document_type values(seq_doc_idx.nextVal, 3, '지출결의서', sysdate);
insert into document_type values(seq_doc_idx.nextVal, 3, '휴가신청서', sysdate);
insert into document_type values(seq_doc_idx.nextVal, 3, '구매요청서', sysdate);

select * from document_type

select c.name, d.* from user_manager c inner join document_type d on c.idx = d.idx