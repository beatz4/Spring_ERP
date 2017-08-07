create sequence seq_a_line_idx 

create table a_line (
						a_line_idx 			int,           --결재선idx
						idx          		int,           --사원번호
                        a_line_name 		varchar2(100), --결재선명
                        a_line_regdate      date           --생성일자
)

--개인키 설정
alter table a_line add constraint pk_a_line_idx primary key (a_line_idx)

--외부키 연결
alter table eap_line add constraint fk_eap_line_idx foreign key (idx) references user_manager(idx) 

--시퀀스 삭제및 테이블 삭제
drop sequence seq_a_line_idx 
drop table a_line

insert into a_line values(seq_a_line_idx.nextVal, 3, '내결제선', sysdate);
