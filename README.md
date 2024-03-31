## Tìm hiểu cấu trúc database khóa học của mimo

Xem cấu trúc tạm thời của database khóa học của mimo ở [đây](https://dbdiagram.io/d/hihi-6607ba1837b7e33fd716ebf6).

## Sử dụng biến môi trường

Tạo file .env ở bên trong api-gateway và demo-microservices và copy giá trị từ các file .env.sample dán vào đó.

## Cấu hình kết nối database postgres ở local bằng prisma

Modify lại các từ được viết in hoa ở giá trị của biến DATABASE_URL trong .env.sample (demo-microservices) để phù hợp với cấu hình postgresql của máy mình.

## Tạo database và các tables

```bash
$ npx prisma migrate dev --name init
```

## Thêm records vào bảng courses

1. Mở query tool của bảng courses
2. Copy nội dung của course.sql, paste vào query tool và chạy.

## Thêm records vào bảng sections

1. Mở query tool của bảng sections
2. Copy nội dung của section.sql, paste vào query tool và chạy.

## Cập nhật prisma schema và prisma client sau khi thêm records vào bảng courses và sections

```bash
# Cập nhật lại prisma schema
$ npx prisma db pull

# Cập nhật lại prisma client sau khi prisma schema có sự thay đổi
$ npx prisma generate
```

## Lấy thông tin của tất cả các khóa học

Url: http://localhost:3001/course

## Lấy thông tin của tất cả các section

Url: http://localhost:3001/section

## Lấy thông tin của một khóa học theo id

Url: http://localhost:3001/course/:id
