create sequence seq_c_purchase_idx

create table c_purchase(
						c_purchase_idx int,   			--일련번호
						t_purchase_idx int,    			--계정과목(구매)일련번호
						c_purchase_name varchar2(100), 	--품명
						c_purchase_unit varchar2(50), 	--단위
						c_purchase_uprice int,        	--단가
						c_purchase_quantity int,    	--수량
						c_purchase_price   int,      	--총금액
						c_purchase_et   varchar2(100) 	--비고
)


alter table c_purchase add constraint pk_c_purchase_idx primary key (c_purchase_idx)

alter table c_purchase add constraint fk_t_purchase_idx foreign key (t_purchase_idx) references t_purchase(t_purchase_idx)

drop table c_purchase