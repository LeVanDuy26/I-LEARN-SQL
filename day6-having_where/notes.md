# 🧠 Day 6 – `HAVING`: Lọc dữ liệu sau khi tổng hợp (`GROUP BY`)


# 🔹 **1. `HAVING` là gì?**

- `HAVING` là mệnh đề dùng để **lọc dữ liệu sau khi đã `GROUP BY`**.
- Khác với `WHERE` (lọc từng dòng gốc), `HAVING` **lọc từng nhóm kết quả** sau tổng hợp.
- Dùng kèm với các **hàm tổng hợp** như: `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`.

---

# 🔹 **2. So sánh `WHERE` vs `HAVING`**

| Mệnh đề | Lọc khi nào? | Áp dụng lên | Hỗ trợ hàm tổng hợp? |
|---------|--------------|-------------|-----------------------|
| `WHERE` | Trước `GROUP BY` | Từng dòng dữ liệu | ❌ Không |
| `HAVING` | Sau `GROUP BY` | Từng nhóm | ✅ Có |

📌 Ghi nhớ:  
> - Dữ liệu → `WHERE` → nhóm `GROUP BY` → lọc kết quả nhóm với `HAVING`


# 🔹 **3. Cú pháp chuẩn**

```sql
SELECT column_group, AGG_FUNC(column_calc)
FROM table_name
WHERE điều_kiện
GROUP BY column_group
HAVING điều_kiện_trên_nhóm;
````


# 🔹 **4. Ví dụ thực tế với `retails` dataset**

### 🔸 Tìm sản phẩm bán được hơn 100 đơn:

```sql
SELECT product_key, COUNT(DISTINCT order_id) AS total_orders
FROM sales
GROUP BY product_key
HAVING COUNT(DISTINCT order_id) > 100;
```

### 🔸 Tìm thành phố có hơn 5 khách hàng:

```sql
SELECT city, COUNT(DISTINCT customer_id) AS customer_count
FROM customers
GROUP BY city
HAVING COUNT(DISTINCT customer_id) > 5;
```

---

### 🔸 Tìm thương hiệu có giá trung bình > 500:

```sql
SELECT brand, AVG(list_price) AS avg_price
FROM products
GROUP BY brand
HAVING AVG(list_price) > 500;
```

---

# 🔹 **5. Khi nào cần dùng `HAVING`?**

| Tình huống                                        | Dùng `WHERE` | Dùng `HAVING` |
| ------------------------------------------------- | ------------ | ------------- |
| Lọc dữ liệu gốc (chưa tổng hợp)                   | ✅            | ❌             |
| Lọc theo kết quả tổng hợp (`COUNT`, `SUM`, `AVG`) | ❌            | ✅             |
| Lọc nhóm đã `GROUP BY`                            | ❌            | ✅             |

---

## ⚠️ Lỗi thường gặp

| Lỗi                               | Nguyên nhân                       | Cách khắc phục                |
| --------------------------------- | --------------------------------- | ----------------------------- |
| Dùng `WHERE COUNT(*) > 10`        | `WHERE` không hỗ trợ hàm tổng hợp | → Dùng `HAVING COUNT(*) > 10` |
| Dùng `HAVING` mà không `GROUP BY` | `HAVING` cần tổng hợp trước       | → Thêm `GROUP BY` phù hợp     |

---

## ✅ Ghi nhớ:

> 🧠 “Dùng `WHERE` để lọc dòng – Dùng `HAVING` để lọc nhóm.”

---

## 🔁 Ngày mai học gì?

Tiếp theo bạn sẽ học về **`CASE WHEN`** – một trong những công cụ mạnh mẽ nhất để **xử lý điều kiện, phân loại, bucket hóa dữ liệu trong SQL**.

