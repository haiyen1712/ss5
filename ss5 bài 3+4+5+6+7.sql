Ss5 bài 3 
-- Tạo database
CREATE DATABASE TechZone;
USE TechZone;

-- Tạo bảng DonHang
CREATE TABLE DonHang (
    MaDonHang INT,
    NgayDatHang DATE,
    TongGiaTri INT,
    ThanhPhoGiaoHang VARCHAR(100)
);

-- Thêm dữ liệu mẫu
INSERT INTO DonHang (MaDonHang, NgayDatHang, TongGiaTri, ThanhPhoGiaoHang) VALUES
(101, '2023-10-15', 1500000, 'Hà Nội'),
(102, '2023-10-18', 800000, 'Đà Nẵng'),
(103, '2023-10-20', 2200000, 'TP. Hồ Chí Minh'),
(104, '2023-10-22', 750000, 'Hà Nội'),
(105, '2023-10-25', 3100000, 'TP. Hồ Chí Minh');

-- 1. Đơn hàng có tổng giá trị > 1,000,000
SELECT *
FROM DonHang
WHERE TongGiaTri > 1000000;

-- 2. Đơn hàng giao đến TP. Hồ Chí Minh
SELECT *
FROM DonHang
WHERE ThanhPhoGiaoHang = 'TP. Hồ Chí Minh';

-- 3. Tất cả đơn hàng sắp xếp theo TongGiaTri giảm dần
SELECT *
FROM DonHang
ORDER BY TongGiaTri DESC;

-- 4. Danh sách thành phố duy nhất
SELECT DISTINCT ThanhPhoGiaoHang
FROM DonHang;





Ss5 bài 4
-- Tạo database
CREATE DATABASE NhanSu;
USE NhanSu;

-- Tạo bảng NhanVien
CREATE TABLE NhanVien (
    MaNV VARCHAR(10),
    HoTen VARCHAR(255),
    PhongBan VARCHAR(100),
    ChucVu VARCHAR(100),
    NamSinh INT
);

-- Thêm dữ liệu mẫu
INSERT INTO NhanVien (MaNV, HoTen, PhongBan, ChucVu, NamSinh) VALUES
('NV01', 'Trần Văn Mạnh', 'Kinh doanh', 'Nhân viên', 1995),
('NV02', 'Lê Thị Hoa', 'Marketing', 'Trưởng phòng', 1990),
('NV03', 'Nguyễn Anh Dũng', 'Kinh doanh', 'Nhân viên', 1998),
('NV04', 'Phạm Thị Lan', 'Nhân sự', 'Chuyên viên', 1992),
('NV05', 'Hoàng Minh Tuấn', 'Kỹ thuật', 'Trưởng nhóm', 1991);

-- 1. Nhân viên thuộc phòng 'Kinh doanh' và có năm sinh trước 1996
SELECT *
FROM NhanVien
WHERE PhongBan = 'Kinh doanh' AND NamSinh < 1996;

-- 2. Nhân viên là 'Trưởng phòng' hoặc 'Trưởng nhóm'
SELECT *
FROM NhanVien
WHERE ChucVu = 'Trưởng phòng' OR ChucVu = 'Trưởng nhóm';

-- 3. Nhân viên không thuộc phòng 'Kỹ thuật'
SELECT *
FROM NhanVien
WHERE PhongBan != 'Kỹ thuật';

-- 4. Nhân viên thuộc phòng 'Marketing' và có năm sinh trước 1995
SELECT *
FROM NhanVien
WHERE PhongBan = 'Marketing' AND NamSinh < 1995;




Ss5 bài 5
-- Tạo database
CREATE DATABASE ThoiTrangDB;
USE ThoiTrangDB;

-- Tạo bảng KhachHangThanThiet
CREATE TABLE KhachHangThanThiet (
    MaKH INT,
    HoTen VARCHAR(255),
    ThanhPho VARCHAR(100),
    TongChiTieu INT,
    SoDonHang INT,
    LanCuoiMuaHang DATE
);

-- Thêm dữ liệu mẫu
INSERT INTO KhachHangThanThiet (MaKH, HoTen, ThanhPho, TongChiTieu, SoDonHang, LanCuoiMuaHang) VALUES
(1, 'Nguyễn Thị Mai', 'Hà Nội', 15000000, 12, '2023-10-28'),
(2, 'Trần Văn Nam', 'TP. Hồ Chí Minh', 25000000, 20, '2023-10-15'),
(3, 'Lê Minh Anh', 'Hà Nội', 3000000, 2, '2023-10-05'),
(4, 'Phạm Hồng Nhung', 'Đà Nẵng', 8000000, 8, '2023-05-20'),
(5, 'Hoàng Tuấn Kiệt', 'Hà Nội', 18000000, 15, '2023-09-30'),
(6, 'Vũ Bích Phương', 'TP. Hồ Chí Minh', 4500000, 3, '2023-04-11');

-- 1. Khách hàng VIP: TongChiTieu > 10,000,000 AND SoDonHang >= 10, sắp xếp theo TongChiTieu giảm dần
SELECT *
FROM KhachHangThanThiet
WHERE TongChiTieu > 10000000 AND SoDonHang >= 10
ORDER BY TongChiTieu DESC;

-- 2. Khách hàng mới tiềm năng: ở 'Hà Nội' AND SoDonHang < 5 AND TongChiTieu > 2,000,000
SELECT *
FROM KhachHangThanThiet
WHERE ThanhPho = 'Hà Nội' AND SoDonHang < 5 AND TongChiTieu > 2000000;

-- 3. Khách hàng cần "hâm nóng": LanCuoiMuaHang trước '2023-09-01'
SELECT *
FROM KhachHangThanThiet
WHERE LanCuoiMuaHang < '2023-09-01';

-- 4. Cập nhật trạng thái: đánh dấu các khách hàng cần "hâm nóng" bằng 'Khách hàng cũ' trong cột ThanhPho
UPDATE KhachHangThanThiet
SET ThanhPho = 'Khách hàng cũ'
WHERE LanCuoiMuaHang < '2023-09-01';

-- Kiểm tra lại toàn bộ dữ liệu sau khi cập nhật
SELECT * FROM KhachHangThanThiet;



Ss5 bài 6
-- Tạo database
CREATE DATABASE QuanLyKho;
use QuanLyKho;

-- Tạo bảng SanPham
CREATE TABLE SanPham (
    MaSP VARCHAR(10),
    TenSP VARCHAR(255),
    DanhMuc VARCHAR(100),
    SoLuongTon INT,
    NhaCungCap VARCHAR(100),
    NgayNhapKho DATE,
    TrangThai VARCHAR(50)
);

-- Thêm dữ liệu mẫu
INSERT INTO SanPham (MaSP, TenSP, DanhMuc, SoLuongTon, NhaCungCap, NgayNhapKho, TrangThai) VALUES
('DB001', 'Nồi chiên không dầu', 'Đồ bếp', 25, 'Sunhouse Group', '2023-03-15', 'Bán chạy'),
('DD002', 'Máy sấy tóc', 'Điện gia dụng', 50, 'Philips VN', '2023-09-05', 'Hàng mới'),
('DB003', 'Bộ dao làm bếp', 'Đồ bếp', 15, 'Elmich', '2023-02-20', 'Bán chạy'),
('TT004', 'Bàn ủi hơi nước', 'Thiết bị tiện ích', 30, 'Philips VN', '2023-08-10', 'Bán chạy'),
('DB005', 'Máy xay sinh tố', 'Đồ bếp', 8, 'Sunhouse Group', '2023-04-01', 'Tồn kho');

-- 1. Sửa lỗi tên nhà cung cấp
UPDATE SanPham
SET NhaCungCap = 'Tập đoàn Sunhouse'
WHERE NhaCungCap = 'Sunhouse Group';

-- 2. Xác định hàng xả kho: Danh mục 'Đồ bếp' và NgayNhapKho trước '2023-05-01'
SELECT *
FROM SanPham
WHERE DanhMuc = 'Đồ bếp' AND NgayNhapKho < '2023-05-01';

-- 3. Cập nhật trạng thái xả hàng dựa trên kết quả nhiệm vụ 2
UPDATE SanPham
SET TrangThai = 'Xả hàng tồn kho'
WHERE DanhMuc = 'Đồ bếp' AND NgayNhapKho < '2023-05-01';

-- 4. Báo cáo cuối cùng: TrangThai = 'Xả hàng tồn kho' hoặc SoLuongTon < 10, sắp xếp theo SoLuongTon tăng dần
SELECT *
FROM SanPham
WHERE TrangThai = 'Xả hàng tồn kho' OR SoLuongTon < 10
ORDER BY SoLuongTon ASC;




Ss5 bài 7
-- Tạo database mới cho phân tích
CREATE DATABASE sakila_analysis;
USE sakila_analysis;

-- Nhiệm vụ 1
SELECT customer_id, amount, payment_date
FROM payment
WHERE payment_date > '2005-08-01' AND amount > 9.00
ORDER BY amount DESC;

-- Nhiệm vụ 2
SELECT payment_id, customer_id, staff_id, amount
FROM payment
WHERE amount = 0.00
   OR (staff_id = 1 AND amount > 10.00)
ORDER BY customer_id ASC;

