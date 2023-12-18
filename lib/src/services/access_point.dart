import 'dart:convert';
import 'package:flutter_app/src/models/types.dart';
import 'package:flutter_app/src/models/user_register.dart';
import 'package:http/http.dart' as http;

class AccessPoint {
  static String urlHost = 'localhost:3011';

  static Future<ResponseToken> token(Credenciales credenciales) async {
    final String post = json.encode(
        {'email': credenciales.email, 'password': credenciales.password});
    final Uri url = Uri.http(AccessPoint.urlHost, 'api/login/token');
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: post);
    final res = jsonDecode(response.body) as Map<String, dynamic>;
    return Future.value(
        ResponseToken(token: res['token'], success: res['success']));
  }

  static Future<http.Response> register(UserRegister userRegister) async {
    final String post = json.encode(userRegister.toMapper());
    final Uri url = Uri.http(AccessPoint.urlHost, 'api/login/signup');
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: post);
    return response;
  }

  static Future<http.Response> listClientes(String token) async {
    final Uri url = Uri.http(AccessPoint.urlHost, 'api/clientes');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    return response;
  }

  static Future<http.Response> listUsuarios(String token) async {
    final Uri url = Uri.http(AccessPoint.urlHost, 'api/users');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    print('${response.statusCode}');
    print(response.body);
    return response;
  }

  static Future<http.Response> loadClientes(String token) async {
    final Uri url = Uri.http(AccessPoint.urlHost, 'api/clientes/load');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    print('${response.statusCode}');
    print(response.body);
    return response;
  }
}
