# 📘 Hướng dẫn phân quyền trong MySQL bằng Roles & Users (hỗ trợ ZeroTier)

## 1. Khái niệm cơ bản

Trong **an toàn hệ thống thông tin**, kiểm soát truy nhập (Access Control) là việc quản lý ai được quyền truy cập vào tài nguyên nào và có thể làm gì.  
Một số mô hình điều khiển truy nhập:
- **DAC (Discretionary Access Control)**: chủ sở hữu có quyền cấp hoặc thu hồi quyền.
- **MAC (Mandatory Access Control)**: quyền được xác định cứng theo chính sách bảo mật, người dùng không thể thay đổi.
- **RBAC (Role-Based Access Control)**: cấp quyền theo **vai trò** (Role), sau đó gán role cho user. Đây là mô hình linh hoạt, dễ quản lý trong doanh nghiệp.

Trong MySQL, RBAC được triển khai bằng **ROLE** và **USER**.

---

## 2. Lưu ý về Authentication khi kết nối từ xa

MySQL 8+ mặc định sử dụng **`caching_sha2_password`** thay cho `mysql_native_password`.

- Ưu điểm:
  - An toàn hơn (sử dụng SHA-256).
  - Tối ưu kết nối: lần đầu xác thực dùng SHA256, những lần sau dùng cơ chế cache.
- Khi team bạn kết nối từ xa qua **ZeroTier** bằng MySQL Workbench/DBeaver, cần để **Authentication Type = Standard (caching_sha2_password)**.

Ví dụ tạo user:

```sql
CREATE USER 'team_user'@'%' 
IDENTIFIED WITH caching_sha2_password BY 'StrongPass@123';
````

📌 Giải thích:

* `'team_user'@'%'`: cho phép đăng nhập từ mọi IP (có thể giới hạn bằng IP ZeroTier để an toàn hơn).
* `IDENTIFIED WITH caching_sha2_password`: chỉ định cơ chế xác thực mặc định an toàn.
* `'StrongPass@123'`: mật khẩu mạnh (bao gồm chữ hoa, chữ thường, số và ký tự đặc biệt).

---

## 3. Tạo Roles

```sql
-- ======================
-- 1. Tạo ROLES
-- ======================
CREATE ROLE 'admin_role';
CREATE ROLE 'de_role';      -- Data Engineer
CREATE ROLE 'da_role';      -- Data Analyst
CREATE ROLE 'bi_role';      -- BI Developer
CREATE ROLE 'manager_role';
CREATE ROLE 'auditor_role';
```

---

## 4. Cấp quyền cho Roles

```sql
-- Admin: toàn quyền
GRANT ALL PRIVILEGES ON *.* TO 'admin_role';

-- Data Engineer: ghi Bronze, Silver; chỉ đọc Gold
GRANT INSERT, UPDATE, DELETE, SELECT ON winner_bronze.* TO 'de_role';
GRANT INSERT, UPDATE, DELETE, SELECT ON winner_silver.* TO 'de_role';
GRANT SELECT ON winner_gold.* TO 'de_role';

-- Data Analyst: chỉ đọc toàn bộ Gold
GRANT SELECT ON winner_gold.* TO 'da_role';

-- BI Developer: chỉ đọc một số bảng Gold
GRANT SELECT ON winner_gold.top_products TO 'bi_role';
GRANT SELECT ON winner_gold.revenue_summary TO 'bi_role';

-- Manager: chỉ được xem báo cáo tổng hợp
GRANT SELECT ON winner_gold.revenue_summary TO 'manager_role';

-- Auditor: chỉ đọc tất cả + xem cấu hình
GRANT SELECT ON winner_bronze.* TO 'auditor_role';
GRANT SELECT ON winner_silver.* TO 'auditor_role';
GRANT SELECT ON winner_gold.* TO 'auditor_role';
GRANT SHOW DATABASES, SHOW VIEW ON *.* TO 'auditor_role';
```

📌 Giải thích:

* `GRANT [quyền] ON [database].[table] TO [role]`: cấp quyền cụ thể cho role.
* `ALL PRIVILEGES`: toàn quyền (admin).
* Các quyền cơ bản: `SELECT` (đọc), `INSERT` (thêm), `UPDATE` (sửa), `DELETE` (xóa).
* Mô hình Bronze → Silver → Gold:

  * Bronze: dữ liệu thô, DE toàn quyền xử lý.
  * Silver: dữ liệu sạch, DE vẫn có quyền ghi.
  * Gold: dữ liệu báo cáo, chỉ đọc cho DA, BI, Manager.

---

## 5. Tạo Users với `caching_sha2_password` và gán Roles

```sql
-- Admin
CREATE USER 'admin_user'@'%' 
IDENTIFIED WITH caching_sha2_password BY 'Admin@123';
GRANT 'admin_role' TO 'admin_user'@'%';
SET DEFAULT ROLE 'admin_role' TO 'admin_user'@'%';

-- Data Engineer
CREATE USER 'etl_user'@'%' 
IDENTIFIED WITH caching_sha2_password BY 'ETL@123';
GRANT 'de_role' TO 'etl_user'@'%';
SET DEFAULT ROLE 'de_role' TO 'etl_user'@'%';

-- Data Analyst
CREATE USER 'analyst_user'@'%' 
IDENTIFIED WITH caching_sha2_password BY 'Analyst@123';
GRANT 'da_role' TO 'analyst_user'@'%';
SET DEFAULT ROLE 'da_role' TO 'analyst_user'@'%';

-- BI Developer
CREATE USER 'bi_user'@'%' 
IDENTIFIED WITH caching_sha2_password BY 'BI@123';
GRANT 'bi_role' TO 'bi_user'@'%';
SET DEFAULT ROLE 'bi_role' TO 'bi_user'@'%';

-- Manager
CREATE USER 'manager_user'@'%' 
IDENTIFIED WITH caching_sha2_password BY 'Manager@123';
GRANT 'manager_role' TO 'manager_user'@'%';
SET DEFAULT ROLE 'manager_role' TO 'manager_user'@'%';

-- Auditor
CREATE USER 'auditor_user'@'%' 
IDENTIFIED WITH caching_sha2_password BY 'Audit@123';
GRANT 'auditor_role' TO 'auditor_user'@'%';
SET DEFAULT ROLE 'auditor_role' TO 'auditor_user'@'%';
```

📌 Giải thích code:

* **CREATE USER**: tạo user đăng nhập DB.
* `IDENTIFIED WITH caching_sha2_password`: dùng phương thức xác thực an toàn, hỗ trợ tốt cho kết nối từ xa qua ZeroTier.
* **GRANT [role] TO [user]**: gán role cho user.
* **SET DEFAULT ROLE**: để user tự động kích hoạt role khi đăng nhập.

---

## 6. Kiểm tra & Quản trị

```sql
-- Xem role được gán
SELECT * FROM mysql.roles_mapping;

-- Kiểm tra quyền của user
SHOW GRANTS FOR 'etl_user'@'%';

-- Đổi lại plugin xác thực nếu cần
ALTER USER 'etl_user'@'%' 
IDENTIFIED WITH caching_sha2_password BY 'NewPass@123';
```

---

## 7. Liên hệ với ATTT

* Tuân thủ nguyên tắc **Least Privilege**: user chỉ có quyền đủ để làm việc.
* Đảm bảo **CIA**:

  * Confidentiality: chỉ người có quyền mới đọc được Gold.
  * Integrity: hạn chế ai có quyền ghi dữ liệu.
  * Availability: role rõ ràng, tránh xung đột quyền.
