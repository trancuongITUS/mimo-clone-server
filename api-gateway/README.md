https://www.eventstore.com/eventstoredb
cài eventstoreDb và nhớ npm i để tải nest cqrs 


--------------------------------------------------------------------------------
# Hướng dẫn Auth

gọi lên [POST] /authenticate/signup (vd: localhost:8080/authenticate/signup)

body

>

    {
        "email":"email@gmail.com",
        "password": "pass",
        "role" : "user"
    }

khi đăng nhập thì gọi api sau
[POST] /authenticate/login (vd: localhost:8080/authenticate/login )

>

    {
        "email":"email@gmail.com",
        "password": "pass"
    }

lấy idToken lúc response trả về rồi sử dụng [GET] /authenticate để lấy thông tin user

---

các env để test
FIREBASE_PROJECT_ID = "mimocodekid"
FIREBASE_CLIENT_EMAIL = "firebase-adminsdk-yjmgn@mimocodekid.iam.gserviceaccount.com"
FIREBASE_DATABASE_URL = "https://mimocodekid-default-rtdb.asia-southeast1.firebasedatabase.app/"
FIREBASE_PRIVATE_KEY = "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC1FD2QyCvFSRUt\njKyGqCgBQYBvh4AIwjQOWSFVoK+S++JJenwlCT0plscSOWIP75207lmWHFCMNEPc\n9XlHLGElIeAVKKiisGzKdVjK75+XGk1bG0X/iYtlPUDmjK3DX8FaXrhDd4IukYPR\nYUEBLioyL9WORoXFI4tDd/grAgD8cPBJQSDaOJZ4AiD7xwrZtWifyZLOsj6NLwEB\n0RjrMzg8lEpwyMCDNeDFgSNHdzRev8gCrki+P7cTvtg08cBa4H9KV/DVFx6HqNoW\nj8ZXzp9RmT+Rlcocyfuu3vQez/oQPmzDgm5t6JX4zyxhVMbeP6a/p1vg1U5/3YFa\nUxb5Z9rLAgMBAAECggEAGUEbkwPagux9586M80d5iNn4o9VgiG2ECBTrNBTcgnc0\naJi3aWI/+vsR2YX8718KU4UYeSSKy/sFafLRuW5EQC2uIb/8FkXdGQwZAviSJ+dI\nWZ1Upl5+/UgiiI+fM7aOR2BwJMytRc8P9NWHqjak4On7R+6oUnByHZ9E58P4R5Hr\nNLMtkup/TB4Fy9KRmEAlEwSduACZeN2kLS/Xr8D1xmqxe2xOiVHBane4EzpGR1kq\ne4OhlP+J7mXjOW02m0OMMeBYQ3yZR8cWgKk6GSyO5b4/rAUGxxOB+AOqtlC36Rpx\nxJqPzHbCJCisNZCI1nlvq4CJexcmKcZWVk5FM4LcRQKBgQD+XCzLz7Vo5F2RIKpw\nlilXb0/gHrgOeCRO+FDvMMQ3NEc5n5yB14g5uBA5lPj2etdyf73iFsZgRGgiQg2O\neg+xlwizKt3A9tz5aH5cHFfZFSJcqG4S76V+BN/+mnqwWFyS1r+TwntJtZKcXDR3\n79qysytBS/gako5Cy19H3Amq3wKBgQC2Px04yGRtqAh/bcHgex0K7y2clLdjjZAP\naEtDfj6U5pWs22k9EhPfEnNlI/CnvnUZTrDw4p++u0o2AfdbMOQ826GGccSbDBLd\ntEBdD9UCwOlJ1WKVz5xAu0ON4dv6WkOaiBEj05IL41UM1jcEM0hDoGeOO7llg1ch\nVk6vrnx5lQKBgQDn6FJPYIkdoVhNwWKkU8RNm4dP57IYPyGbfnsMGYJMcrWdrBCd\nsUzakx734QM8drOICT+uquUjUDtBQMfrZw539CRSdnrIPEssekD66jyOB97UbBwv\n158jTn6LO30w2t9MYc85gM+3XHzXYpnT4DOdSg3d8s26LHTYIWQ1uEB4MQKBgHRJ\nzYGgDMUTxWhaRq3QoPWLLJWPJ320pMnQCMZmVdR5VeRYlMxNLrTWdx+AUV0X4Gxn\nk+wBD2GK7I2Nr6JWjixvEKBTE9rDV350N+Wp5oe9RJ7CNAfX06JSW4a7KbyTwDNo\nw1cS90vyoSBxx+U8O847Ghjd7yzhI8W35rmfIvoJAoGAPiuC5oYXz9UGWdCZDS3W\nQXA7m1AjJtrnTuMvUIhaWpLaZdf65rQ/OlGCAmmQ2LHmUfkYAywfs1QM/d2jpt8i\nA4kEAo3Yd2/ftHmpJKcgG9vj8+RpraR60c43/jdhSuhidQB3hFReSP7rKMUR+LVt\n9hzllWqh1k2oIK68UOomLvw=\n-----END PRIVATE KEY-----\n"
FIREBASE_API_KEY = "AIzaSyCqgMZqFVp_axzXoGgdtrc5nBXcgTnubBg"

