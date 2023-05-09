import 'package:dio/dio.dart';
//import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../resources/app_urls.dart';

var baseUrl = AppUrl.baseUrl;

// signIn method to enter user for application email and password
Future<Response?> signIn(String email,String password) async {
  var dio = Dio();
  try {
    var response = await dio.post('${baseUrl}/auth/signin',
        data: {"email": email, "password": password},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ));

    print('response $response');
    return response;
  }on DioError catch (e) {
    print(e.response?.data["message"]);//error message
  }
  return null;
}


// signupVerify  method to verify user by email
Future<Response?> signupVerify(String email) async {
  var dio = Dio();
  try {
    var response = await dio.post('${baseUrl}/auth/signupVerify',
        data: {"email": email},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ));

    print('response $response');
    return response;
  }on DioError catch (e) {
    print(e.response?.data["message"]);//error message
  }
  return null;
}


//signup method to create new user by name,email,password and otp

Future<Response?> signup(String email,String password,otp,name) async {
  var dio = Dio();
  try {
    var response = await dio.post('${baseUrl}/auth/signup',
        data: {
      "email": email,
          "password": password,
          "otp" : otp,
          "name" : name
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ));

    print('response $response');
    return response;
  }on DioError catch (e) {
    print(e.response?.data["message"]);//error message
  }
  return null;
}


//payment method to another user

Future<Response?> payment() async {
  var dio = Dio();
  try {
    var response = await dio.post('${baseUrl}/payment',
        data: {


          "to":"test@test.com",
          "amount":90
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization':'Token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3QxQHRlc3QuY29tIiwidXNlcklkIjoiNjQ1ODdlNGYwYTYxZmI5Zjc2ZDZhZGU5IiwiaWF0IjoxNjgzNTQ1NTg0LCJleHAiOjE2ODM1NDkxODR9.7px7thwi-ob5e_TlWKnf4ltp5xXx98Ut8uRAmxLaDIQ'
          },
        ));

    print('response $response');
    return response;
  }on DioError catch (e) {
    print(e.response?.data["message"]);//error message
  }
  return null;
}
