-- 산술연산 
use my_shop;
SELECT name, price, stock_quantity,
price*stock_quantity as 재고금액 
from products;

-- 상품 가격에 택배비 3000원을 추가하여 실제 구매 금액 구함-> 상품명, 가격, 실제구매금액 
SELECT p_name, price, price+3000 as 실제구매금액
from products;

-- 상품 가격을 10으로 나누어 10개월 무이자 할부시 월 납부액을 구함 
-- 상품명, 가격, 월, 납부액 
SELECT p_name, price, price/10 as `월_납부액` -- 백틱(`) 
from products;
-- 문자열 함수
-- concat : 문자 연결 
SELECT name, email from customers;

SELECT 
	concat(name,'(', email, ')') as `이름과 메일`
from customers;

SELECT email, upper(email) as 대문자메일
from customers;

SELECT name, char_length(name) as 글자수,
length(name) as 바이트수
from customers;
-- utf-8 : 한글 1자가 3바이트
SELECT p_name, ifnull(descr, '상품설명없음') as 설명
from products;
-- ifnull(null이면 , '상품설명없음'반환)

SELECT email,
substring_index2(email, '@',1) as 아이디 
from custoemrs;
-- 1;왼쪽  -1:오른쪽 