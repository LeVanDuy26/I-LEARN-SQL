# 🧠 Day 2 – Mệnh đề `WHERE`: Lọc dữ liệu theo điều kiện

## 1️⃣ GIỚI THIỆU

`WHERE` là **mệnh đề dùng để lọc các bản ghi (row)** trong bảng SQL.  
Chỉ các dòng nào **thỏa mãn điều kiện** mới được hiển thị trong kết quả.

---

## 2️⃣ CÚ PHÁP CƠ BẢN

```sql
SELECT column1, column2
FROM table_name
WHERE điều_kiện;
````

🔍 `WHERE` đứng **sau FROM**, **trước GROUP BY / ORDER BY**

---

## 3️⃣ CÁC LOẠI ĐIỀU KIỆN TRONG `WHERE`

| **Loại**                           | **Cú pháp / Ý nghĩa**                   |
| ---------------------------------- | --------------------------------------- |
| 🔢 **So sánh giá trị**             |                                         |
| `=`                                | Bằng                                    |
| `<>` hoặc `!=`                     | Khác                                    |
| `>` `<` `>=` `<=`                  | Lớn hơn, nhỏ hơn, lớn hơn hoặc bằng,... |
| 🔀 **Toán tử logic**               |                                         |
| `AND`                              | Thỏa **tất cả** điều kiện               |
| `OR`                               | Thỏa **ít nhất một** điều kiện          |
| `NOT`                              | Phủ định                                |
| 🔎 **Tìm trong tập hợp**           |                                         |
| `IN (val1, val2, ...)`             | Tương đương: `col = val1 OR col = val2` |
| **Ví dụ:**                         | `WHERE country IN ('UK', 'USA')`        |
| 🧩 **Khớp mẫu (Pattern Matching)** |                                         |
| `LIKE '%abc%'`                     | Chứa chuỗi `'abc'`                      |
| `%`                                | Đại diện **chuỗi bất kỳ**               |
| `_`                                | Đại diện **1 ký tự bất kỳ**             |
| 📦 **NULL & NOT NULL**             |                                         |
| `IS NULL`                          | Không có giá trị                        |
| `IS NOT NULL`                      | Có giá trị                              |
| 🎯 **Khoảng giá trị**              |                                         |
| `BETWEEN x AND y`                  | Nằm giữa x và y (bao gồm cả 2 đầu)      |

---

## 4️⃣ VÍ DỤ THỰC TẾ VỚI `retails` DATASET

### 🔹 So sánh:

```sql
SELECT *
FROM orders
WHERE quantity > 10;
```

### 🔹 Kết hợp điều kiện:

```sql
SELECT *
FROM customers
WHERE country = 'Vietnam' AND age >= 25;
```

### 🔹 Tìm trong danh sách:

```sql
SELECT *
FROM products
WHERE category IN ('Electronics', 'Clothing');
```

### 🔹 Dữ liệu bị thiếu:

```sql
SELECT *
FROM orders
WHERE ship_date IS NULL;
```

### 🔹 Khớp tên sản phẩm:

```sql
SELECT *
FROM products
WHERE product_name LIKE '%chua%';
```

---

## 5️⃣ LỖI PHỔ BIẾN & CÁCH KHẮC PHỤC

| Lỗi thường gặp                          | Cách xử lý đúng                               |
| --------------------------------------- | --------------------------------------------- |
| So sánh với `NULL` bằng `=`             | ❌ `col = NULL` → ✅ `col IS NULL`              |
| Viết `IN` nhưng không dùng dấu ngoặc    | ❌ `col IN 'A', 'B'` → ✅ `col IN ('A', 'B')`   |
| Dùng `AND`, `OR` mà không có ngoặc nhóm | → Gây hiểu nhầm logic → Nên dùng `()` rõ ràng |

---

## 6️⃣ TỔNG KẾT

* `WHERE` giúp **lọc dữ liệu đầu vào**
* Kết hợp nhiều loại điều kiện với `AND`, `OR`, `IN`, `BETWEEN`, `LIKE`, `NULL`
* Là bước quan trọng giúp **truy vấn đúng và hiệu quả**

---

## 🔁 Ngày mai học gì?

➡ **`GROUP BY`** – Gom nhóm dữ liệu và tính toán tổng, trung bình, đếm, v.v.
- Ví dụ: Doanh thu theo từng khách hàng, số đơn hàng theo ngày,...


