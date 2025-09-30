
# 🧠 Day 8 – `Window Function`: tổng hợp, phân tích, so sánh… nhưng không làm mất dữ liệu dòng gốc

## 1. Window function 
Window Function (hàm cửa sổ) là hàm cho phép thực hiện các phép tính **tổng hợp, phân tích, so sánh… nhưng không làm mất dữ liệu dòng gốc**.
Khác với `GROUP BY` – vốn gom nhóm và trả về **1 dòng/nhóm**, thì **Window Functions giữ nguyên số dòng**, chỉ thêm cột tính toán.

---

## ✅ **2. Cú pháp tổng quát:**

```sql
<window_function>() OVER (
  PARTITION BY <cột phân nhóm>  
  ORDER BY <cột sắp xếp>
  ROWS BETWEEN ...         -- (tuỳ chọn, để giới hạn khung)
)
```

| Thành phần         | Ý nghĩa                                                |
| ------------------ | ------------------------------------------------------ |
| `PARTITION BY`     | Phân nhóm bởi col nào? *(như GROUP BY) nhưng không gom dòng*          |
| `ORDER BY`         | Xác định thứ tự trong mỗi nhóm                         |
| `ROWS BETWEEN ...` | Cửa sổ con – mặc định là từ dòng đầu đến dòng hiện tại |

---

## 🧩 **3. Phân loại hàm cửa sổ (Window Function Types)**

### 🔹 A. **Hàm xếp hạng (Ranking)**

| Hàm            | Ý nghĩa                       | Ghi chú         |
| -------------- | ----------------------------- | --------------- |
| `ROW_NUMBER()` | Đánh số thứ tự **duy nhất**   | Không xét trùng |
| `RANK()`       | Xếp hạng có nhảy số khi trùng | 1, 2, 2, 4      |
| `DENSE_RANK()` | Xếp hạng không nhảy số        | 1, 2, 2, 3      |

```sql
ROW_NUMBER() OVER (PARTITION BY store_key ORDER BY quantity DESC)
```

---

### 🔹 B. **Hàm tổng hợp trên cửa sổ**

> Khác với `GROUP BY`: không gom dòng, cho kết quả **trên từng dòng**

| Hàm               | Mục đích            |
| ----------------- | ------------------- |
| `SUM()`           | Tổng                |
| `AVG()`           | Trung bình          |
| `MIN()` / `MAX()` | Nhỏ nhất / lớn nhất |
| `COUNT()`         | Số dòng             |

```sql
SUM(quantity) OVER (PARTITION BY customer_key ORDER BY order_date)
```

---

### 🔹 C. **Hàm so sánh dòng liền kề (Lead/Lag)**

| Hàm             | Mô tả                         |
| --------------- | ----------------------------- |
| `LAG(expr, n)`  | Lấy giá trị dòng trước n dòng |
| `LEAD(expr, n)` | Lấy giá trị dòng sau n dòng   |

```sql
LAG(unit_price_usd) OVER (PARTITION BY brand ORDER BY product_key)
```

---

### 🔹 D. **Hàm truy xuất theo vị trí**

| Hàm                  | Ý nghĩa                           |
| -------------------- | --------------------------------- |
| `FIRST_VALUE(expr)`  | Lấy giá trị đầu tiên trong cửa sổ |
| `LAST_VALUE(expr)`   | Lấy giá trị cuối cùng             |
| `NTH_VALUE(expr, n)` | Lấy dòng thứ n                    |

---

### 🔹 E. **Hàm phân phối (Distribution)**

| Hàm              | Ý nghĩa                                      |
| ---------------- | -------------------------------------------- |
| `PERCENT_RANK()` | Tính phần trăm thứ hạng                      |
| `CUME_DIST()`    | Phân phối tích lũy (cumulative distribution) |

---

## 💡 **4. So sánh Window Function vs Aggregate Function (GROUP BY)**

| Tiêu chí                        | Aggregate (GROUP BY) | Window Function |
| ------------------------------- | -------------------- | --------------- |
| Giữ dòng gốc                    | ❌ Không              | ✅ Có            |
| Dùng cho tính cộng dồn          | ❌ Phức tạp           | ✅ Rất phù hợp   |
| Cho từng dòng 1 kết quả         | ❌                    | ✅               |
| Phân tích theo thứ tự thời gian | ❌ Không tốt          | ✅ Rất tốt       |

---

## 🧠 **5. Ứng dụng thực tế thường gặp**

| Tình huống                             | Hàm gợi ý                                                  |
| -------------------------------------- | ---------------------------------------------------------- |
| Xếp hạng sản phẩm theo doanh số        | `RANK()` / `DENSE_RANK()`                                  |
| Tổng tích lũy theo thời gian           | `SUM(...) OVER (ORDER BY date)`                            |
| So sánh giá trước và sau               | `LAG()` / `LEAD()`                                         |
| Tìm dòng có giá trị lớn nhất theo nhóm | `ROW_NUMBER()` kết hợp `WHERE rn = 1`                      |
| Tính trung bình 3 dòng gần nhất        | `AVG(...) OVER (ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)` |

---

## 🛑 **Lưu ý khi dùng Window Function**

| Điều cần nhớ                                                   | Chi tiết               |
| -------------------------------------------------------------- | ---------------------- |
| KHÔNG dùng trong `WHERE`, `GROUP BY`, `HAVING`                 | ❌ Không được hỗ trợ    |
| DÙNG được trong `SELECT`, `ORDER BY`, `CTE`                    | ✅ Phổ biến             |
| `ORDER BY` trong `OVER()` là khác với `ORDER BY` toàn truy vấn | Chỉ áp dụng cho cửa sổ |
| Có thể dùng `PARTITION BY` hoặc không (áp dụng toàn bảng)      | Linh hoạt              |

---

## 📌 **Ví dụ tổng hợp: Xếp hạng doanh thu sản phẩm theo thương hiệu**

```sql
SELECT 
  p.brand,
  p.product_name,
  SUM(s.quantity * p.unit_price_usd) AS doanh_thu,
  RANK() OVER (PARTITION BY p.brand ORDER BY SUM(s.quantity * p.unit_price_usd) DESC) AS xep_hang
FROM retails.sales s
JOIN retails.products p ON s.product_key = p.product_key
GROUP BY p.brand, p.product_name;
```

