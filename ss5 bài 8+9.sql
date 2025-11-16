Ss5 bài 8
-- Tạo database mới
CREATE DATABASE sakila_cust_demo;
USE sakila_cust_demo;

-- Sao chép bảng customer từ cơ sở dữ liệu sakila sang database mới
CREATE TABLE customer AS
SELECT * FROM sakila.customer;

-- Nhiệm vụ 1: Thêm một Khách hàng Mới
INSERT INTO customer (store_id, first_name, last_name, email, address_id, active, create_date)
VALUES (2, 'ANNA', 'HILL', 'ANNA.HILL@sakilacustomer.org', 5, 1, NOW());

-- Nhiệm vụ 2: Cập nhật Địa chỉ Email cho nhóm khách hàng có first_name = 'JENNIFER'
UPDATE customer
SET email = REPLACE(email, '@sakilacustomer.org', '@sakilacustomer.com')
WHERE first_name = 'JENNIFER';

-- Nhiệm vụ 3: Xử lý yêu cầu tạ





ss5 bài 9
-- Nhiệm vụ 1: Xác định danh sách phim áp dụng khuyến mãi
SELECT film_id, title, rating, length, rental_rate
FROM sakila.film
WHERE (rating = 'PG' OR rating = 'G')
  AND length > 100
  AND rental_rate >= 2.99
ORDER BY rental_rate DESC;

-- Nhiệm vụ 2: Thực thi chiến dịch giảm giá (giảm 50%)
UPDATE sakila.film
SET rental_rate = rental_rate / 2
WHERE (rating = 'PG' OR rating = 'G')
  AND length > 100
  AND rental_rate >= 2.99;

/*
Nhiệm vụ 3: Thiết kế Kế hoạch "Hoàn tác" và Phân tích Rủi ro

Rủi ro:
- Nếu câu lệnh UPDATE được chạy mà không có WHERE hoặc WHERE sai, tất cả phim có thể bị giảm giá sai, dẫn đến doanh thu bị giảm mạnh không mong muốn.
- Việc cập nhật sai dữ liệu hàng loạt có thể gây mất lòng tin khách hàng và khó khăn trong quản lý tồn kho.

Kế hoạch Hoàn tác (Rollback Plan):
- Trước khi chạy UPDATE, tốt nhất nên tạo một cột mới original_rental_rate để lưu giá gốc.
- Nếu UPDATE bị sai, có thể khôi phục giá thuê cũ bằng lệnh:

-- Ví dụ rollback (nếu lưu giá gốc trong original_rental_rate)
-- UPDATE sakila.film
-- SET rental_rate = original_rental_rate
-- WHERE (rating = 'PG' OR rating = 'G') AND length > 100 AND rental_rate < original_rental_rate;

- Nếu không có cột lưu giá gốc, cần có backup database trước khi chạy lệnh để khôi phục.

Đề xuất cải tiến:
1. Tạo cột original_rental_rate để lưu giá thuê ban đầu trước khi chạy bất kỳ chiến dịch giảm giá nào.
   Ví dụ: 
   -- ALTER TABLE sakila.film ADD COLUMN original_rental_rate DECIMAL(4,2);
   -- UPDATE sakila.film SET original_rental_rate = rental_rate;
2. Luôn chạy SELECT kiểm tra danh sách phim trước khi UPDATE.
3. Sử dụng transaction: BEGIN TRANSACTION; ... COMMIT; hoặc ROLLBACK; nếu phát hiện lỗi trong quá trình cập nhật.

Kết luận:
- Việc lập kế hoạch rollback và lưu trữ giá gốc giúp đảm bảo an toàn dữ liệu, giảm rủi ro kinh doanh và nâng cao quy trình quản trị dữ liệu chuyên nghiệp.
*/
