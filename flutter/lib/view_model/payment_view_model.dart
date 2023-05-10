//payment method to another user

import 'package:dio/dio.dart';

import '../resources/app_urls.dart';

var baseUrl = AppUrl.baseUrl;

Future<Response?> payment() async {
  var dio = Dio();
  try {
    var response = await dio.post('${baseUrl}/payment',
        data: {"to": "test@test.com", "amount": 90},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization':
                'Token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3QxQHRlc3QuY29tIiwidXNlcklkIjoiNjQ1ODdlNGYwYTYxZmI5Zjc2ZDZhZGU5IiwiaWF0IjoxNjgzNTQ1NTg0LCJleHAiOjE2ODM1NDkxODR9.7px7thwi-ob5e_TlWKnf4ltp5xXx98Ut8uRAmxLaDIQ'
          },
        ));

    print('response $response');
    return response;
  } on DioError catch (e) {
    print(e.response?.data["message"]); //error message
  }
  return null;
}
