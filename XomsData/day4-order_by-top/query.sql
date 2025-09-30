--1️ Hiển thị danh sách sản phẩm theo thứ tự giảm dần của list_price
select p.product_name, p.unit_price_usd
from retails.products p 
ORDER BY p.unit_price_usd DESC 

--2️ Lấy 5 khách hàng có ngày sinh muộn nhất
SELECT top(5) c.name, c.birthday
from retails.customers c 
ORDER BY c.birthday DESC 

--3️ Hiển thị 10 đơn hàng có số lượng sản phẩm nhiều nhất
SELECT top(10) s.order_number, sum(s.quantity) as totalSP
from retails.sales s 
group by s.order_number
order by totalSP DESC

--4️ Lấy 3 thương hiệu có giá niêm yết trung bình cao nhất
SELECT top(3) p.brand , AVG(p.unit_price_usd) as GNY
from retails.products p 
group by p.brand
order by GNY DESC 

--5️ Hiển thị tất cả cửa hàng, sắp xếp theo square_meters từ nhỏ đến lớn
SELECT s.store_key, s.square_meters
from retails.stores s 
ORDER BY s.square_meters ASC 

--6: Lấy 5 sản phẩm có tổng số lượng bán ra cao nhất, chỉ tính những giao dịch có từ 2 sản phẩm trở lên.
select top(5) s.product_key , sum(s.quantity) as Tong_ban_ra 
from retails.sales s 
WHERE s.quantity >=2
group by s.product_key
order by Tong_ban_ra DESC 

--7: Lấy 3 thương hiệu có trung bình giá niêm yết cao nhất, chỉ xét các sản phẩm có giá trên 100 USD.
SELECT top(3) p.brand , AVG(p.unit_price_usd) as GiaTB
from retails.products p 
where p.unit_price_usd > 100
GROUP BY p.brand
order by GiaTB DESC 

--8: Lấy 10 khách hàng có tổng số đơn hàng lớn nhất, nhưng chỉ tính các đơn hàng được đặt sau năm 2015.
SELECT top(10) s.customer_key, COUNT(distinct s.order_number) as TSDH
from retails.sales s 
where s.order_date > '2015-12-31'
GROUP by s.customer_key
order by TSDH DESC 






















