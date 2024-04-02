## Tìm hiểu cấu trúc database khóa học của mimo

Xem cấu trúc tạm thời của database khóa học của mimo ở [đây](https://dbdiagram.io/d/hihi-6607ba1837b7e33fd716ebf6).

## Sử dụng biến môi trường

Tạo file .env ở bên trong api-gateway và demo-microservices và copy giá trị từ các file .env.sample dán vào đó.

## Cấu hình kết nối database postgres ở local bằng prisma

Modify lại các từ được viết in hoa ở giá trị của biến DATABASE_URL trong .env.sample (demo-microservices) để phù hợp với cấu hình postgresql của máy mình.

## Tạo database và các tables 

```bash
# Đứng ở vị trí folder demo-microservices
$ npx prisma migrate dev --name init
```

## Thêm dữ liệu vào bảng courses trước

1. Mở query tool của bảng courses
2. Copy nội dung của course.sql, paste vào query tool và chạy.

## Sau đó thêm dữ liệu vào bảng sections

1. Mở query tool của bảng sections
2. Copy nội dung của section.sql, paste vào query tool và chạy.

## Sau đó thêm dữ liệu vào bảng sections_courses

1. Mở query tool của bảng sections_courses
2. Copy nội dung của section_course.sql, paste vào query tool và chạy.

## Cập nhật lại prisma schema và prisma client sau khi đã thêm dữ liệu vào các bảng trên

```bash
# Đứng ở vị trí folder demo-microservices
# Cập nhật lại prisma schema
$ npx prisma db pull

# Cập nhật lại prisma client sau khi prisma schema có sự thay đổi
$ npx prisma generate
```

## Chạy service

```bash
# Đứng ở vị trí folder demo-microservices
$ npm run start:dev
```

## Chạy api-gateway

```bash
# Đứng ở vị trí folder api-gateway
$ npm run start:dev
```

## Kiểm tra các Api bằng Swagger

Url: http://localhost:3001/api
