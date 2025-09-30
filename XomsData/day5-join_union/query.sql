--Phần 1 – JOIN (5 câu)
--1️ Lấy order_number, order_date, và customer name từ bảng sales và customers
SELECT c.name , s.order_number , s.order_date 
FROM retails.sales s 
INNER JOIN retails.customers c 
ON S.customer_key = C.customer_key 

--2️ Lấy product_name và brand của mỗi dòng trong bảng sales
SELECT P.product_name , P.brand 
FROM retails.sales s 
INNER JOIN retails.products p 
ON S.product_key = P.product_key 

--3️ Lấy store_name và square_meters của mỗi đơn hàng
SELECT DISTINCT S.store_key , S2.square_meters 
FROM retails.sales s 
INNER JOIN retails.stores s2 
ON S.store_key = S2.store_key 
ORDER BY S.store_key ASC 

--4️ Lấy tất cả đơn hàng, kể cả khi không có product_key khớp (dùng LEFT JOIN)
SELECT S.order_number , S.product_key , P.product_key 
FROM retails.sales s LEFT JOIN retails.products p 
ON S.product_key  = P.product_key 
ORDER BY S.product_key ASC

--5️ Lấy danh sách sản phẩm và thông tin đơn hàng, kể cả khi chưa có đơn nào 
SELECT P.product_key , P.product_name , S.order_number 
FROM retails.products p  LEFT JOIN retails.sales s 
ON P.product_key = S.product_key
WHERE s.order_number IS NULL

--🧩 Phần 2 – UNION (3 câu)

--8 Tách riêng 2 câu truy vấn để lấy order_number từ các đơn hàng năm 2020 và 2021.
-- Sau đó, gộp kết quả truy vấn và không loại trùng
SELECT s.order_number, s.order_date FROM retails.sales s WHERE S.order_date LIKE '2020%'
UNION ALL
SELECT s.order_number, s.order_date FROM retails.sales s WHERE S.order_date LIKE '2021%'


--Lấy thoong tin 5 khách hàng có tổng số lượng sản phẩm mua nhiều nhất, chỉ tính các đơn hàng được đặt sau ngày 01/01/2017.
SELECT top(5) s.customer_key, c.name, sum(s.quantity) as TongSP
FROM retails.sales s 
inner join retails.customers c 
on s.customer_key = c.customer_key
WHERE s.order_date > '01-01-2017'
group by s.customer_key, c.name
order by TongSP DESC 

--Liệt kê các sản phẩm có tổng doanh thu vượt 10.000 USD, kèm theo tên sản phẩm và thương hiệu, sắp xếp giảm dần theo doanh thu.
SELECT s.product_key, p.product_name, p.brand, 
       SUM(s.quantity) AS TongSP,
       p.unit_price_usd,
       SUM(s.quantity) * p.unit_price_usd AS TongDT
FROM retails.sales s
INNER JOIN retails.products p ON s.product_key = p.product_key
GROUP BY s.product_key, p.product_name, p.brand, p.unit_price_usd
HAVING SUM(s.quantity) * p.unit_price_usd > 10000
ORDER BY TongDT DESC;

--Lấy 3 thương hiệu có tổng số lượng sản phẩm bán ra nhiều nhất trong năm 2019.
SELECT top(3) p.brand, SUM(s.quantity) as TSSP
from retails.sales s inner join retails.products p 
on s.product_key = p.product_key
WHERE s.order_date like '2019%'
GROUP BY p.brand
order by TSSP DESC 

--Liệt kê các khách hàng nữ sống tại Australia có từ 3 đơn hàng trở lên, sắp xếp theo số đơn hàng giảm dần.
select c.customer_key, c.name , COUNT(distinct s.order_number) as SoDH
from retails.customers c inner join retails.sales s 
on c.customer_key = s.customer_key
where c.gender = 'Female' and c.country = 'Australia'
group by c.customer_key, c.name
having COUNT(distinct s.order_number) >= 3
order by SoDH DESC 










