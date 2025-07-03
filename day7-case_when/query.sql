/* 1️⃣ Phân loại đơn hàng theo số lượng:
Với bảng sales, tạo thêm cột phân loại:
'Đơn lớn' nếu quantity >= 10
'Đơn vừa' nếu quantity từ 5 đến 9
'Đơn nhỏ' nếu < 5 */
SELECT s.order_number, s.quantity,
case
	when s.quantity >= 10 then 'don lon'
	when s.quantity between 5 and 9 then 'don vua'
	else 'don be'
end as PhanLoai
FROM retails.sales s 
order by s.quantity ASC 


--2️⃣ Phân loại sản phẩm theo giá:
--Truy vấn bảng products và phân loại:
--'Cao cấp' nếu unit_price_usd >= 500
--'Trung cấp' nếu trong khoảng 200–499
--'Bình dân' nếu dưới 200
SELECT p.product_key , p.product_name, p.unit_price_usd,
case
	when p.unit_price_usd >= 500 then 'cao cap'
	when p.unit_price_usd between 200 and 499 then 'trung cap'
	else 'binh dan'
end as Phan_loai
from retails.products p 
order by p.unit_price_usd asc

--3️⃣ Phân loại khách hàng theo độ tuổi:
--Tính tuổi dựa trên cột birthday và phân loại:
--'Trẻ' nếu < 25 tuổi
--'Trung niên' nếu từ 25 đến 45
--'Lớn tuổi' nếu > 45
SELECT c.name, DATEDIFF(year, c.birthday, GETDATE()) as tuoi,
CASE 
	when DATEDIFF(year, c.birthday, GETDATE()) < 25 then 'tre'
	when DATEDIFF(year, c.birthday, GETDATE()) < 45 then 'trung nien'
	else 'lon tuoi'
END as phanloai
from retails.customers c 
order by tuoi asc


--4️⃣ Phân vùng khách hàng theo khu vực địa lý:
--Dựa vào cột continent trong bảng customers, phân nhóm:
--'Châu Á', 'Châu Âu', 'Châu Mỹ'
--Các vùng còn lại gộp vào 'Khác'
SELECT c.customer_key, c.name , c.continent,
case
	when c.continent = 'Aisa' then 'Chau A'
	when c.continent = 'Europe' then 'Chau Au'
	when c.continent = 'North America' then 'Chau My'
	else 'Khac'
end as KhuVuc
from retails.customers c 
order by c.continent desc


--5️⃣ Phân loại cửa hàng theo diện tích:
--Từ bảng stores, tạo phân loại:
--< 500m² → 'Nhỏ'
--500–999m² → 'Vừa'
-->= 1000m² → 'Lớn'
select s.store_key, s.square_meters,
case
	when s.square_meters < 500 then 'nho'
	when s.square_meters =< 999 then 'vua'
	else 'lon'
end as phanloai
from retails.stores s 


--1️⃣
--Tính tổng số lượng sản phẩm đã bán theo từng thương hiệu, đồng thời phân loại:
--'Bán chạy' nếu tổng số lượng ≥ 1000
--'Trung bình' nếu từ 500 đến 999
--'Chậm' nếu < 500
select p.brand, sum(s.quantity) as TongSP,
case 
	when sum(s.quantity) >= 1000 then 'Bán chạy'
	when sum(s.quantity) between 500 and 999 then 'Trung bình'
	else 'Chậm'
end as PhanLoai
from retails.sales s inner join retails.products p 
on s.product_key = p.product_key
group by p.brand 

--2️⃣
--Trong bảng customers, phân loại khách hàng theo độ tuổi thành 'Trẻ', 'Trung niên', 'Già' như bạn đã làm, 
--sau đó đếm số lượng khách hàng theo từng nhóm tuổi.
--Kết quả gồm: nhóm tuổi, số khách hàng
SELECT 
  CASE 
    WHEN DATEDIFF(YEAR, c.birthday, GETDATE()) < 25 THEN 'tre'
    WHEN DATEDIFF(YEAR, c.birthday, GETDATE()) < 45 THEN 'trung nien'
    ELSE 'lon tuoi'
  END AS phanloai,
  COUNT(*) AS so_khach
FROM retails.customers c
GROUP BY 
  CASE 
    WHEN DATEDIFF(YEAR, c.birthday, GETDATE()) < 25 THEN 'tre'
    WHEN DATEDIFF(YEAR, c.birthday, GETDATE()) < 45 THEN 'trung nien'
    ELSE 'lon tuoi'
  END
ORDER BY so_khach DESC;