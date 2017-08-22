create sequence seq_doc_idx 
drop sequence seq_doc_idx 

create table document_type(
							doc_idx int,             --서식idx
							doc_title varchar2(100), --서식제목
							doc_content clob,        --서식내용
							idx     int,             --작성자idx
							regdate date             --작성날짜					
)

alter table document_type add constraint pk_doc_idx primary key (doc_idx)

alter table document_type add constraint fk_doc_user_idx foreign key (idx) references user_manager(idx)

drop table document_type

select * from company where isParent=1 order by idx