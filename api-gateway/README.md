# Hướng dẫn Auth


gọi lên [POST] /authenticate (vd: localhost:8080/authenticate)

body

>
    {
        "email":"email@gmail.com",
        "password": "pass",
        "role" : "user"
    }


khi đăng nhập thì gọi api sau [POST]
https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCqgMZqFVp_axzXoGgdtrc5nBXcgTnubBg

>
    {
        "email":"email@gmail.com",
        "password": "pass",
        "returnSecureToken":true
    }

lấy idToken lúc response trả về rồi sử dụng [GET] /authenticate để lấy thông tin user

hiện chưa apply auth vào các endpoint api

ai đọc đc nếu có thể thì làm giúp vs

