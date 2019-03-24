# Tổng quan về bài tập lớn

## Các module đã xây dựng - theo chức năng
- Module 1: Trang quản trị viên: Thêm sửa xóa sản phẩm, thêm sửa xóa người dùng
- Module 2: Trang chủ - hiển thị ấn vào thì ra trang giỏ hàng
- Module 3: Giỏ hàng
- Module 4: Tìm kiếm
- Module 5: Trang liên lạc
- Module 6: Đăng nhập, đăng xuất, đăng kí.

# Hướng dẫn làm bài tập lớn CNWeb

## 1 - Tạo Database

## 2 - Tạo ứng dụng WebApplication
### Cài đặt EF6
- Tools -> NuGet Package Manager -> Package manager console
- Pase dòng sau vào console và enter: Install-Package EntityFramework -Version 6.2.0

### Tạo kết nối tới Database
- Chuột phải vào Models
- Chọn Add -> new Items
- Bảng chọn bên trái chọn Data -> ADO.NET Entity Data Model -> OK 
- Trong Entity Data Model Winzard chọn Code first from database -> chọn next -> New Connections - Trong Connections Properties
  + Server name: là tên SQL trong SQL server - VTP-NGUYENHIEU\SQLEXPRESS
  + Connect to datbase: tên của database 
- Chọn Next -> Chọn table -> Finish

### Tạo Model
- New -> Item -> Data -> ADO.Net. ... 

### Tạo Controller 
Cách 1: Tạo cả View và các thứ khác
- New -> Controller -> Controller, View ...
Cách 2: Tạo Controller rỗng

