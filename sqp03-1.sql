-- 집에 가고싶다. 학원가기 싫다. 날 집에 보내줘라.
desc customers;
show tables;
use my_shop;
select * from customers;

insert into customers
 (name, email, pass, address) values
 ('강감찬','kang@naver.com', 'password','인천 남동구 구월동');
 select * from custoemrs;
 desc products;
 
 insert into products
 (p_name, descr, price, stock_quantity) values
 ('갤력시','최신 AI 기능이 탑재된 고성능 스마트폰', 1000000, 55);
 select * from products;
 -- description
 INSERT INTO products (p_name, descr, price, stock_quantity) VALUES
('LG 그램', '초경량 디자인과 강력한 성능을 자랑하는 노트북', 500000, 35),
('아이폰', '직관적인 사용자 경험을 제공하는 스마트폰', 800000, 55),
('에어팟', '편리한 사용성의 무선 이어폰', 200000, 110),
('알뜰폰', NULL, 300000, 100);
select * from products;

truncate table products;
desc orders;
insert into orders
(customer_id, product_id, quantity) value
(1,1,1),
(2, 2, 1), 
(3, 3, 1), 
(1, 4, 2), 
(2, 2, 1);
select * from orders;
select * from customers;
select * from products;

-- 장영실-> password333

SET SQL_SAFE_UPDATES = 0; -- 안전 모드 해제 (0 = OFF)
update customers set pass='password333'
where name='장영실';
select * from customers;
SET SQL_SAFE_UPDATES = 1;
update customers set customer_id=10
 where customer_id=13;
select * from customers;
update customers set pass = 'password100'
where custoemr_id=10;
select * from custoemrs;

-- delete from customers
-- where customer_id=10;

-- 인덱스 생성 
create index i_price on products(price);
select * from products where price >=500000;
-- view(뷰) : 데이터를 따로 저장 안함, 필요한 것만 꺼내와서 사용자에게 보여줌
create view v_masking as 
	select
	 customer_id,
     name,
     email,
     join_date
    from customers; 
select * from v_ masking;

create view v_seoul as
	select customer_id, name, address
    from customers
    where address like '%서울%';
    -- like 와 같다, % 모든 문자 대체 (공백도 대체)
select * from v_seoul;

select * from products;
-- p_name, descr, price 조건: 설명(descr)중 ai

create view v_desc as
	select p_name, descr, price
    from products
    where descr like '%ai%';
    
select * from v_desc;

create view v_order_details as
select 
	o.order_id,
	c.name as 고객이름,
	p.p_name as 상품명,
	o.order_date as 주문일시,
    o.o_status as 주문상태
	from orders o
    join customers c on o.customer_id = c.customer_id
    join products p on o.product_id = p.product_id;

select * from v_order_details;
desc customers;
desc orders;

-- order => a	customers => b
-- order_id, customer_id, c_name, quantity
	-- 주문번호, 고객번호, 고객명, 수량 
    -- 주문 테이블의 고객번호 = 고객테이블의 고객번호
select * from v_orders_customers;
create view v_orders_customers as
select 
	a.order_id as 주문번호,
	b.customer_id as 고객번호,
	b.name as 고객명,
	a.quantity as 수량
	from orders a
    join customers b on a.customer_id = b.customer_id;
    
select * from v_orders_customers;

drop view v_masking;

select name, address from customers;

select * from products where price >= 700000;
-- customers => join_date 가 2026-1-1 이후 조회 
select * from customers
where join_date >= '2025-1-1';
-- price이 50만원 이상이면서 (stock_quantity)재고수량이 50 이상 
select * from products
where price >=500000 and stock_quantity >=50;
-- where 조건, between 0 and 10 : 범위
select * from products 
where price not between 500000 and 1000000;
-- in : 포함		not in : 포함 안됨
select * from products
where p_name not in ('갤럭시','아이폰','아이폰18');
select * from customers
where name like '%윤%';
-- _(밑줄) : 한글자
select * from customers
where name like '세___';
select * from customers
where address not like '서울특별시%';