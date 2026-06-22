-- 주문 테이블
create table orders(
	order_id int auto_increment primary key,
    customer_id int not null,
    product_id int not null,
    quantity int not null constraint chk_order_quan check(quantity >= 1),
    -- constraint : 제약조건/ chk_order_quan(이름 명명)
    -- check(quantity >= 1) : 수량이 1개 이상 체크
    -- 
    order_date datetime default current_timestamp,
    o_status varchar(20) not null default '주문접수',
    
    constraint fk_orders_customers foreign key ( customer_id)
     references customers(customer_id)
     -- 주분테이블의 customer_id(외래키) - 고객테이블의 customer_id 연결
     on update cascade,
	 -- cascade : 부모테이블이 갱신(수정)/삭제되면 다른 자식테이블도 같이 수정/삭제
    
    constraint fk_orders_products foreign key (product_id)
     references products(product_id)
     -- 주문테이블의 produckt_id(외래키)- 상품테이블의 product_id 연결
     -- fk_orders_products : 제약조건마다 이름을 정함(우리가 만든 이름)
     on update cascade
);
desc orders;
desc customers;

use my_shop;
 desc customers;
 desc products;
 desc orders;
 
-- alter table : 이미 만든 테이블 구조 번경 
-- 열추가 :add column
alter table customers
add column point int not null default 0; -- 속성 추가 
desc customers;
select * from customers;

-- 열(속성, 필드) 변경 : modify column
alter table customers
modify column address varchar(300) not null;
desc customers;

-- 열 삭제 : drop column
alter table customers
drop column point;
desc customers;

alter table orders
alter o_status set default '주문접수 완료';
desc orders;

insert into customers 
 (name, email, pass, address, join_date) values
 ('이순신', 'sunsin@naver.com', 'password123', '서울특별시 중구 세종대로', '2026-05-01 10:30:00'),
('세종대왕', 'sejong@naver.com', 'password456', '서울특별시 종로구 사직로', '2025-04-01'),
('장영실', 'young@naver.com', 'password789', '부산광역시 동래구 복천동', '2026-03-10');
 
select * from customers;
alter table custoemrs
rename column name to c_name;
alter table customers
rename column password to pass;
desc customers

