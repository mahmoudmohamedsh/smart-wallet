# ODCSmartWallet

/auth/signupVerify
send 
{
    "email":"test1@test.com"
}
get 
otp print in terminal
{"message":"otp generated successfully !","email":"test1@test.com"}

/auth/signup
send 
{
    "email":"test1@test.com",
    "password":"12345",
    "otp":316310,
    "name":"mahmoud"
}
get
{"message":"user created successfully","userId":"64587e4f0a61fb9f76d6ade9"}

---

/auth/signin
send 
{
    "email":"test1@test.com",
    "password":"12345"
}
get

{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3QxQHRlc3QuY29tIiwidXNlcklkIjoiNjQ1ODdlNGYwYTYxZmI5Zjc2ZDZhZGU5IiwiaWF0IjoxNjgzNTIxMjMwLCJleHAiOjE2ODM1MjQ4MzB9.wDFmxfI1_K0M7C_KuDmZxgD5rWABZ3mk0H6wWuDgbcg",
    "userId": "64587e4f0a61fb9f76d6ade9"
}

---

http://localhost:8080/auth/addChild
{ 
    "email": "tesqt@test.com",
    "password":"12345",
    "name":"mahmoud"
}


{
    "message": "user created successfully",
    "userId": "64587e4f0a61fb9f76d6ade9"
}

---

http://localhost:8080/auth/getChild

{
    "message": "success 1",
    "data": [
        "645a839b520015ed2569fb00"
    ]
}

---

http://localhost:8080/auth/getReq


{
    "message": "success",
    "data": []
}

---

/payment