
# 🧠 Day 3 – Mệnh đề `GROUP BY`: Gom nhóm và tổng hợp dữ liệu

## 🔹 1. Mục đích của `GROUP BY`

`GROUP BY` là mệnh đề trong SQL dùng để **gom nhóm các dòng dữ liệu có giá trị giống nhau** theo một hoặc nhiều cột.

🎯 Thường dùng với **hàm tổng hợp (aggregate functions)** để:
- Tóm tắt dữ liệu theo từng nhóm
- Trả về **mỗi nhóm một dòng duy nhất**, thay vì từng dòng chi tiết


## 🔹 2. Cú pháp chuẩn

```sql
SELECT column_1, AGG_FUNC(column_2)
FROM table_name
WHERE condition
GROUP BY column_1;
```

📌 Trong đó:

* `column_1`: là cột để gom nhóm
* `AGG_FUNC(column_2)`: là hàm tổng hợp thực hiện tính toán trên mỗi nhóm


## 🔹 3. Các hàm tổng hợp phổ biến

| Hàm        | Ý nghĩa                    |
| ---------- | -------------------------- |
| `COUNT(*)` | Đếm số dòng trong mỗi nhóm |
| `SUM(col)` | Tổng giá trị trong nhóm    |
| `AVG(col)` | Trung bình trong nhóm      |
| `MIN(col)` | Giá trị nhỏ nhất           |
| `MAX(col)` | Giá trị lớn nhất           |


## 📌 Nguyên tắc cực kỳ quan trọng

> ✅ Trong `SELECT`, mọi cột phải:
>
> 1. Hoặc **nằm trong `GROUP BY`**
> 2. Hoặc **được tính bằng hàm tổng hợp** như `SUM()`, `COUNT()`, v.v.

📛 Nếu không tuân theo → sẽ bị lỗi cú pháp!

Ví dụ đúng:

```sql
SELECT category, COUNT(*) AS num_products
FROM products
GROUP BY category;
```

Ví dụ sai ❌:

```sql
SELECT category, price
FROM products
GROUP BY category;
-- sai vì cột price không được tổng hợp
```

## 💡 Ví dụ với dữ liệu `retails`

### 🧾 Đếm số đơn hàng theo khách hàng:

```sql
SELECT customer_id, COUNT(order_id) AS num_orders
FROM orders
GROUP BY customer_id;
```

### 💰 Tổng doanh thu theo tháng:

```sql
SELECT MONTH(order_date) AS order_month, SUM(total_price) AS revenue
FROM orders
GROUP BY MONTH(order_date);
```

### 📦 Số lượng từng loại sản phẩm đã bán:

```sql
SELECT product_name, SUM(quantity) AS total_sold
FROM order_details
GROUP BY product_name;
```

## ⚠️ Lỗi phổ biến khi dùng `GROUP BY`

| Lỗi                                                              | Cách xử lý đúng                                                                   |
| ---------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| `SELECT` cột không nằm trong `GROUP BY` và không có hàm tổng hợp | ➤ Thêm vào `GROUP BY` hoặc dùng `MAX()/MIN()/AVG()`                               |
| Gom nhóm nhưng kết quả không đúng logic                          | ➤ Kiểm tra lại cột nhóm và hàm tổng hợp                                           |
| Gom theo biểu thức nhưng không hiểu                              | ➤ Có thể dùng alias hoặc hàm như `MONTH()`, `YEAR()` trước rồi `GROUP BY` theo đó |

---

## ✅ Ghi nhớ nguyên tắc vàng

> 🔸 “Cột nào SELECT ra mà không có hàm tổng hợp → phải nằm trong GROUP BY.”

---

## 🔁 Ngày mai học gì?

Tiếp theo, mình sẽ học về **ORDER BY** – cách sắp xếp kết quả truy vấn tăng dần/giảm dần theo 1 hoặc nhiều cột.
Ví dụ: sắp xếp doanh thu cao nhất, xếp hạng khách hàng theo số đơn hàng,…

