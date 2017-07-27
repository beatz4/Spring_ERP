create sequence seq_eap_line_idx 
drop sequence seq_eap_line_idx 

drop table eap_line
create table eap_line (
						eap_line_idx int,             --결재선idx
						idx          int,             --사원번호
                        eap_line_title varchar2(100), --결재선명
                        regdate      date             --생성일자
)

alter table eap_line add constraint pk_eap_line_idx primary key (eap_line_idx)

alter table eap_line add constraint fk_eap_line_idx foreign key (idx) references user_manager(idx) 

