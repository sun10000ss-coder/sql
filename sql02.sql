-- <쇼핑몰 테이블>
/*쇼핑몰 테이블 실전 설계
고객 (customers)
- 고객 id, 이름, 이메일, 비밀번호, 주소, 가입 시각 
상품 (products)
- 상품 id, 상품명, 설명, 가격, 재고 수량 
주문 (orders)
- 주문 id, 주문 고객, 주문 상품, 주문 수량, 주문 시각, 주문 상태
- 주문이 등록되면 최초의 주문 상태는 주문상태가 된다
- 한 번의 주문 시에 한 종류의 상품만 주문할 수 있다. 한 종류의 상품을 여러 개 주문하는 것은 가능하다.*/
use my_shop;
-- 고객 테이블 
create table customers(
	customer_id int auto_increment primary key,-- 고객 id
    -- auto_increment: 자동 번호 부여 primary key: 기본키 
    c_name varchar(50) not null,-- varchar(50):가변, 최대 50 / char(50):고정
    email varchar(100) not null unique,-- not null : 공백 안됨(꼭 입력)
    -- unique :중복 안됨(고유의 하나)
    pass varchar(255) not null,
    address varchar(200) not null,
    join_date datetime default current_timestamp-- 가입일시 
    -- date : 날짜 datetime :날짜/시간 
    -- default : 기본값(입력하지 않으면 기본으로 들어가 있는 값)
    -- current_timestamp :현재 지금 날짜/시간
    );
desc customers;-- desc :구조
-- drop table custmers;
-- drop table custmers;
