import 'package:dio/dio.dart';
//import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../constant/constant.dart';
const String BASE_URL = 'http://10.0.2.2:8080';
Future<Response?> signIn() async {
  var dio = Dio();
  try {
    var response = await dio.post('${BASE_URL}/auth/signin',
        data: {"email": "test@test.com", "password": "12345"},
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

Future<Response?> signupVerify() async {
  var dio = Dio();
  try {
    var response = await dio.post('${BASE_URL}/auth/signupVerify',
        data: {"email": "tes1t@test.com"},
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

Future<Response?> signup() async {
  var dio = Dio();
  try {
    var response = await dio.post('${BASE_URL}/auth/signup',
        data: {
      "email": "tes1t@test.com",
          "password": "12345",
          "otp" : "522509",
          "name" : "mahmoud"
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

Future<Response?> payment() async {
  var dio = Dio();
  try {
    var response = await dio.post('${BASE_URL}/payment',
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
