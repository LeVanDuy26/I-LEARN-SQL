# 🧠 Day 4 – `ORDER BY` & `LIMIT` / `TOP`: Sắp xếp và giới hạn kết quả

# 🔹 1. `ORDER BY` – **Sắp xếp kết quả**

`ORDER BY` là mệnh đề trong SQL dùng để **sắp xếp kết quả truy vấn** theo một hoặc nhiều cột.

Bạn có thể sắp xếp:
- Theo thứ tự **tăng dần (ASC)** hoặc **giảm dần (DESC)**
- Theo **số, chữ, ngày tháng**, v.v.

### ✅ Cú pháp cơ bản:

```sql
SELECT column1, column2
FROM table_name
ORDER BY column1 [ASC | DESC];
````

| Từ khóa | Ý nghĩa                      |
| ------- | ---------------------------- |
| `ASC`   | Sắp xếp tăng dần *(default)* |
| `DESC`  | Sắp xếp giảm dần             |

📌 Có thể sắp xếp theo nhiều cột: `ORDER BY col1 ASC, col2 DESC` => Sắp xếp theo tăng dần cột 1, nếu trùng giá trị thì sắp xếp giảm dần theo cột 2


### 🔹 Ví dụ:

```sql
-- Sắp xếp sản phẩm theo giá giảm dần
SELECT product_name, price
FROM products
ORDER BY price DESC;
```

```sql
-- Sắp xếp đơn hàng theo ngày cũ → mới
SELECT order_id, order_date
FROM orders
ORDER BY order_date ASC;
```

---

# 🔹 2. `LIMIT` / `TOP` – **Giới hạn số dòng kết quả**

Khi bạn chỉ muốn lấy **một phần nhỏ kết quả**, ví dụ:

* Top 10 sản phẩm bán chạy
* 5 đơn hàng gần nhất
* 3 khách hàng có doanh thu cao nhất

→ Hãy dùng `LIMIT` (SQL chuẩn), hoặc `TOP` (SQL Server, Access)


### ✅ Cú pháp `LIMIT` (chuẩn, MySQL, PostgreSQL, SQLite):

```sql
SELECT column1
FROM table_name
ORDER BY column2 DESC
LIMIT N;
```

📌 `LIMIT N` nghĩa là chỉ lấy **N dòng đầu tiên sau khi sắp xếp**

---

### ✅ Cú pháp `TOP` (SQL Server):

```sql
SELECT TOP N column1
FROM table_name
ORDER BY column2 DESC;
```

📌 `TOP` đặt ngay sau `SELECT`, dùng trong SQL Server, không dùng trong MySQL.

---

## 🔍 Kết hợp `ORDER BY` + `LIMIT` để lấy Top N

```sql
-- Top 5 khách hàng chi nhiều nhất
SELECT customer_id, SUM(total_price) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;
```

```sql
-- 3 đơn hàng mới nhất
SELECT order_id, order_date
FROM orders
ORDER BY order_date DESC
LIMIT 3;
```

---

## ⚠️ Lỗi thường gặp

| Lỗi                            | Cách xử lý đúng                                        |
| ------------------------------ | ------------------------------------------------------ |
| Không `ORDER BY` trước `LIMIT` | `LIMIT` sẽ lấy dòng ngẫu nhiên nếu không có `ORDER BY` |
| Dùng `TOP` trong MySQL         | ❌ → MySQL không hỗ trợ `TOP`                           |
| Nhầm `ASC`, `DESC`             | Ghi rõ mục tiêu sắp xếp: tăng (`ASC`), giảm (`DESC`)   |

---


## 📝 Ghi nhớ:

> 🧠 "Muốn biết cái gì đứng đầu, hãy `ORDER BY ... DESC` rồi `LIMIT hoặc TOP()` lại!"

---

## 🔁 Ngày mai học gì?

Tiếp theo sẽ học về **JOIN** – cách **kết hợp nhiều bảng** với nhau để lấy dữ liệu đầy đủ và phong phú hơn.

