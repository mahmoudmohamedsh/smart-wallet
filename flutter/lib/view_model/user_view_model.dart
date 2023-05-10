import 'package:dio/dio.dart';

import 'auth_view_model.dart';


Future<Response?> getUser(String id,String email,String name , String cash ) async {
  var dio = Dio();
  try {
    var response = await dio.post('${baseUrl}/auth/getUser',
        data: {
          "id": id,
          "email": email,
          "name": name,
          "cash": cash,
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
