# HỆ THỐNG GIÁM SÁT THIẾT BỊ SMART-FARM

## 1. Hướng dẫn chạy script

Script tự động lọc log giúp phát hiện các lỗi kết nối và theo dõi trạng thái hoạt động của thiết bị trong hệ thống Smart-Farm.

**Bước 1:** Mở PowerShell tại thư mục dự án.

**Bước 2:** Chạy script lọc log bằng lệnh:

```
.\auto_report.ps1
```

**Bước 3:** Nếu PowerShell chặn việc chạy script, có thể cho phép thực thi trong phiên hiện tại bằng lệnh:

```
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

Sau đó chạy lại:

```
.\auto_report.ps1
```

## 2. Checklist kiểm tra thiết bị

- [x]  Kiểm tra nguồn điện của hệ thống.
    
- [ ]  Kiểm tra kết nối mạng của trạm sensor-03.
    
- [ ]   Kiểm tra tình trạng hoạt động của modem.
    
- [ ]  Kiểm tra dung lượng lưu trữ log.
    
- [ ]  Kiểm tra kết quả chạy script lọc log.
    

## 3. Bảng thông số phần cứng

Ten_thiet_bi|Don_gia|loai_storge
|-|-|-
Raspberry Pi 4 Model B|1,450,000|SSD
Intel NUC i3|6,200,000|SSD
Orange Pi 5|2,300,000|SSD
Dell Optiplex Micro|5,400,000|HDD
Mini PC Fanless N100|4,200,000|SSD
Synology DS220j NAS|3,900,000|HDD


## 4. Phân tích hệ thống

### 4.1. Phân tích Input – Process – Output

Chức năng lọc log có nhiệm vụ đọc dữ liệu nhật ký hệ thống, tìm kiếm các dòng chứa lỗi và xuất kết quả để người quản trị theo dõi.

Thành phần|Mô tả|Ví dụ
|-|-|-
**Input (Đầu vào)** | File log chứa các sự kiện và thông tin hoạt động của thiết bị.|`server.log`, `access.log`
**Process (Xử lý)**|Đọc file log, lọc các dòng chứa từ khóa `ERROR`, `TIMEOUT` hoặc các lỗi cần theo dõi.|Sử dụng `Select-String` trong PowerShell.
**Output (Đầu ra)**|Danh sách lỗi được lọc, hiển thị trên màn hình hoặc ghi vào file báo cáo.|`error_report.log`

Ví dụ lệnh lọc các dòng chứa lỗi `ERROR`:

```
Select-String -Path ".\server.log" -Pattern "ERROR"
```

### 4.2. Phân loại theo mô hình DIKW

Mô hình DIKW gồm bốn tầng: **Data (Dữ liệu), Information (Thông tin), Knowledge (Tri thức), Wisdom (Sự khôn ngoan/Quyết định)**.

Phát biểu|Tầng DIKW|Giải thích
|-|-|-
**(a)** “Quyết định thay modem trạm sensor-03 trước thứ Sáu.”|**Wisdom**|Đưa ra quyết định và hành động dựa trên thông tin, tri thức đã có.
**(b)** “2026-10-12 08:15:01 [ERROR] sensor-03 Connection TIMEOUT after 30s”|**Data**|Dữ liệu log thô, ghi nhận một sự kiện lỗi cụ thể.
**(c)** “Hôm nay hệ thống ghi nhận 8 sự cố, trong đó 4 sự cố đến từ trạm sensor-03.”|**Information**|Dữ liệu đã được tổng hợp, thống kê để cung cấp ý nghĩa.
**(d)** “Trạm sensor-03 hay mất kết nối vào buổi chiều do sóng yếu, nên cần lắp thêm anten.”|**Knowledge**|Nhận diện quy luật, phân tích nguyên nhân và đề xuất giải pháp dựa trên kinh nghiệm hoặc dữ liệu.

### 4.3. Quy trình chuyển đổi DIKW

```
DATA
(Dữ liệu log thô)
       |
       v
INFORMATION
(Thống kê số lượng sự cố)
       |
       v
KNOWLEDGE
(Phân tích nguyên nhân mất kết nối)
       |
       v
WISDOM
(Quyết định thay modem hoặc lắp thêm anten)
```



