# 🧠 Day 5 – `JOIN` & `UNION`: Kết nối và gộp dữ liệu từ nhiều bảng
> Quan trọng cần chú ý !
# 🎯 PHẦN 1 – `JOIN`: Kết nối dữ liệu giữa nhiều bảng

## ✅ 1. `JOIN` là gì?

- `JOIN` giúp **kết hợp dữ liệu từ 2 hay nhiều bảng** dựa trên mối quan hệ giữa các cột (thường là **khóa ngoại** – foreign key trỏ đến **khóa chính** – primary key).
- Dùng để **ghép thông tin chi tiết từ các bảng liên quan**, ví dụ:
  - Lấy **tên khách hàng** từ bảng đơn hàng
  - Lấy **giá sản phẩm** từ bảng chi tiết đơn hàng


## 🔍 2. Cú pháp chuẩn

```sql
SELECT A.col1, B.col2
FROM TableA A
JOIN TableB B ON A.common_key = B.common_key;
````

📌 Ghi chú:

* `JOIN` mặc định là `INNER JOIN`
* Có thể dùng bí danh bảng: `A`, `B` để viết ngắn gọn


## 📊 3. Các loại JOIN phổ biến

| Loại JOIN         | Ý nghĩa                                                 | Kết quả                                      |
| ----------------- | ------------------------------------------------------- | -------------------------------------------- |
| `INNER JOIN`      | Chỉ giữ **dòng khớp** ở cả 2 bảng                       | Ví dụ: khách hàng có đơn hàng                |
| `LEFT JOIN`       | Giữ **mọi dòng bên trái**, bên phải NULL nếu không khớp | Ví dụ: tất cả đơn hàng, kể cả không có khách |
| `RIGHT JOIN`      | Giữ **mọi dòng bên phải**, bên trái NULL nếu không khớp | Ví dụ: tất cả khách hàng, kể cả chưa mua gì  |
| `FULL OUTER JOIN` | Giữ tất cả dòng cả hai bên, khớp hay không              | Tổng hợp dữ liệu toàn diện                   |
| `CROSS JOIN`      | Tổ hợp tất cả cặp dòng giữa 2 bảng (n1 × n2)            | Thường dùng thử nghiệm, tạo ma trận  (ít dùng)        |


## 🔸 Ví dụ minh họa (cơ bản):

### 1. `INNER JOIN`: Lấy đơn hàng + tên khách hàng

```sql
SELECT o.order_id, c.customer_name
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;
```

### 2. `LEFT JOIN`: Lấy tất cả đơn hàng, kể cả khi khách bị xóa

```sql
SELECT o.order_id, c.customer_name
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id;
```

## ⚠️ Lưu ý khi JOIN:

| Tình huống                                          | Gợi ý                                             |
| --------------------------------------------------- | ------------------------------------------------- |
| Có nhiều dòng lặp lại                               | Kiểm tra lại `JOIN` có bị **nhân bản dòng** không |
| Khớp sai cột                                        | Đảm bảo `ON` là đúng khóa chính – khóa ngoại      |
| Có thể dùng `USING (column)` nếu cột tên giống nhau | Với MySQL, PostgreSQL                             |


# 🎯 PHẦN 2 – `UNION`: Gộp kết quả từ nhiều truy vấn


## ✅ 1. `UNION` là gì?

* Dùng khi muốn **gộp kết quả từ 2 hoặc nhiều truy vấn**
* Không cần JOIN – chỉ cần các truy vấn có cùng số cột và kiểu dữ liệu


## 🔍 2. Cú pháp chuẩn:

```sql
SELECT column1, column2
FROM table_A
UNION [ALL]
SELECT column1, column2
FROM table_B;
```

| Loại        | Ý nghĩa                      |
| ----------- | ---------------------------- |
| `UNION`     | Loại bỏ các dòng trùng nhau  |
| `UNION ALL` | Giữ tất cả dòng, kể cả trùng |

---

## 💡 Ví dụ:

```sql
-- Gộp danh sách email từ bảng khách hàng và nhân viên
SELECT email FROM customers
UNION
SELECT email FROM employees;
```

```sql
-- Gộp lịch sử đơn hàng từ 2 bảng (nếu chia theo năm)
SELECT * FROM orders_2023
UNION ALL
SELECT * FROM orders_2024;
```

---

## 📌 Lưu ý khi dùng UNION:

| Lỗi thường gặp                    | Giải pháp                                           |
| --------------------------------- | --------------------------------------------------- |
| Số cột không khớp                 | Phải đảm bảo số lượng và kiểu dữ liệu giống nhau    |
| Khó phân biệt dữ liệu từ bảng nào | Thêm cột phụ kiểu `SELECT ..., 'Nguồn A' AS source` |

---

## 🧠 Tổng kết:

| `JOIN`                                          | `UNION`                                               |
| ----------------------------------------------- | ----------------------------------------------------- |
| Kết nối nhiều bảng theo cột chung               | Gộp kết quả của nhiều truy vấn có cấu trúc giống nhau |
| Dựa vào mối quan hệ khóa chính – khóa ngoại     | Không cần mối quan hệ – chỉ cần cùng định dạng        |
| Dùng để mở rộng chiều ngang dữ liệu (nhiều cột) | Dùng để mở rộng chiều dọc (nhiều dòng)                |

---

## 🔁 Ngày mai học gì?

Tiếp theo mình sẽ học về **`HAVING`** – cách lọc kết quả sau khi đã `GROUP BY`, và hiểu sự khác nhau giữa `WHERE` và `HAVING`.
