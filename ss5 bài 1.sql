-- Tạo database
CREATE DATABASE TheDailyGrind;
USE TheDailyGrind;

-- Tạo bảng KhachHang
CREATE TABLE KhachHang (
    MaKH INT,
    HoTen VARCHAR(255),
    Email VARCHAR(255),
    SoDienThoai VARCHAR(15),
    NgayDangKy DATE
);

-- Thêm dữ liệu mẫu ban đầu
INSERT INTO KhachHang (MaKH, HoTen, Email, SoDienThoai, NgayDangKy) VALUES
(1, 'Nguyễn Văn An', 'an.nguyen@email.com', '0901234567', '2023-10-25'),
(2, 'Trần Thị Bình', 'binh.tran@email.com', '0912345678', '2023-10-26'),
(3, 'Lê Minh Cường', 'cuong.le@email.com', '0987654321', '2023-11-01');

-- Thêm hai khách hàng mới
INSERT INTO KhachHang (MaKH, HoTen, Email, SoDienThoai, NgayDangKy) VALUES
(4, 'Phạm Thị Dung', 'dung.pham@email.com', '0934567890', '2023-11-02'),
(5, 'Hoàng Văn Em', 'em.hoang@email.com', '0945678901', '2023-11-03');

-- Hiển thị toàn bộ thông tin
SELECT * FROM KhachHang;

-- Danh sách chỉ gồm HoTen và Email
SELECT HoTen, Email FROM KhachHang;
