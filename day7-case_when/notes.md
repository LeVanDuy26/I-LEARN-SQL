# 🧠 Day 7 – `CASE WHEN`: Phân loại dữ liệu theo điều kiện

# **🎯 1. `CASE WHEN` là gì?**

- `CASE WHEN` là **mệnh đề điều kiện** trong SQL, tương tự như `IF - ELSE` trong ngôn ngữ lập trình.
- Giúp bạn **gán giá trị tùy theo điều kiện** cho từng dòng kết quả.
- Dùng để:
  - Phân loại nhóm giá trị
  - Tạo cột mới theo điều kiện
  - Thống kê theo nhãn tùy chỉnh

---

# **🔹 2. Cú pháp tổng quát**

```sql
SELECT
  column1,
  CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ...
    ELSE result_default
  END AS new_column
FROM table_name;
````

| Thành phần | Vai trò                                                           |
| ---------- | ----------------------------------------------------------------- |
| `WHEN`     | Điều kiện                                                         |
| `THEN`     | Giá trị nếu điều kiện đúng                                        |
| `ELSE`     | Giá trị mặc định nếu không có điều kiện nào đúng (không bắt buộc) |
| `END`      | Kết thúc biểu thức CASE                                           |

📌 Bạn có thể dùng `CASE WHEN` trong:

* `SELECT`
* `ORDER BY`
* `GROUP BY` (cẩn thận)
* `WHERE` (nhưng ít gặp)

---

# **🔹 3. Ví dụ thực tế**

### 🔸 Phân loại giá sản phẩm:

```sql
SELECT product_name,
       list_price,
       CASE
         WHEN list_price >= 1000 THEN 'Cao cấp'
         WHEN list_price >= 500 THEN 'Trung bình'
         ELSE 'Bình dân'
       END AS price_segment
FROM products;
```

---

### 🔸 Phân loại doanh thu:

```sql
SELECT customer_id,
       SUM(total_price) AS revenue,
       CASE
         WHEN SUM(total_price) > 1000 THEN 'VIP'
         WHEN SUM(total_price) > 500 THEN 'Thân thiết'
         ELSE 'Thường'
       END AS segment
FROM orders
GROUP BY customer_id;
```

---

### 🔸 Đánh dấu sản phẩm còn hàng:

```sql
SELECT product_name,
       stock_quantity,
       CASE
         WHEN stock_quantity = 0 THEN 'Hết hàng'
         ELSE 'Còn hàng'
       END AS stock_status
FROM products;
```

---

# 🔹 **4. Ứng dụng thực tế**

| Tình huống                             | Dùng `CASE WHEN` để                   |
| -------------------------------------- | ------------------------------------- |
| Phân loại khách hàng theo mức chi tiêu | Tạo cột "segment"                     |
| Gắn nhãn giá trị                       | Chuyển số sang nhãn như 'Cao', 'Thấp' |
| Tạo báo cáo nhóm linh hoạt             | Phân nhóm trước khi tổng hợp          |

---

## ⚠️ Lỗi thường gặp

| Lỗi                          | Cách khắc phục                                |
| ---------------------------- | --------------------------------------------- |
| Quên `END` ở cuối `CASE`     | Thêm `END` trước `AS`                         |
| Không đặt tên cột mới (`AS`) | Nên đặt alias rõ ràng                         |
| Điều kiện bị chồng lên nhau  | Sắp xếp điều kiện từ cao → thấp để đúng logic |

---

## ✅ Ghi nhớ:

> 🧠 "`CASE WHEN` = `IF – ELSE` trong SQL – gắn nhãn thông minh cho dữ liệu!"

---

## 🔁 Ngày mai học gì?

Tiếp theo, mình sẽ học về **`Window Function`** – một công cụ cực kỳ mạnh để thực hiện phân tích nâng cao như: xếp hạng (`RANK`), tính lũy kế (`SUM OVER`), so sánh giữa các dòng (`LAG`, `LEAD`) mà không làm mất dữ liệu chi tiết.

