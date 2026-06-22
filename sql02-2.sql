-- 상품 테이블
create table products(
	product_id int auto_increment primary key,
    p_name varchar(100) not null,
    descr text, -- 긴 문자열(설명)
    price int not null,
    stock_quantity int not null default 0 -- 재고수량
    );
desc products;