--1️⃣ Tìm các sản phẩm có hơn 5 giao dịch
SELECT s.product_key , COUNT(distinct s.order_number ) as SoGD
from retails.sales s 
GROUP BY s.product_key 
having COUNT(distinct s.order_number ) > 5
order by SoGD DESC 

--2️⃣ Lấy danh sách thành phố có trên 20 khách hàng
SELECT c.city, COUNT(c.customer_key) as SOKH
from retails.customers c 
group by c.city
having COUNT(c.customer_key) > 20
order by SOKH DESC 

--3️⃣ Tìm thương hiệu có trung bình giá bán trên 300
select p.brand, AVG(p.unit_price_usd) as GiaTB
from retails.products p 
GROUP BY p.brand 
having AVG(p.unit_price_usd) > 300
order by GiaTB DESC 

--4️⃣ Lấy các cửa hàng có tổng diện tích lớn hơn 1000m²
SELECT s.store_key, s.square_meters
from retails.stores s 
where s.square_meters > 1000
ORDER by s.square_meters DESC 

--5️⃣ Tìm các năm có tổng số đơn hàng trên 1000 đơn
select year(s.order_date) as nam, count(distinct s.order_number) as sodontrongnam
from retails.sales s 
group by year(s.order_date)
having count(distinct s.order_number) > 1000
order by sodontrongnam DESC 

--6️⃣ Lấy các khách hàng có số lần giao dịch ≥ 5
select c.customer_key, COUNT(distinct s.order_number) as SoGD
from retails.sales s inner join retails.customers c 
on s.customer_key =c.customer_key
group by c.customer_key 
having COUNT(distinct s.order_number) >= 5
order by SoGD DESC 

--7️⃣ Tìm các màu sắc có hơn 3 loại sản phẩm khác nhau
select p.color, COUNT(p.product_key) as sosp
FROM retails.products p 
group by p.color
having COUNT(p.product_key) > 3
order by sosp DESC 
