--BAI1: SELECT - FROM

--1. Lấy order_number và order_date từ bảng sales
SELECT s.order_number , s.order_date 
from retails.sales s 

--2. Lấy name, gender, city từ bảng customers
SELECT c.name , c.gender , c.city 
from retails.customers c

--3. Lấy product_name, brand, color từ bảng products
select p.product_name , p.brand , p.color 
from retails.products p 

--4. Hiển thị tất cả thông tin từ bảng stores
SELECT *
from retails.stores s 

--5. Lấy store_key và square_meters từ bảng stores
select s.store_key , s.square_meters 
from retails.stores s 