# 🧠 Day 1 – SELECT … FROM

## 1.Lý thuyết

Cặp câu lệnh `SELECT` – `FROM` là **nền tảng quan trọng nhất** trong SQL.  
Nó dùng để chỉ định:
- **Cột (column)** bạn muốn lấy dữ liệu → dùng `SELECT`
- **Bảng (table)** chứa dữ liệu đó → dùng `FROM`

---

## 🔍 Cú pháp cơ bản
```sql
SELECT col1, col2
FROM table_name;
```

## 2. Một số ví dụ thực hành
### 🧾 Lấy tên sản phẩm và giá bán:
```sql
SELECT product_name, unit_price_usd
FROM products;
```

### 📦 Lấy số lượng và ngày đặt hàng:
```sql
SELECT quantity, order_date
FROM sales;
```

### 👤 Lấy toàn bộ thông tin khách hàng:
```sql
SELECT *
FROM customers;
```