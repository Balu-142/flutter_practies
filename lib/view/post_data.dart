import 'dart:convert';
import 'package:dio/dio.dart';

class ApiService {
  static final Dio dio = Dio();

  static Future<String> sendData(String name, String mobile, String email) async {
    var data = {
      "name": name,
      "mobile": mobile,
      "email": email,
    };

    try {
      var response = await dio.post(
        'http://localhost/yii-basic/basic/web/v1/login/create',
        data: jsonEncode(data),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        return json.encode(response.data);
      } else {
        return 'Error: ${response.statusMessage}';
      }
    } catch (e) {
      return 'Exception: $e';
    }
  }
}
