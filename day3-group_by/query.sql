--1️⃣ Tính tổng số lượng sản phẩm đã bán theo từng product_id
select s.product_key, count(s.quantity ) as SoSPDB
from retails.sales s 
group by s.product_key 

--2️⃣ Tính trung bình giá niêm yết theo từng brand
SELECT p.brand, AVG(p.unit_price_usd) as GiaTB
from retails.products p 
group by p.brand

--3️⃣ Đếm số lượng khách hàng theo từng giới tính (gender)
SELECT c.gender, COUNT(c.customer_key) as SoKH
from retails.customers c 
group by c.gender

--4️⃣ Tính tổng doanh số theo store_key
SELECT s.store_key, SUM(s.quantity) as SoLuong
from retails.sales s 
group by s.store_key 

--5️⃣ Tính trung bình diện tích theo từng thành phố (city)
SELECT s.country, AVG(s.square_meters) as DTTB
from retails.stores s 
group by s.country

--6️⃣ Đếm số đơn hàng theo ngày đặt hàng (order_date)
SELECT s.order_date, COUNT(s.order_number ) as SoDH
from retails.sales s 
group by s.order_date