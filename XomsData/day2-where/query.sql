--1️⃣ Lấy danh sách đơn hàng được đặt sau ngày 2023-01-01
SELECT *
from retails.sales s 
where s.order_date > '2023-01-01'

--2️⃣ Lấy khách hàng nữ sống tại Australia
SELECT *
from retails.customers c 
where c.gender = 'Female' and c.country = 'Australia'

--3️⃣ Lấy tên các sản phẩm có thương hiệu là 'Contoso'
select *
from retails.products p 
where p.product_name like 'Contoso%'

--4️⃣ Lấy cửa hàng có diện tích nhỏ hơn 500 mét vuông
select *
from retails.stores s 
where s.square_meters < 500

--5️⃣ Lọc sản phẩm có giá niêm yết trên 100 USD
select *
from retails.products p 
where p.unit_price_usd > 100

--6️⃣ Lấy các giao dịch có số lượng từ 10 đến 20 sản phẩm
SELECT *
from retails.sales s 
where s.quantity  between 10 and 20

--7️ Lấy khách hàng có ngày sinh trong khoảng từ năm 1990 đến năm 2000
select *
from retails.customers c 
where c.birthday between '1990-01-01' and '2000-12-31'

--8 Lấy danh sách khách hàng có họ bắt đầu bằng chữ "Nguyễn" và đang sống tại Việt Nam.
select c.customer_key , c.name, c.city
from retails.customers c 
where c.name like 'Nguyễn%' and c.city = 'Viet Nam'

--9 Lấy các sản phẩm có tên chứa từ "Pro" và giá từ 50 đến 300 USD, ngoại trừ các sản phẩm thuộc thương hiệu "Fabrikam".
SELECT p.product_key, p.product_name, p.unit_cost_usd , p.brand
from retails.products p 
where p.product_name like '%Pro%' and p.unit_cost_usd between 50 and 300 and p.brand != 'Fabrikam'
