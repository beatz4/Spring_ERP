create sequence seq_d_purchase_idx

create table d_purchase(
						d_purchase_idx 	  int,   		--�Ϸù�ȣ
						app_d_idx         int,   		--���繮��
						d_puchase_regdate date,  		--�ۼ���
						d_puchase_date    date,  		--��û��
						d_puchase_money   int,   		--�ѱݾ�
						ip                varchar2(100) --ip
)

alter table d_purchase add constraint pk_d_purchase_idx primary key (d_purchase_idx)

alter table d_purchase add constraint fk_app_d_idx foreign key (app_d_idx) references app_d(app_d_idx)
alter table d_purchase drop constraint fk_app_d_idx
drop table d_purchase