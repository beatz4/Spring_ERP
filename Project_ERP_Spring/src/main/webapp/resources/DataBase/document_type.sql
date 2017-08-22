create sequence seq_doc_idx 
drop sequence seq_doc_idx 

create table document_type(
							doc_idx int,             --����idx
							doc_title varchar2(100), --��������
							doc_content clob,        --���ĳ���
							idx     int,             --�ۼ���idx
							regdate date             --�ۼ���¥					
)

alter table document_type add constraint pk_doc_idx primary key (doc_idx)

alter table document_type add constraint fk_doc_user_idx foreign key (idx) references user_manager(idx)

drop table document_type

select * from company where isParent=1 order by idx