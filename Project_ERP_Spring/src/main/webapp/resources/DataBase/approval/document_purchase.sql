create sequence seq_d_purchase_idx

create table d_purchase(
						d_purchase_idx 	  int,   		--일련번호
						app_d_idx         int,   		--결재문서
						d_puchase_regdate date,  		--작성일
						d_puchase_date    date,  		--요청일
						d_puchase_money   int,   		--총금액
						ip                varchar2(100) --ip
)

alter table d_purchase add constraint pk_d_purchase_idx primary key (d_purchase_idx)

alter table d_purchase add constraint fk_app_d_idx foreign key (app_d_idx) references app_d(app_d_idx)
alter table d_purchase drop constraint fk_app_d_idx
drop table d_purchase