## Tìm hiểu cấu trúc database khóa học của mimo

Xem cấu trúc tạm thời của database khóa học của mimo ở [đây](https://dbdiagram.io/d/hihi-6607ba1837b7e33fd716ebf6).
Tạm thời demo bảng Course trước vì các bảng kia chưa chắc chắn đúng.
Bảng Course sẽ chứa thông tin của 6 khóa học chính ở trong mimo: HTML, CSS, Javascript, SQL, Python, Swift.

## Tạo bảng và thêm dữ liệu vào postgres ở local

1. Tạo database mới ở postgres local đặt tên là: mimo-clone.
2. Dùng script ở course.sql paste vào query tool để tạo và thêm dữ liệu vào bảng.

## Kết nối database ở local

Modify lại các từ được viết in hoa ở giá trị của biến DATABASE_URL trong .env.sample để phù hợp với cấu hình postgresql của máy mình.

## Dùng prisma để thao tác với postgres sau khi hoàn thành bước ở trên

```bash
# Cập nhật lại prisma schema
$ npx prisma db pull

# Cập nhật lại prisma client sau khi prisma schema có sự thay đổi
$ npx prisma generate
```

## Lấy thông tin của tất cả các khóa học

Url: http://localhost:3001/course