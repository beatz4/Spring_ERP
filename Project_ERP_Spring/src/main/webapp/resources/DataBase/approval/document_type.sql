create sequence seq_doc_idx 

--�����������̺�
create table document_type(
							doc_idx int,             --����idx
							idx     int,             --�ۼ���idx
							doc_title varchar2(100), --��������
							regdate date             --�ۼ���¥					
)

--����Ű����
alter table document_type add constraint pk_doc_idx primary key (doc_idx)

--�ܺ�Ű����
alter table document_type add constraint fk_doc_user_idx foreign key (idx) references user_manager(idx)

--sample������
insert into document_type values(seq_doc_idx.nextVal, '������Ǽ�', 1, sysdate)

--������ ����, ���̺����, fk����(fk ������ ���ҽ� �� ���̺��ᶧ���� ������ �ȵ�)
drop sequence seq_doc_idx;
drop table document_type;
alter table document_type drop constraint fk_doc_user_idx

commit



--sampledata
insert into document_type values(seq_doc_idx.nextVal, 3, '������Ǽ�', sysdate);
insert into document_type values(seq_doc_idx.nextVal, 3, '�ް���û��', sysdate);
insert into document_type values(seq_doc_idx.nextVal, 3, '���ſ�û��', sysdate);

select * from document_type

select c.name, d.* from user_manager c inner join document_type d on c.idx = d.idx