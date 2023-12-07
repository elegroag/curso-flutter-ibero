import 'dart:convert';
import 'package:flutter_app/src/models/user_register.dart';
import 'package:http/http.dart' as http;

class AccessPoint {
  static String urlHost = 'localhost:3011';

  static Future<http.Response> token(String email, String password) async {
    final data = '$email:$password';
    print(data);
    final Codec<String, String> stringToBase64 = utf8.fuse(base64);
    print(stringToBase64.encode(data));
    return await http.get(Uri.parse('${AccessPoint.urlHost}/api/login/token'));
  }

  static Future<http.Response> register(UserRegister userRegister) async {
    print(userRegister);
    final String post = json.encode(userRegister.toMapper());
    final Uri url = Uri.http(AccessPoint.urlHost, 'api/login/register');
    return await http.post(url, body: post);
  }
}
