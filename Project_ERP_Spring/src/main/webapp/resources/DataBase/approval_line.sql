create sequence seq_eap_line_idx 
drop sequence seq_eap_line_idx 

drop table eap_line
create table eap_line (
						eap_line_idx int,             --���缱idx
						idx          int,             --�����ȣ
                        eap_line_title varchar2(100), --���缱��
                        regdate      date             --��������
)

alter table eap_line add constraint pk_eap_line_idx primary key (eap_line_idx)

alter table eap_line add constraint fk_eap_line_idx foreign key (idx) references user_manager(idx) 

