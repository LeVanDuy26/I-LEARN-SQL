--  Ngày 1-2: Khám phá dữ liệu
-- Hiển thị tất cả thông tin của 5 khách hàng đầu tiên trong bảng gold_dim_customers
use winner_gold;
select *
from gold_dim_customers
limit 5;

-- Xem cấu trúc bảng gold_fact_orders để hiểu các cột có sẵn
describe gold_fact_orders;

-- Hiển thị 3 sản phẩm đầu tiên trong bảng gold_dim_products
select *
from gold_dim_products
limit 3;

-- Xem cấu trúc bảng gold_dim_pages để hiểu thông tin fanpage
describe gold_dim_pages

-- Hiển thị 10 đơn hàng đầu tiên trong bảng gold_fact_orders
select *
from gold_fact_orders
limit 10;

-- Xem cấu trúc bảng gold_fact_order_items để hiểu chi tiết đơn hàng

-- Hiển thị 5 fanpage đầu tiên trong bảng gold_dim_pages

-- Xem cấu trúc bảng gold_dim_shop để hiểu thông tin cửa hàng