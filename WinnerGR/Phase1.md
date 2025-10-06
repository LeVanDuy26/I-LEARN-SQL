# 🎯 Câu Hỏi Luyện Tập SQL - Giai Đoạn 1: SQL Cơ Bản

## 📅 **TUẦN 1: SELECT & WHERE**

### **🔍 Ngày 1-2: Khám phá dữ liệu**

1. Hiển thị tất cả thông tin của 5 khách hàng đầu tiên trong bảng `gold_dim_customers`

2. Xem cấu trúc bảng `gold_fact_orders` để hiểu các cột có sẵn

3. Hiển thị 3 sản phẩm đầu tiên trong bảng `gold_dim_products`

4. Xem cấu trúc bảng `gold_dim_pages` để hiểu thông tin fanpage

5. Hiển thị 10 đơn hàng đầu tiên trong bảng `gold_fact_orders`

6. Xem cấu trúc bảng `gold_fact_order_items` để hiểu chi tiết đơn hàng

7. Hiển thị 5 fanpage đầu tiên trong bảng `gold_dim_pages`

8. Xem cấu trúc bảng `gold_dim_shop` để hiểu thông tin cửa hàng

### **📊 Ngày 3-4: SELECT cơ bản**

9. Lấy danh sách tất cả mã khách hàng và tên đầy đủ từ bảng khách hàng

10. Hiển thị mã sản phẩm, tên sản phẩm và danh mục chính của tất cả sản phẩm

11. Lấy mã đơn hàng, mã khách hàng và tổng doanh thu của tất cả đơn hàng

12. Hiển thị mã fanpage và tên fanpage từ bảng pages

13. Lấy mã cửa hàng và tên cửa hàng từ bảng shop

14. Hiển thị mã đơn hàng, mã sản phẩm và số lượng từ bảng order_items

15. Lấy tên khách hàng, số điện thoại và email từ bảng khách hàng

16. Hiển thị mã sản phẩm, tên sản phẩm và giá từ bảng sản phẩm

### **🎯 Ngày 5-7: WHERE và điều kiện**

17. Tìm tất cả khách hàng VIP (is_vip = 1)

18. Hiển thị các đơn hàng có tổng doanh thu lớn hơn 500,000 VND

19. Tìm các sản phẩm thuộc danh mục "Áo"

20. Hiển thị các đơn hàng có trạng thái "Hoàn thành"

21. Tìm khách hàng có giá trị tiền tệ (monetary) lớn hơn 1,000,000

22. Hiển thị các sản phẩm có giá từ 100,000 đến 500,000 VND

23. Tìm các đơn hàng được tạo trong tháng 12 năm 2024

24. Hiển thị khách hàng có tần suất mua hàng (frequency) lớn hơn 3

25. Tìm các sản phẩm thuộc danh mục "Quần"

26. Hiển thị các đơn hàng có phí vận chuyển (shipping_fee) bằng 0

27. Tìm khách hàng có số ngày gần nhất mua hàng (recency_days) nhỏ hơn 30

28. Hiển thị các sản phẩm có giá lớn hơn 1,000,000 VND

## 📅 **TUẦN 2: ORDER BY & LIMIT**

### **📈 Ngày 8-9: Sắp xếp dữ liệu**

29. Hiển thị top 10 khách hàng có giá trị tiền tệ cao nhất

30. Tìm 5 đơn hàng có tổng doanh thu cao nhất

31. Hiển thị 10 sản phẩm có giá cao nhất

32. Tìm top 5 khách hàng có tần suất mua hàng cao nhất

33. Hiển thị 10 đơn hàng có số lượng sản phẩm nhiều nhất

34. Tìm 5 fanpage có tên dài nhất

35. Hiển thị top 10 khách hàng có số ngày gần nhất mua hàng ít nhất

36. Tìm 5 sản phẩm có tên ngắn nhất

37. Hiển thị 10 đơn hàng được tạo gần đây nhất

38. Tìm top 5 khách hàng có email chứa "gmail.com"

### **🔍 Ngày 10-12: Điều kiện phức tạp**

39. Tìm khách hàng VIP có giá trị tiền tệ lớn hơn 1,000,000

40. Hiển thị các đơn hàng có tổng doanh thu từ 200,000 đến 800,000 VND

41. Tìm sản phẩm thuộc danh mục "Áo" và có giá lớn hơn 300,000

42. Hiển thị khách hàng có tần suất mua hàng từ 2 đến 5 lần

43. Tìm các đơn hàng được tạo trong tháng 11 hoặc tháng 12 năm 2024

44. Hiển thị sản phẩm có giá lớn hơn 500,000 hoặc thuộc danh mục "Váy"

45. Tìm khách hàng có giá trị tiền tệ lớn hơn 500,000 và là VIP

46. Hiển thị các đơn hàng có trạng thái "Hoàn thành" và tổng doanh thu > 300,000

47. Tìm sản phẩm thuộc danh mục "Quần" và có giá từ 200,000 đến 600,000

48. Hiển thị khách hàng có số ngày gần nhất mua hàng từ 15 đến 45 ngày

### **🔎 Ngày 13-14: LIKE và IN**

49. Tìm tất cả khách hàng có tên chứa từ "Nguyễn"

50. Hiển thị các sản phẩm có tên chứa từ "Áo"

51. Tìm khách hàng có email chứa "yahoo.com"

52. Hiển thị các sản phẩm thuộc danh mục "Áo", "Quần" hoặc "Váy"

53. Tìm đơn hàng có trạng thái "Hoàn thành" hoặc "Đang xử lý"

54. Hiển thị khách hàng có tên bắt đầu bằng "Trần"

55. Tìm sản phẩm có tên kết thúc bằng "Đen"

56. Hiển thị các fanpage có tên chứa từ "Fashion"

57. Tìm khách hàng có số điện thoại bắt đầu bằng "098"

58. Hiển thị các sản phẩm có tên chứa từ "Nữ"

59. Tìm đơn hàng có mã đơn hàng chứa "2024"

60. Hiển thị khách hàng có địa chỉ chứa từ "Hà Nội"

61. Tìm sản phẩm thuộc các danh mục "Áo sơ mi", "Áo thun", "Áo khoác"

62. Hiển thị các đơn hàng có trạng thái không phải "Hủy"

63. Tìm khách hàng có tên chứa từ "Thị" hoặc "Văn"

64. Hiển thị các sản phẩm có giá lớn hơn 100,000 và tên chứa từ "Mùa đông"

---

## 🎯 **MỤC TIÊU GIAI ĐOẠN 1**

Sau khi hoàn thành 64 câu hỏi này, bạn sẽ:

✅ **Hiểu rõ cấu trúc dữ liệu** Winner Group Analytics  
✅ **Thành thạo SELECT** với các cột khác nhau  
✅ **Sử dụng WHERE** với điều kiện đơn giản và phức tạp  
✅ **Áp dụng ORDER BY** để sắp xếp dữ liệu  
✅ **Sử dụng LIMIT** để giới hạn kết quả  
✅ **Kết hợp AND, OR** trong điều kiện  
✅ **Sử dụng LIKE** để tìm kiếm mẫu  
✅ **Áp dụng IN** để kiểm tra nhiều giá trị  
✅ **Hiểu được ngữ cảnh kinh doanh** của Winner Group  

**💡 Lưu ý**: Hãy tự code SQL cho từng câu hỏi và kiểm tra kết quả để đảm bảo hiểu đúng cấu trúc dữ liệu!