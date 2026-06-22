use my_shop;
select * from customers;
select * from products;
select * from orders;
-- products 상품명이 아로 시작 3글자 조회  
select * from products
where p_name like '아__';
-- products-> 상품명이 아로 시작 모든 데이터 조회
select * from products
where p_name like '아%';

-- products->price 500000 미만이거나 800000 초과 조회
select * from products
where price < 500000 or price > 800000;
-- between 이용 between 300000 and 500000(300000 ~ 500000)
select * from products
where price not between 500000 and 800000;
-- 상품명이 ('갤럭시', '아이폰', '에어팟') 일치하면 조회
select * from products
where p_name in ('갤럭시', '아이폰', '에어팟');

-- 정렬(order by): asc(오름차순, 기본으로 생략 가능), desc(내림차순)
-- desc(내림차순)

-- customers -> join_date(가입일시) 최근순으로 나열

select * from custmoers
order by join_date desc;
-- product -> price이 낮은 작은 금액부터 나오게 나열
select * from products order by price asc;
-- 다중 열 정렬(stock_quantity(재고수량) 큰것부터=> 가격(price) 작은것부터)
select * from products
order by stock_quantity desc, price asc;
-- 가격이 가장 비싼 상품 나열
select * from products
order by price desc limit 2; -- limit : 개수 제한 
-- 재고수량(stock_quantity)이 작은 상품 3개 조회
select * from products
order by stock_quantity asc limit 3;

select * from products
order by product_id asc limit 2,2;
-- limit 5,3 => 6,7,8

-- DISTINCT - 중복 제거, 속성명(열이름) 앞
select DISTINCT customer_id from orders;
SELECT DISTINCT product_id from orders;
SELECT * from products
where descr = null; -- null : 알 수 없음
-- null값을 겁사하기 위해서는 is null 사용 

SELECT product_id, p_name, descr is null from products;
-- descr is null : 참이면 1 거지

-- descr(설명)을 오름차순으로 정렬 
SELECT * from products 
order by descr asc;
-- null 값은 크기순으로 가장 작은 값 

-- 주소가 인천인 고객에 대해 고객테이블에서 이름과 주소 검색 
SELECT name, address from customers
where name in ( SELECT name from customers where address like '인천%');

-- 상품명, 가격 (상품테이블) -> 조건 상품코드 일치(in)
-- 상품코드3인 주문테이블에서 상품코드 
SELECT name, price from products
where product_id IN
(select product_id from orders where product_id =3); 

SELECT name, price, stock_quantity
from products
where name not in ('갤럭시','아이패드');
-- 상품테이블의 상품코드를 주문테이블의 상품코드와 일치 
SELECT * from products
where product_id
in (SELECT product_id from orders);