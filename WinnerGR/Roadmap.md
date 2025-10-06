# 🗺️ Lộ Trình Rèn Luyện SQL - Tree Map

```
📚 LUYỆN TẬP SQL VỚI WINNER GROUP ANALYTICS
├── 🎯 GIAI ĐOẠN 1: SQL CƠ BẢN (2-3 tuần)
│   ├── 📅 Tuần 1: SELECT & WHERE
│   │   ├── 🔍 Ngày 1-2: Khám phá dữ liệu
│   │   │   ├── DESCRIBE tables
│   │   │   ├── SELECT * LIMIT 10
│   │   │   └── Hiểu cấu trúc bảng
│   │   ├── 📊 Ngày 3-4: SELECT cơ bản
│   │   │   ├── Lấy thông tin khách hàng
│   │   │   ├── Lấy thông tin sản phẩm
│   │   │   └── Lấy thông tin đơn hàng
│   │   └── 🎯 Ngày 5-7: WHERE và điều kiện
│   │       ├── Tìm khách hàng VIP
│   │       ├── Đơn hàng > 500,000
│   │       └── Sản phẩm theo danh mục
│   └── 📅 Tuần 2: ORDER BY & LIMIT
│       ├── 📈 Ngày 8-9: Sắp xếp dữ liệu
│       │   ├── Top 10 khách hàng
│       │   ├── Top 10 đơn hàng
│       │   └── Sắp xếp sản phẩm
│       ├── 🔍 Ngày 10-12: Điều kiện phức tạp
│       │   ├── VIP + giá trị cao
│       │   ├── Đơn hàng tháng 12/2024
│       │   └── Sản phẩm theo khoảng giá
│       └── 🔎 Ngày 13-14: LIKE và IN
│           ├── Tìm tên "Nguyễn"
│           ├── Sản phẩm theo danh mục
│           └── Đơn hàng hoàn thành
│
├── 📊 GIAI ĐOẠN 2: AGGREGATION & GROUP BY (2-3 tuần)
│   ├── 📅 Tuần 3: COUNT, SUM, AVG
│   │   ├── 🔢 Ngày 15-16: COUNT và đếm
│   │   │   ├── Tổng số khách hàng
│   │   │   ├── Số khách hàng VIP
│   │   │   └── Đơn hàng theo trạng thái
│   │   ├── ➕ Ngày 17-18: SUM và tổng
│   │   │   ├── Tổng doanh thu
│   │   │   └── Doanh thu theo tháng
│   │   └── 📊 Ngày 19-21: AVG và trung bình
│   │       ├── Giá trị đơn hàng TB
│   │       └── AOV theo loại khách hàng
│   └── 📅 Tuần 4: GROUP BY nâng cao
│       ├── 📈 Ngày 22-23: GROUP BY cơ bản
│       │   └── Doanh thu theo danh mục
│       ├── 🔄 Ngày 24-25: GROUP BY nhiều cột
│       │   └── Doanh thu theo tháng + danh mục
│       └── 🎯 Ngày 26-28: HAVING và điều kiện nhóm
│           ├── Danh mục > 10M doanh thu
│           └── Khách hàng > 5 đơn hàng
│
├── 🔗 GIAI ĐOẠN 3: JOINS & RELATIONSHIPS (2-3 tuần)
│   ├── 📅 Tuần 5: INNER JOIN
│   │   ├── 🔗 Ngày 29-30: JOIN cơ bản
│   │   │   └── Đơn hàng + tên khách hàng
│   │   ├── 🔄 Ngày 31-32: JOIN nhiều bảng
│   │   │   └── Thông tin đơn hàng đầy đủ
│   │   └── 🎯 Ngày 33-35: JOIN với điều kiện
│   │       └── VIP + tháng 12/2024
│   └── 📅 Tuần 6: LEFT/RIGHT JOIN
│       ├── ⬅️ Ngày 36-37: LEFT JOIN
│       │   └── Tất cả khách hàng + số đơn hàng
│       ├── ➡️ Ngày 38-39: RIGHT JOIN
│       │   └── Tất cả sản phẩm + số lần bán
│       └── 🔄 Ngày 40-42: JOIN phức tạp
│           └── Phân tích khách hàng theo fanpage
│
├── 🎯 GIAI ĐOẠN 4: SUBQUERIES & CTE (2-3 tuần)
│   ├── 📅 Tuần 7: Subqueries cơ bản
│   │   ├── 🎯 Ngày 43-44: Subquery trong WHERE
│   │   │   ├── Khách hàng > TB
│   │   │   └── Sản phẩm > TB doanh thu
│   │   ├── 📊 Ngày 45-46: Subquery trong SELECT
│   │   │   └── Khách hàng + số đơn hàng
│   │   └── 🔍 Ngày 47-49: EXISTS và IN
│   │       └── Khách hàng mua "Áo"
│   └── 📅 Tuần 8: Common Table Expressions (CTE)
│       ├── 📈 Ngày 50-51: CTE cơ bản
│       │   └── Doanh thu theo tháng + tăng trưởng
│       └── 🔄 Ngày 52-54: CTE phức tạp
│           └── Phân tích RFM với CTE
│
├── 🚀 GIAI ĐOẠN 5: WINDOW FUNCTIONS (2-3 tuần)
│   ├── 📅 Tuần 9: ROW_NUMBER, RANK, DENSE_RANK
│   │   ├── 🔢 Ngày 55-56: ROW_NUMBER
│   │   │   └── Xếp hạng khách hàng theo giá trị
│   │   ├── 🏆 Ngày 57-58: RANK và DENSE_RANK
│   │   │   └── Xếp hạng sản phẩm theo doanh thu
│   │   └── 📊 Ngày 59-61: PARTITION BY
│   │       └── Xếp hạng sản phẩm theo danh mục
│   └── 📅 Tuần 10: LAG, LEAD, FIRST_VALUE
│       ├── ⏰ Ngày 62-63: LAG và LEAD
│       │   └── So sánh doanh thu tháng
│       ├── 🎯 Ngày 64-65: FIRST_VALUE và LAST_VALUE
│       │   └── Đơn hàng đầu/cuối của khách hàng
│       └── 📈 Ngày 66-68: CUME_DIST và PERCENT_RANK
│           └── Phân phối doanh thu khách hàng
│
├── 📈 GIAI ĐOẠN 6: ADVANCED ANALYTICS (2-3 tuần)
│   ├── 📅 Tuần 11: Pivot Tables & CASE WHEN
│   │   ├── 🎯 Ngày 69-70: CASE WHEN
│   │   │   └── Phân loại đơn hàng theo giá trị
│   │   ├── 📊 Ngày 71-72: Pivot với CASE WHEN
│   │   │   └── Doanh thu theo tháng + danh mục
│   │   └── 🔄 Ngày 73-75: Conditional Aggregation
│   │       └── Phân tích khách hàng đa tiêu chí
│   └── 📅 Tuần 12: Advanced Window Functions
│       ├── 📈 Ngày 76-77: Running Totals
│       │   └── Tổng doanh thu tích lũy
│       ├── 📊 Ngày 78-79: NTILE và Percentiles
│       │   └── Phân chia khách hàng 4 nhóm
│       └── 🔍 Ngày 80-82: Advanced Analytics
│           └── Phân tích cohort retention
│
├── 🎯 GIAI ĐOẠN 7: BUSINESS INTELLIGENCE (2-3 tuần)
│   ├── 📅 Tuần 13: KPI Calculations
│   │   ├── 📊 Ngày 83-84: Revenue KPIs
│   │   │   └── Dashboard KPIs chính
│   │   ├── 👥 Ngày 85-86: Customer Analytics
│   │   │   └── Phân tích khách hàng chi tiết
│   │   └── 📦 Ngày 87-89: Product Performance
│   │       └── Phân tích hiệu suất sản phẩm
│   └── 📅 Tuần 14: Trend Analysis
│       ├── 📈 Ngày 90-91: Time Series Analysis
│       │   └── Xu hướng doanh thu theo thời gian
│       ├── 🌸 Ngày 92-93: Seasonal Analysis
│       │   └── Phân tích mùa vụ
│       └── 📱 Ngày 94-96: Channel Performance
│           └── Hiệu suất kênh bán hàng
│
└── 🏆 GIAI ĐOẠN 8: ADVANCED PROJECTS (2-3 tuần)
    ├── 📅 Tuần 15: Complex Business Scenarios
    │   ├── 👥 Ngày 97-98: Customer Segmentation
    │   │   └── Phân khúc khách hàng nâng cao
    │   ├── 📦 Ngày 99-100: Product Portfolio Analysis
    │   │   └── Phân tích danh mục ABC
    │   └── 🛒 Ngày 101-102: Market Basket Analysis
    │       └── Sản phẩm mua cùng nhau
    └── 📅 Tuần 16: Performance Optimization
        ├── ⚡ Ngày 103-104: Query Optimization
        │   ├── Tạo indexes
        │   └── Truy vấn tối ưu
        ├── 📊 Ngày 105-106: Materialized Views
        │   ├── Tạo views
        │   └── Sử dụng views
        └── 🎯 Ngày 107-108: Final Project
            └── Báo cáo tổng hợp ban giám đốc
```

## 🎯 **TỔNG QUAN LỘ TRÌNH**

### **📊 Thống kê tổng quan:**
- **⏱️ Thời gian**: 16 tuần (4 tháng)
- **📚 Số bài học**: 108 ngày
- **🎯 Mức độ**: Từ cơ bản đến nâng cao
- **📈 Kỹ năng**: 8 giai đoạn chính

### **🏆 Kết quả đạt được:**
- ✅ Thành thạo SQL từ cơ bản đến nâng cao
- ✅ Hiểu rõ cấu trúc dữ liệu thực tế
- ✅ Có thể phân tích dữ liệu kinh doanh
- ✅ Tối ưu hóa hiệu suất truy vấn
- ✅ Tạo báo cáo và dashboard

### **📋 Cấu trúc mỗi ngày:**
- **🎯 Mục tiêu rõ ràng**
- **💡 Lý thuyết ngắn gọn**
- **💻 Bài tập thực hành**
- **🔍 Kiểm tra kết quả**
- **📝 Ghi chú quan trọng**